# Swift Matter Examples

Build a Matter accessory using Embedded Swift

## Overview

<!-- Image -->

This repository contains an example simple Embedded Swift application that implements a Matter smart light accessory and can be used from HomeKit. The examples use an ESP32-C6 or ESP32-C3 (RISC-V) microcontroller and build on top of the ESP-IDF and ESP-Matter SDKs.

> [!NOTE]
> This repository is associated with WWDC24 session 10197: [Go small with Embedded Swift](https://developer.apple.com/wwdc24/10197).

#### Embedded Swift

Embedded Swift is a subset of Swift designed for constrained environments, such as embedded devices, kernel code, and other low-level systems. It includes most Swift language features, like generics, value and reference types, optionals, error handling, and more. Embedded Swift introduces the safety and expressivity of Swift to environments usually dominated by C or C++ code. To learn more, see [A Vision for Embedded Swift](https://github.com/apple/swift-evolution/blob/main/visions/embedded-swift.md).

#### Matter

Matter is an open standard for building smart home accessories, supported natively by many smart home ecosystems such as HomeKit. For more information about Matter, see the [Matter documentation](https://project-chip.github.io/connectedhomeip-doc/index.html).

#### Additional Resources

- [Embedded Swift User Manual](https://github.com/apple/swift/blob/main/docs/EmbeddedSwift/UserManual.md)
- [More Embedded Swift Example Projects](https://github.com/apple/swift-embedded-examples)
- [Swift Forums Embedded Discussion](https://forums.swift.org/c/development/embedded/107)

## Getting Started

### Documentation

For comprehensive tutorials with detailed instructions, please refer to the [**project documentation**](https://apple.github.io/swift-matter-examples/tutorials/tutorial-table-of-contents).

### Requirements

Before running the examples, ensure you have the following tools available:

- Hardware:
  - [ESP32-C6-DevKitC-1-N8](https://docs.espressif.com/projects/espressif-esp-dev-kits/en/latest/esp32c6/esp32-c6-devkitc-1/user_guide.html)
- Software
  - [Swift Nightly Toolchain](https://www.swift.org/download)
  - [CMake 3.29+](https://cmake.org/download)
  - [ESP-IDF 5.2.1](https://docs.espressif.com/projects/esp-idf/en/v5.2.1/esp32c6/get-started/index.html)
  - [ESP-Matter SDK 1.2](https://docs.espressif.com/projects/esp-matter/en/latest/esp32c6/introduction.html)

> [!IMPORTANT]
> The examples are designed for an Espressif C6 Development Kit from both macOS and Linux host systems. Other configurations may work, but have not been tested.

### Quick Start Guide

> [!IMPORTANT]
> We highly recommend following the provided [tutorials](https://apple.github.io/swift-matter-examples/tutorials/tutorial-table-of-contents).

Ensure your shell has access to the tools listed above, see [Get started on macOS](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/setup-macos) or [Get started on Linux with Docker](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/setup-linux) for additional setup instructions.

1. Clone the repository and navigate to one of the examples.
  ```shell
  $ git clone https://github.com/apple/swift-matter-examples.git
  $ cd swift-matter-examples/smart-light
  ```

2. Configure the build system for your microcontroller, the `smart-light` example should also be runnable on `esp32c3`.
  ```shell
  $ idf.py set-target esp32c6
  ```

3. Build and deploy the application to your device.
  ```shell
  $ idf.py build flash monitor
  ```

Explore the implementation, see [Explore the LED Blink example](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-led-blink#Understand-the-code) and
[Explore the Smart Light example](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-smart-light#Understand-the-code) for guided walkthroughs.

## Contributing to Swift Matter Examples

This repo is intended to demonstrate use of Embedded Swift for different applications, using Matter as an example. PRs demonstrating ways to adapt Swift's language or tooling to this application are welcome. It is not intended to be a full-featured Matter SDK so please do not raise PRs to extend the Matter Swift overlay to new areas.

### Code of Conduct

Like all Swift.org projects, we would like these Embedded Swift example projects to foster a diverse and friendly community. We expect contributors to adhere to the [Swift.org Code of Conduct](https://swift.org/code-of-conduct).

### Contact information

The current code owners of this repository are Kuba Mracek ([@kubamracek](https://github.com/kubamracek)), Rauhul Varma ([@rauhul](https://github.com/rauhul)), and Philippe Hausler (https://github.com/phausler). You can contact them on the Swift forums via the handles [@kubamracek](https://forums.swift.org/u/kubamracek/summary), [@rauhul](https://forums.swift.org/u/rauhul/summary), and [@Philippe_Hausler](https://forums.swift.org/u/philippe_hausler/summary).

In case of moderation issues, you can also directly contact a member of the [Swift Core Team](https://swift.org/community/#community-structure).
