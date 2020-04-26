// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "uup",
    platforms: [
        .macOS(.v10_15)
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "0.0.1")),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMinor(from: "3.0.0")),
        .package(name: "Socket", url: "https://github.com/IBM-Swift/BlueSocket", .upToNextMinor(from: "1.0.0"))
    ],
    targets: [
        .target(
            name: "uup",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
                .product(name: "Rainbow", package: "Rainbow"),
                .product(name: "Socket", package: "Socket")
            ]),
        .testTarget(
            name: "uupTests",
            dependencies: ["uup"]),
    ]
)
