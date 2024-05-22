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

final class LED {
  enum Color {
    case hueSaturation(Int, Int)
    case temperature(Int)

    var hue: Int {
      switch self {
      case .hueSaturation(let hue, _): return hue
      case .temperature: return 0
      }
    }

    var saturation: Int {
      switch self {
      case .hueSaturation(_, let saturation): return saturation
      case .temperature: return 0
      }
    }
  }

  var handle: led_driver_handle_t

  init() {
    var config = led_driver_get_config()
    let handle = led_driver_init(&config)
    led_driver_set_power(handle, true)
    self.handle = handle!
  }

  var enabled: Bool = true {
    didSet {
      led_driver_set_power(handle, enabled)
    }
  }

  var brightness: Int = 100 {
    didSet {
      brightness = max(0, min(100, brightness))
      led_driver_set_brightness(handle, UInt8(brightness))
    }
  }

  var color: Color = .hueSaturation(0, 100) {
    didSet {
      switch color {
      case .hueSaturation(let hue, let saturation):
        led_driver_set_hue(handle, UInt16(hue))
        led_driver_set_saturation(handle, UInt8(saturation))
      case .temperature(let temperature):
        led_driver_set_temperature(handle, UInt32(temperature))
      }
    }
  }
}

extension LED.Color {
  static var red: LED.Color { .hueSaturation(0, 100) }
  static var blue: LED.Color { .hueSaturation(240, 100) }
}
