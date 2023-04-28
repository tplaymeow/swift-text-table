// swift-tools-version: 5.8

import PackageDescription

let package = Package(
  name: "TextTable",
  products: [
    .library(
      name: "TextTable",
      targets: ["TextTable"]),
  ],
  targets: [
    .target(
      name: "TextTable"),
    .testTarget(
      name: "TextTableTests",
      dependencies: ["TextTable"]),
  ]
)
