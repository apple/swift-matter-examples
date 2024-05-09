# Embedded Swift Matter Example: Blinking LED template

This directory contains a template for blinking an LED in Embedded Swift, and it can be built using the ESP IDF, and uploaded to an ESP32C6 development board.

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

## Building and running the example

For full steps how to build the example code, follow the [Setup Your Environment](https://apple.github.io/swift-embedded/swift-matter-examples/tutorials/tutorial-table-of-contents#setup-your-environment) tutorials and the [Explore the LED Blink example](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-led-blink) tutorial. In summary:

- Ensure your system has all the required software installed and your shell has access to the tools listed in the top-level README file.
- Plug in the ESP32C6 development board via a USB cable.

1. Clone the repository and navigate to the `led-blink` example.
  ```shell
  $ git clone https://github.com/apple/swift-matter-examples.git
  $ cd swift-matter-examples/led-blink
  ```

2. Configure the build system for your microcontroller.
  ```shell
  $ idf.py set-target esp32c6
  ```

3. Build and deploy the application to your device. 
  ```shell
  $ idf.py build flash monitor
  ```

4. Observe that after the firmware starts up, the on-board LED is blinking and changing colors randomly.

5. Explore the implementation, see [Understand the code](https://apple.github.io/swift-matter-examples/tutorials/swiftmatterexamples/run-example-led-blink#Understand-the-code) for a guided walkthrough.
