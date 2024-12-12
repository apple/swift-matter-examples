// swift-tools-version: 5.10

import PackageDescription

let package = Package(
  name: "swift-matter-examples",
  products: [
    .library(name: "SwiftMatterExamples", targets: ["SwiftMatterExamples"])
  ],
  targets: [
    .target(name: "SwiftMatterExamples")
  ])
