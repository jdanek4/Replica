// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "Replica",
  platforms: [.iOS(.v14)],
  products: [
    .library(
      name: "Replica",
      targets: ["Replica"]
    )
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Replica",
      dependencies: [],
      resources: [.process("Assets.xcassets")]
    ),
    .testTarget(
      name: "ReplicaTests",
      dependencies: ["Replica"]
    ),
  ]
)
