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

@_cdecl("app_main")
func app_main() {
  print("🏎️   Hello, Embedded Swift! (LED Blink)")

  let led = initLED(color: .red, brightness: 10)

  while true {
    sleep(1)
    toggleLED(led: led)
  }
}

func initLED(color: LED.Color, brightness: Int) -> LED {
  let led = LED()
  led.color = color
  led.brightness = brightness
  return led
}

func toggleLED(led: LED) {
  led.enabled.toggle()
  if led.enabled {
    led.color = .hueSaturation(Int.random(in: 0 ..< 360), 100)
  }
}