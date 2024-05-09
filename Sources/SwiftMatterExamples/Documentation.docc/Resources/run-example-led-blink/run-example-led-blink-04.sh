# Clone the repo
$ cd ~
$ git clone https://github.com/apple/swift-matter-examples.git

# Navigate to the led blink example
$ cd ~/swift-matter-examples/led-blink
# In docker use "cd /code/led-blink"

# Configure the target microcontroller
$ idf.py set-target esp32c6

# Build the application
$ idf.py build

# Flash and monitor the application
$ idf.py flash monitor
