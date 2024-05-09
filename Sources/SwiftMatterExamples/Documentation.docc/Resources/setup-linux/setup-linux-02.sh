# Clone the repo
$ cd ~
$ git clone https://github.com/apple/swift-matter-examples.git

# Build and tag the docker image
$ cd ~/swift-matter-examples
$ docker build . --tag swift-matter-examples-builder

# Install esptool on macOS and Linux
$ python3 -m pip install esptool --user
