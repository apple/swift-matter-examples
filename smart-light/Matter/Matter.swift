//===----------------------------------------------------------------------===//
//
// This source file is part of the Swift open source project
//
// Copyright (c) 2024 Apple Inc. and the Swift project authors.
// Licensed under Apache License v2.0 with Runtime Library Exception
//
// See https://swift.org/LICENSE.txt for license information
//
//===----------------------------------------------------------------------===//

enum Matter {}

extension Matter {
  class Node {
    var identifyHandler: (() -> Void)? = nil

    var endpoints: [Endpoint] = []

    func addEndpoint(_ endpoint: Endpoint) {
      endpoints.append(endpoint)
    }

    // swift-format-ignore: NeverUseImplicitlyUnwrappedOptionals
    // This is never actually nil after init(), and inside init we want to form a callback closure that references self.
    var innerNode: RootNode!

    init() {
      // Initialize persistent storage.
      nvs_flash_init()

      // For now, leak the object, to be able to use local variables to declare it. We don't expect this object to be created and destroyed repeatedly.
      _ = Unmanaged.passRetained(self)

      // Create the actual root node object, wire up callbacks.
      let root = RootNode(
        attribute: self.eventHandler,
        identify: { _, _, _, _ in self.identifyHandler?() })
      guard let root else {
        fatalError("Failed to setup root node.")
      }
      self.innerNode = root
    }

    func eventHandler(
      type: MatterAttributeEvent, endpoint: __idf_main.Endpoint,
      cluster: Cluster, attribute: UInt32,
      value: UnsafeMutablePointer<esp_matter_attr_val_t>?
    ) {
      guard type == .didSet else { return }
      guard let e = self.endpoints.first(where: { $0.id == endpoint.id }) else {
        return
      }
      let value: Int = Int(value?.pointee.val.u64 ?? 0)
      guard let a = Endpoint.Attribute(cluster: cluster, attribute: attribute)
      else { return }
      e.eventHandler?(Endpoint.Event(type: type, attribute: a, value: value))
    }
  }
}

extension Matter {
  class Endpoint {
    init(node: Node) {
      // For now, leak the object, to be able to use local variables to declare it. We don't expect this object to be created and destroyed repeatedly.
      _ = Unmanaged.passRetained(self)
    }

    var id: Int = 0

    var eventHandler: ((Event) -> Void)? = nil

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
      case unknown(UInt32)

      init?(cluster: Cluster, attribute: UInt32) {
        if cluster.as(OnOff.self) != nil {
          switch attribute {
          case OnOff.AttributeID<OnOff.OnOffState>.state.rawValue: self = .onOff
          default: return nil
          }
        } else if cluster.as(LevelControl.self) != nil {
          switch attribute {
          case LevelControl.AttributeID<LevelControl.CurrentLevel>.currentLevel
            .rawValue:
            self = .levelControl
          default: return nil
          }
        } else if cluster.as(ColorControl.self) != nil {
          switch attribute {
          case ColorControl.AttributeID<ColorControl.CurrentHue>.currentHue
            .rawValue:
            self = .colorControl(.currentHue)
          case ColorControl.AttributeID<ColorControl.CurrentSaturation>
            .currentSaturation.rawValue:
            self = .colorControl(.currentSaturation)
          case ColorControl.AttributeID<ColorControl.CurrentX>.currentX.rawValue:
            self = .colorControl(.currentX)
          case ColorControl.AttributeID<ColorControl.CurrentY>.currentY.rawValue:
            self = .colorControl(.currentY)
          case ColorControl.AttributeID<ColorControl.ColorTemperatureMireds>
            .colorTemperatureMireds.rawValue:
            self = .colorControl(.colorTemperatureMireds)
          case ColorControl.AttributeID<ColorControl.ColorMode>.colorMode
            .rawValue:
            self = .colorControl(.colorMode)
          default: return nil
          }
        } else {
          self = .unknown(attribute)
        }
      }
    }

    struct Event {
      var type: MatterAttributeEvent
      var attribute: Attribute
      var value: Int
    }
  }
}

extension Matter {
  class ExtendedColorLight: Endpoint {
    override init(node: Node) {
      super.init(node: node)

      var lightConfig = esp_matter.endpoint.extended_color_light.config_t()
      lightConfig.on_off.on_off = true
      lightConfig.level_control.current_level = .init(64)
      lightConfig.level_control_lighting.start_up_current_level = .init(64)
      lightConfig.color_control.color_mode =
        chip.app.Clusters.ColorControl.ColorMode.colorTemperature.rawValue
      lightConfig.color_control.enhanced_color_mode =
        chip.app.Clusters.ColorControl.ColorMode.colorTemperature.rawValue

      let light = MatterExtendedColorLight(
        node.innerNode, configuration: lightConfig)
      self.id = Int(light.id)

      var hsv = esp_matter.cluster.color_control.feature.hue_saturation
        .config_t()
      hsv.current_hue = 255
      hsv.current_saturation = 255
      light.colorControl.add(hsv)
    }
  }
}

extension Matter {
  class Application {
    var rootNode: Node? = nil

    init() {
      // For now, leak the object, to be able to use local variables to declare
      // it. We don't expect this object to be created and destroyed repeatedly.
      _ = Unmanaged.passRetained(self)
    }

    func start() {
      func callback(
        event: UnsafePointer<chip.DeviceLayer.ChipDeviceEvent>?, context: Int
      ) {
        // Ignore callback if event not set.
        guard let event else { return }
        switch Int(event.pointee.Type) {
        case chip.DeviceLayer.DeviceEventType.kFabricRemoved:
          recomissionFabric()
        default: break
        }
      }
      esp_matter.start(callback, 0)
    }
  }
}

func print(_ a: Matter.Endpoint.Attribute) {
  switch a {
  case .onOff: print("onOff")
  case .levelControl: print("levelControl")
  case .colorControl(let a):
    print("colorControl(", terminator: "")
    switch a {
    case .currentHue: print("currentHue", terminator: "")
    case .currentSaturation: print("currentSaturation", terminator: "")
    case .currentX: print("currentX", terminator: "")
    case .currentY: print("currentY", terminator: "")
    case .colorTemperatureMireds:
      print("colorTemperatureMireds", terminator: "")
    case .colorMode: print("colorMode", terminator: "")
    }
    print(")")
  case .unknown: print("unknown")
  }
}
