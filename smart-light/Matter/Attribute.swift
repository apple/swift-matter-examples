protocol MatterAttribute {
  var attribute: UnsafeMutablePointer<esp_matter.attribute_t> { get }

  init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>)
}

extension MatterAttribute {
  var value: esp_matter_attr_val_t {
    get {
      var val = esp_matter_attr_val_t()
      esp_matter.attribute.get_val(attribute, &val)
      return val
    }
  }
}

enum MatterAttributeEvent {
  case willSet
  case didSet
  case read
  case write

  init(_ value: esp_matter.attribute.callback_type_t) {
    switch value.rawValue {
    case 0: self = .willSet
    case 1: self = .didSet
    case 2: self = .read
    case 3: self = .write
    default: fatalError("unknown attribute event")
    }
  }
}

func print(_ e: MatterAttributeEvent) {
  switch e {
    case .willSet: print("willSet")
    case .didSet: print("didSet")
    case .read: print("read")
    case .write: print("write")
  }
}

protocol MatterAttributeID: RawRepresentable where RawValue == UInt32 { 
  associatedtype Attribute: MatterAttribute
}

extension LevelControl {
  struct CurrentLevel: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }
}

extension ColorControl {
  struct CurrentHue: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }

  struct CurrentSaturation: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }

  struct CurrentX: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }

  struct CurrentY: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }

  struct ColorTemperatureMireds: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }

  struct ColorMode: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }
}

extension OnOff {
  struct OnOffState: MatterAttribute {
    var attribute: UnsafeMutablePointer<esp_matter.attribute_t>

    init(_ attribute: UnsafeMutablePointer<esp_matter.attribute_t>) { 
      self.attribute = attribute
    }
  }
}