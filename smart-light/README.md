# Embedded Swift Matter Example: Smart Light example

This directory contains an example implementation of a Matter smart LED light accessory in Embedded Swift, and it can be built using the ESP IDF and ESP Matter SDKs, and uploaded to an ESP32C6 or ESP32C3 development board.

Breakdown of the files included:

- **CMakeLists.txt** — Top-level CMake configuration file for the example, similar to the ["light" example from the ESP Matter SDK](https://github.com/espressif/esp-matter/tree/main/examples/light), with the minimum CMake version increased to 3.29 as required by Swift.
- **partitions.csv** — Partition table for the firmware. Same as the ["light" example from the ESP Matter SDK](https://github.com/espressif/esp-matter/tree/main/examples/light).
- **README.md** — This documentation file.
- **sdkconfig.defaults** — Compile-time settings for the ESP IDF. Same as the ["light" example from the ESP Matter SDK](https://github.com/espressif/esp-matter/tree/main/examples/light).
- **main/** — Subdirectory with actual source files to build.
  - **main/BridgingHeader.h** — A bridging header that imports C and C++ declarations from ESP IDF and ESP Matter SDKs into Swift.
  - **main/CmakeLists.txt** — CMake configuration describing what files to build and how. This includes a lot of Embedded Swift specific logic (e.g. Swift compiler flags).
  - **main/idf_component.yml** — Dependency list for the IDF Component Manager. Same as the ["light" example from the ESP Matter SDK](https://github.com/espressif/esp-matter/tree/main/examples/light).
  - **main/LED.swift** — Implementation of a helper "LED" object in Embedded Swift.
  - **main/Main.swift** — Main file with Embedded Swift application source code.
- **Matter/** — Subdirectory with a simple (incomplete) Matter overlay to bridge C++ Matter APIs into Swift
  - **Matter/Attribute.swift** — Low-level overlay code for Matter attributes.
  - **Matter/Clusters.swift** — Low-level overlay code for Matter clusters.
  - **Matter/Matter.swift** — High-level Matter overlay code.
  - **Matter/MatterInterface.cpp** — Helper C++ code for interoperating with Matter C++ APIs.
  - **Matter/MatterInterface.h** — Helper C++ code for interoperating with Matter C++ APIs.
  - **Matter/Node.swift** — Low-level overlay code for Matter nodes.

## Building and running the example

For full steps how to build the example code, follow the [Setup Your Environment](https://apple.github.io/swift-embedded/swift-matter-examples/tutorials/tutorial-table-of-contents#setup-your-environment) tutorials and the [Explore the Smart Light example](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-smart-light) tutorial. In summary:

- Ensure your system has all the required software installed and your shell has access to the tools listed in the top-level README file.
- Plug in the ESP32C6/C3 development board via a USB cable.
- Have a set up HomeKit or other Matter-enabled smart home ecosystem.
  - For HomeKit, this includes a configured home, a Wi-Fi network which additional devices can join, a [home hub](https://support.apple.com/en-us/102557), and an iOS device for managing the home.

1. Clone the repository and navigate to the `smart-light` example.
  ```shell
  $ git clone https://github.com/apple/swift-matter-examples.git
  $ cd swift-matter-examples/smart-light
  ```

2. Configure the build system for your microcontroller, this example should also be runnable on `esp32c3`.
  ```shell
  $ idf.py set-target esp32c6
  ```

3. Build and deploy the application to your device.
  ```shell
  $ idf.py build flash monitor
  ```

4. Register the device in your home network. See [Connect-using-Matter](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-smart-light#Connect-using-Matter) for detailed pairing instructions with HomeKit.

5. You can now control the smart light. In case of a HomeKit network, the Home app, and Siri can both be used to turn the light on, off, change colors, etc.

6. Explore the implementation, see [Understand the code](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-smart-light#Understand-the-code) for a guided walkthrough.
