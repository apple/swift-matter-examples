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

protocol MatterAttribute {
  var attribute: UnsafeMutablePointer<esp_matter.attribute_t> { get }

  init(attribute: UnsafeMutablePointer<esp_matter.attribute_t>)
}

extension MatterAttribute {
  var value: esp_matter_attr_val_t {
    var val = esp_matter_attr_val_t()
    esp_matter.attribute.get_val(attribute, &val)
    return val
  }
}

enum MatterAttributeEvent: esp_matter.attribute.callback_type_t.RawValue {
  case willSet = 0
  case didSet = 1
  case read = 2
  case write = 3

  var description: StaticString {
    switch self {
    case .willSet: "willSet"
    case .didSet: "didSet"
    case .read: "read"
    case .write: "write"
    }
  }
}

func print(_ e: MatterAttributeEvent) {
  print(e.description)
}

protocol MatterAttributeID: RawRepresentable where RawValue == UInt32 {
  associatedtype Attribute: MatterAttribute
}

extension LevelControl {
  struct CurrentLevel: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }
}

extension ColorControl {
  struct CurrentHue: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }

  struct CurrentSaturation: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }

  struct CurrentX: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }

  struct CurrentY: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }

  struct ColorTemperatureMireds: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }

  struct ColorMode: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }
}

extension OnOff {
  struct OnOffState: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>
  }
}
