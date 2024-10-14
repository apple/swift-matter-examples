# Install Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install CMake, Ninja, and dfu-util
$ brew install cmake ninja dfu-util

# Create an ESP SDK directory
$ mkdir -p ~/esp

# Download the ESP-IDF SDK (`master` or `v5.4` when released)
$ cd ~/esp
$ git clone \
  --branch master \
  --depth 1 \
  --shallow-submodules \
  --recursive https://github.com/espressif/esp-idf.git \
  --jobs 24

# Install the ESP-IDF SDK
$ cd ~/esp/esp-idf
$ ./install.sh

# Download the ESP-Matter SDK
$ cd ~/esp
$ git clone \
    --branch release/v1.2 \
    --depth 1 \
    --shallow-submodules \
    --recursive https://github.com/espressif/esp-matter.git \
    --jobs 24
