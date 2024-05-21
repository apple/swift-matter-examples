//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2023 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

protocol MatterNode {
  var node: UnsafeMutablePointer<esp_matter.node_t> { get }
}

protocol MatterEndpoint {
  var endpoint: UnsafeMutablePointer<esp_matter.endpoint_t> { get }
}

protocol MatterConreteEndpoint: MatterEndpoint {
  static var deviceTypeId: UInt32 { get }

  init(_ endpoint: UnsafeMutablePointer<esp_matter.endpoint_t>)
}

extension MatterEndpoint {
  var id: UInt16 { esp_matter.endpoint.get_id(endpoint) }

  func cluster<Cluster: MatterCluster>(_ id: ClusterID<Cluster>) -> Cluster {
    Cluster(esp_matter.cluster.get_shim(endpoint, id.rawValue))
  }
}

struct RootNode: MatterNode {
  final class Context {
    var attribute: (MatterAttributeEvent, Endpoint, Cluster, UInt32, UnsafeMutablePointer<esp_matter_attr_val_t>?) -> Void
    var identify: (esp_matter.identification.callback_type_t, UInt16, UInt8, UInt8) -> Void

    init(
      attribute: @escaping (MatterAttributeEvent, Endpoint, Cluster, UInt32, UnsafeMutablePointer<esp_matter_attr_val_t>?) -> Void,
      identify: @escaping (esp_matter.identification.callback_type_t, UInt16, UInt8, UInt8) -> Void
     ) {
      self.attribute = attribute
      self.identify = identify
    }
  }

  var node: UnsafeMutablePointer<esp_matter.node_t>
  let context: Context

  init?(
    attribute: @escaping (MatterAttributeEvent, Endpoint, Cluster, UInt32, UnsafeMutablePointer<esp_matter_attr_val_t>?) -> Void,
    identify: @escaping (esp_matter.identification.callback_type_t, UInt16, UInt8, UInt8) -> Void
  ) {
    var nodeConfig = esp_matter.node.config_t()
    esp_matter.attribute.set_callback_shim { type, endpoint, cluster, attribute, value, context in 
      guard let context else {
        return ESP_OK
      }
      guard let e = Endpoint(id: endpoint) else { return ESP_OK }
      guard let c = Cluster(endpoint: e, id: cluster) else { return ESP_OK }
      let ctx = Unmanaged<Context>.fromOpaque(context).takeUnretainedValue()
      ctx.attribute(MatterAttributeEvent(type), e, c, attribute, value)
      return ESP_OK
    }
    esp_matter.identification.set_callback { type, endpoint, effect, variant, context in
      Unmanaged<Context>.fromOpaque(context!).takeUnretainedValue().identify(type, endpoint, effect, variant)
      return ESP_OK
    }
    guard let node = esp_matter.node.create_raw() else {
      return nil
    }
    
    let context = Context(attribute: attribute, identify: identify)
    withUnsafeMutablePointer(to: &nodeConfig.root_node) {
      // transfer ownership to the node... this is a leak for now
      _ = esp_matter.endpoint.root_node.create(node, $0, 0x00, Unmanaged.passRetained(context).toOpaque())
    }
    self.node = node
    self.context = context
  }

  var endpoint: Endpoint {
    Endpoint(esp_matter.endpoint.get(node, 0))
  }
}

struct Endpoint: MatterEndpoint {
  var endpoint: UnsafeMutablePointer<esp_matter.endpoint_t>

  init(_ endpoint: UnsafeMutablePointer<esp_matter.endpoint_t>) {
    self.endpoint = endpoint
  }

  init?(id: UInt16) {
    guard let root = esp_matter.node.get() else { return nil }
    guard let endpoint = esp_matter.endpoint.get(root, id) else { return nil }
    self.init(endpoint)
  }

  func `as`<T: MatterConreteEndpoint>(_ type: T.Type) -> T? {
    var count = UInt8(0)
    let expected = T.deviceTypeId
    let ids = esp_matter.endpoint.get_device_type_ids(endpoint, &count)
    for id in UnsafeMutableBufferPointer(start: ids, count: Int(count)) {
      if id == expected {
        return T(endpoint)
      }
    }
    return nil
  }
}

struct MatterExtendedColorLight: MatterConreteEndpoint {
  static var deviceTypeId: UInt32 { esp_matter.endpoint.extended_color_light.get_device_type_id() }

  var endpoint: UnsafeMutablePointer<esp_matter.endpoint_t>

  init(_ node: RootNode, configuration: esp_matter.endpoint.extended_color_light.config_t) {
    var config = configuration
    endpoint = esp_matter.endpoint.extended_color_light.create(node.node, &config, 0x00, Unmanaged.passRetained(node.context).toOpaque())
  }

  init(_ endpoint: UnsafeMutablePointer<esp_matter.endpoint_t>) {
    self.endpoint = endpoint
  }

  var levelControl: LevelControl {
    cluster(.levelControl)
  }

  var colorControl: ColorControl {
    cluster(.colorControl)
  }

