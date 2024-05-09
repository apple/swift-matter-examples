# Locate the toolchain
$ ls ~/Library/Developer/Toolchains/
swift-DEVELOPMENT-SNAPSHOT-2024-06-03-a.xctoolchain
swift-latest.xctoolchain

# Find the toolchain identifier
$ plutil -extract CFBundleIdentifier raw \
  -o - \
  ~/Library/Developer/Toolchains/swift-DEVELOPMENT-SNAPSHOT-2024-06-03-a.xctoolchain/Info.plist
org.swift.59202406031a
