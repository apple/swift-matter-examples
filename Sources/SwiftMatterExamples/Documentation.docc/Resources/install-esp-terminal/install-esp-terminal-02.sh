#! /bin/sh

# Install Homebrew
$ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install CMake, Ninja, and dfu-util
$ brew install cmake ninja dfu-util

# Create an ESP SDK directory
$ mkdir -p ~/esp
