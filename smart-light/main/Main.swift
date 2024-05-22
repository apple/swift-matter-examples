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

let led = LED()

@_cdecl("app_main")
func app_main() {
  print("🏎️   Hello, Embedded Swift!")

  // (1) create a Matter root node
  let rootNode = Matter.Node()
  rootNode.identifyHandler = {
    print("identify")
  }

  // (2) create a "light" endpoint, configure it
  let lightEndpoint = Matter.ExtendedColorLight(node: rootNode)
  lightEndpoint.configuration = .default
  lightEndpoint.eventHandler = { event in
    print("lightEndpoint.eventHandler:")
    print(event.attribute)
    print(event.value)

    switch event.attribute {
    case .onOff:
      led.enabled = (event.value == 1)

    case .levelControl:
      led.brightness = Int(Float(event.value) / 255.0 * 100.0)

    case .colorControl(.currentHue):
      let newHue = Int(Float(event.value) / 255.0 * 360.0)
      led.color = .hueSaturation(newHue, led.color.saturation)

    case .colorControl(.currentSaturation):
      let newSaturation = Int(Float(event.value) / 255.0 * 100.0)
      led.color = .hueSaturation(led.color.hue, newSaturation)

    case .colorControl(.colorTemperatureMireds):
      let kelvins = 1_000_000 / event.value
      led.color = .temperature(kelvins)

    default:
      break
    }
  }

  // (3) add the endpoint to the node
  rootNode.addEndpoint(lightEndpoint)

  // (4) provide the node to a Matter application, start the application
  let app = Matter.Application()
  app.eventHandler = { event in
    print(event.type)
  }
  app.rootNode = rootNode
  app.start()

}
