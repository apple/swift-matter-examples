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

final class LED {
  // Additional API ...

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
