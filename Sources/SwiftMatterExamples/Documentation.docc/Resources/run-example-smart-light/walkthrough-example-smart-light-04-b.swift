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
func main() {
  print("🏎️   Hello, Embedded Swift! (Smart Light)")

  let led = LED()

  // (1) Create a Matter root node
  let rootNode = Matter.Node()
  rootNode.identifyHandler = {
    print("identify")
  }

  // (2) Create a "light" endpoint
  let lightEndpoint = Matter.ExtendedColorLight(node: rootNode)
  lightEndpoint.eventHandler = { event in
    switch event.attribute {
    case .onOff:
      led.enabled = (event.value == 1)

    case .levelControl:
      led.brightness = Int(Float(event.value) / 255.0 * 100.0)

    default:
      break
    }
  }
}
