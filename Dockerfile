# Start from the latest Swift nightly main toolchain
FROM swiftlang/swift:nightly-main-jammy

# Install ESP-IDF dependencies
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    git wget flex bison gperf python3 python3-pip python3-venv \
    ninja-build ccache libffi-dev libssl-dev dfu-util libusb-1.0-0 \
  && rm -rf /var/lib/apt/lists/*

# Install CMake >= 3.29
RUN pip install --upgrade cmake

# Download ESP-IDF
RUN mkdir -p ~/esp \
  && cd ~/esp \
  && git clone \
    --branch v5.2.1 \
    --depth 1 \
    --shallow-submodules \
    --recursive https://github.com/espressif/esp-idf.git \
    --jobs 24

# Install ESP-IDF
RUN cd ~/esp/esp-idf \
  && ./install.sh esp32c6

# Install ESP-Matter dependencies
RUN apt-get update \
  && apt-get install --yes --no-install-recommends \
    git gcc g++ pkg-config libssl-dev libdbus-1-dev \
    libglib2.0-dev libavahi-client-dev ninja-build python3-venv python3-dev \
    python3-pip unzip libgirepository1.0-dev libcairo2-dev libreadline-dev \
  && rm -rf /var/lib/apt/lists/*

# Download ESP-Matter
RUN mkdir -p ~/esp \
  && cd ~/esp \
  && git clone \
    --branch release/v1.2 \
    --depth 1 \
    --shallow-submodules \
    --recursive https://github.com/espressif/esp-matter.git \
    --jobs 24

# Download ESP-Matter
RUN mkdir -p ~/esp \
  && cd ~/esp/esp-matter/connectedhomeip/connectedhomeip \
  && ./scripts/checkout_submodules.py --platform esp32 linux --shallow

# Install ESP-Matter
RUN cd ~/esp/esp-matter \
  && ./install.sh

# Setup shell environment
RUN echo '. ~/esp/esp-idf/export.sh > /dev/null' >> ~/.bashrc \
  && echo '. ~/esp/esp-matter/export.sh > /dev/null' >> ~/.bashrc
ENV ESPPORT='rfc2217://host.docker.internal:4000?ign_set_control'
