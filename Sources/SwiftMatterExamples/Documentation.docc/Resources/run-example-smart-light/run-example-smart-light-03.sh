# Clone the repo
$ cd ~
$ git clone https://github.com/apple/swift-matter-examples.git

# Navigate to the smart light example
$ cd ~/swift-matter-examples/smart-light
# In docker use "cd /code/smart-light"

# Configure the target microcontroller
$ idf.py set-target esp32c6

# Build the application
$ idf.py build

