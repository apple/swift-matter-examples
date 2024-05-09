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

// Helper object that can be used to control the ESP32C6 on-board LED. Settings
// the `enabled`, `brightness`, `color` properties immediately propagates those
// to the physical LED.
final class LED {
  // Whether the LED should be turned on
  var enabled: Bool = true {
    didSet {
      led_driver_set_power(handle, enabled)
    }
  }

  // Brightness of the LED
  var brightness: Int = 100 {
    didSet {
      brightness = max(0, min(100, brightness))
      led_driver_set_brightness(handle, UInt8(brightness))
    }
  }

  // Color of the LED
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

  // Color, represented as either "hue + saturation", or temperature.
  enum Color {
    // "Hue + saturation" color representation. Hue range is 0 ..< 360.
    // Saturation is 0 ... 100.
    case hueSaturation(Int, Int)

    // Temperature color representation in Kelvins (range 600 ... 10000).
    case temperature(Int)

    // Hue range is 0 ..< 360.
    var hue: Int {
      switch self {
        case .hueSaturation(let hue, _): return hue
        case .temperature: return 0
      }
    }

    // Saturation is 0 ... 100.
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

}

extension LED.Color {
  static var red: LED.Color { .hueSaturation(0, 100) }
  static var blue: LED.Color { .hueSaturation(240, 100) }
}
