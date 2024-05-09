# Locate the toolchain
$ ls ~/Library/Developer/Toolchains/
swift-DEVELOPMENT-SNAPSHOT-2024-06-03-a.xctoolchain
swift-latest.xctoolchain

# Find the toolchain identifier
$ plutil -extract CFBundleIdentifier raw \
  -o - \
  ~/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2024-06-03-a.xctoolchain/Info.plist
org.swift.59202406031a

# Test the toolchain
$ TOOLCHAINS=org.swift.59202406031a swift --version
Apple Swift version 6.0-dev (LLVM c7c87ee42989d4b, Swift 0aa0687fe0f4047)
Target: arm64-apple-macosx14.0
