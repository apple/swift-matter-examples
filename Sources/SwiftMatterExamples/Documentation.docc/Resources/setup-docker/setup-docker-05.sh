# Clone the repo
$ cd ~
$ git clone https://github.com/apple/swift-matter-examples.git

# Build and tag the docker image
$ cd ~/swift-matter-examples
$ docker build . --tag swift-matter-examples-builder

# Install esptool on macOS and Linux
$ python3 -m pip install esptool --user

# Find your attached microcontroller
# On macOS it usually attaches on /dev/cu.usbserial-10
$ ls /dev/cu.usbserial-*
/dev/cu.usbserial-10

# On Linux it usually attaches on /dev/ttyUSB0
$ ls /dev/ttyUSB*
/dev/ttyUSB0

# Run the serial server
$ esp_rfc2217_server.py -v -p 4000 /dev/cu.usbserial-10

# Launch the docker container
$ cd ~/swift-matter-examples
$ docker run -it --cpus 4 --memory 8G -v .:/code:z swift-matter-examples-builder