  var onOff: OnOff {
    cluster(.onOff)
  }
}

func print(_ a: Matter.Endpoint.Attribute) {
  switch a {
    case .onOff: print("onOff")
    case .levelControl: print("levelControl")
    case .colorControl(let a):
      print("colorControl(", terminator: "")
      print(a, terminator: "")
      print(")")
    case .unknown: print("unknown")
  }
}

func print(_ a: Matter.Endpoint.ColorControlAttribute, terminator: StaticString) {
  switch a {
    case .currentHue: print("currentHue", terminator: terminator)
    case .currentSaturation: print("currentSaturation", terminator: terminator)
    case .currentX: print("currentX", terminator: terminator)
    case .currentY: print("currentY", terminator: terminator)
    case .colorTemperatureMireds: print("colorTemperatureMireds", terminator: terminator)
    case .colorMode: print("colorMode", terminator: terminator)
  }
}

enum Matter {
  class Node {
    var identifyHandler: (()->())? = nil

    var endpoints: [Endpoint] = []

    func addEndpoint(_ endpoint: Endpoint) {
      endpoints.append(endpoint)
    }

    var innerNode: RootNode!

    init() {
      nvs_flash_init()

      _ = Unmanaged.passRetained(self) // leak

      innerNode = RootNode(attribute: { type, endpoint, cluster, attribute, value in
        //print("event")
        guard type == .didSet else { return }
        for e in self.endpoints {
          //print(e.id)
          //print(endpoint.id)
          if e.id == endpoint.id {
            let value: Int = Int(value?.pointee.val.u64 ?? 0)

            var a: Endpoint.Attribute = .unknown(0)
            if let _ = cluster.as(OnOff.self) {
              a = .onOff
              if attribute != 0x0 { return }
            }
            if let _ = cluster.as(LevelControl.self) {
              a = .levelControl
              if attribute != 0x0 { return }
            }
            if let _ = cluster.as(ColorControl.self) {
              if attribute == 0x00000000 { a = .colorControl(.currentHue) }
              else if attribute == 0x00000001 { a = .colorControl(.currentSaturation) }
              else if attribute == 0x00000003 { a = .colorControl(.currentX) }
              else if attribute == 0x00000004 { a = .colorControl(.currentY) }
              else if attribute == 0x00000007 { a = .colorControl(.colorTemperatureMireds) }
              else if attribute == 0x00000008 { a = .colorControl(.colorMode) }
              else { return }
            }

            e.eventHandler?(Endpoint.Event(type: type, attribute: a, value: value))
          }
        }
      }, identify: { type, endpoint, effect, variant in
        self.identifyHandler?()
      })

      if innerNode == nil {
        print("Unable to create root node")
        return
      }
    }
  }

  class Endpoint {
    init(node: Node) {
      _ = Unmanaged.passRetained(self) // leak
    }

    var id: Int = 0

    var eventHandler: ((Event)->())? = nil

    enum ColorControlAttribute {
      case currentHue
      case currentSaturation
      case currentX
      case currentY
      case colorTemperatureMireds
      case colorMode
    }

    enum Attribute {
      case onOff
      case levelControl
      case colorControl(ColorControlAttribute)

      case unknown(UInt16)
    }

    struct Event {
      var type: MatterAttributeEvent
      var attribute: Attribute
      var value: Int
    }
  }

  class ExtendedColorLight: Endpoint {
    var configuration: Configuration = .default

    struct Configuration {
      static var `default`: Configuration = .init()
      var onOff: Bool = false
      var levelControl: Int = 64
      var colorMode: Int = 0
      var enhancedColorMode: Int = 0
    }

    override init(node: Node) {
      super.init(node: node)

      var lightConfig = esp_matter.endpoint.extended_color_light.config_t()
      lightConfig.on_off.on_off = true
      lightConfig.level_control.current_level = .init(64)
      lightConfig.level_control.lighting.start_up_current_level = .init(64)
      lightConfig.color_control.color_mode = chip.app.Clusters.ColorControl.ColorMode.colorTemperature.rawValue
      lightConfig.color_control.enhanced_color_mode = chip.app.Clusters.ColorControl.ColorMode.colorTemperature.rawValue

      let light = MatterExtendedColorLight(node.innerNode, configuration: lightConfig)
      self.id = Int(light.id)

      var hsv = esp_matter.cluster.color_control.feature.hue_saturation.config_t()
      hsv.current_hue = 255
      hsv.current_saturation = 255
      light.colorControl.add(hsv)

      //light.update(led)
    }
  }


  class Application {
    var rootNode: Node? = nil

    var eventHandler: ((Event)->())? = nil

    struct Event {
      var type: Int
    }

    init() {
      _ = Unmanaged.passRetained(self) // leak
    }

    func start() {
      

      esp_matter.start({ event, context in
        switch Int(event!.pointee.Type) {
        case chip.DeviceLayer.DeviceEventType.kFabricRemoved: recomissionFabric()
        default: break
        }
      }, 0)
    }
  }
}
