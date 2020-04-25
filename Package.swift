// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "uup",
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.0.1")),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMinor(from: "3.0.0")),
    ],
    targets: [
        .target(
            name: "uup",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Rainbow", package: "Rainbow"),
            ]),
        .testTarget(
            name: "uupTests",
            dependencies: ["uup"]),
    ]
)