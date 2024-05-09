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

protocol MatterCluster {
  var cluster: UnsafeMutablePointer<esp_matter.cluster_t> { get }

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>)
}

extension MatterCluster {
  init?(endpoint: some MatterEndpoint, id: UInt32) {
    guard let cluster = esp_matter.cluster.get_shim(endpoint.endpoint, id) else {
      return nil
    }
    self.init(cluster)
  }
}

protocol MatterConcreteCluster: MatterCluster {
  static var clusterTypeId: ClusterID<Self> { get }
}

struct ClusterID<Cluster: MatterCluster>: RawRepresentable {
  var rawValue: UInt32

  init(rawValue: UInt32) { self.rawValue = rawValue }

  static var identify: ClusterID<Identify> { .init(rawValue: 0x0000_0003) }
  static var onOff: ClusterID<OnOff> { .init(rawValue: 0x0000_0006) }
  static var levelControl: ClusterID<LevelControl> { .init(rawValue: 0x0000_0008) }
  static var colorControl: ClusterID<ColorControl> { .init(rawValue: 0x0000_0300) }
}

struct Cluster: MatterCluster {
  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func `as`<T: MatterConcreteCluster>(_ type: T.Type) -> T? {
    let expected = T.clusterTypeId
    let id = esp_matter.cluster.get_id(cluster)
    if id == expected.rawValue {
      return T(cluster)
    }
    return nil
  }
}

struct Identify: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .identify }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute {
    Attribute(attribute: esp_matter.attribute.get_shim(cluster, id.rawValue))
  }
}

struct OnOff: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .onOff }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var state: AttributeID<OnOffState> { .init(rawValue: 0x0000_0000) }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute {
    Attribute(attribute: esp_matter.attribute.get_shim(cluster, id.rawValue))
  }

  var state: OnOffState { attribute(.state) }
}

struct LevelControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .levelControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var currentLevel: AttributeID<CurrentLevel> { .init(rawValue: 0x0000_0000) }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute {
    Attribute(attribute: esp_matter.attribute.get_shim(cluster, id.rawValue))
  }

  var currentLevel: CurrentLevel { attribute(.currentLevel) }
}

struct ColorControl: MatterConcreteCluster {
  static var clusterTypeId: ClusterID<Self> { .colorControl }
  struct AttributeID<Attribute: MatterAttribute>: MatterAttributeID {
    var rawValue: UInt32

    init(rawValue: UInt32) { self.rawValue = rawValue }

    static var currentHue: AttributeID<CurrentHue> { .init(rawValue: 0x0000_0000) }
    static var currentSaturation: AttributeID<CurrentSaturation> { .init(rawValue: 0x0000_0001) }
    static var currentX: AttributeID<CurrentX> { .init(rawValue: 0x0000_0003) }
    static var currentY: AttributeID<CurrentY> { .init(rawValue: 0x0000_0004) }
    static var colorTemperatureMireds: AttributeID<ColorTemperatureMireds> { .init(rawValue: 0x0000_0007) }
    static var colorMode: AttributeID<ColorMode> { .init(rawValue: 0x0000_0008) }
  }

  var cluster: UnsafeMutablePointer<esp_matter.cluster_t>

  init(_ cluster: UnsafeMutablePointer<esp_matter.cluster_t>) {
    self.cluster = cluster
  }

  func attribute<Attribute: MatterAttribute>(_ id: AttributeID<Attribute>) -> Attribute {
    Attribute(attribute: esp_matter.attribute.get_shim(cluster, id.rawValue))
  }

  var currentHue: CurrentHue { attribute(.currentHue) }
  var currentSaturation: CurrentSaturation { attribute(.currentSaturation) }
  var currentX: CurrentX { attribute(.currentX) }
  var currentY: CurrentY { attribute(.currentY) }
  var colorTemperatureMireds: ColorTemperatureMireds { attribute(.colorTemperatureMireds) }
  var colorMode: ColorMode { attribute(.colorMode) }

  func add(_ config: esp_matter.cluster.color_control.feature.hue_saturation.config_t) {
    var cfg = config
    esp_matter.cluster.color_control.feature.hue_saturation.add(cluster, &cfg)
  }
}
