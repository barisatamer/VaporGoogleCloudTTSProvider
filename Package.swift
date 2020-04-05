// swift-tools-version:5.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VaporGoogleCloudTts",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(name: "VaporGoogleCloudTts", targets: ["VaporGoogleCloudTts"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-rc"),
        .package(url: "https://github.com/barisatamer/SwiftGoogleCloudTTS.git", from: "0.0.14"),
    ],
    targets: [
        .target(
            name: "VaporGoogleCloudTts", 
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "SwiftGoogleCloudTTS", package: "SwiftGoogleCloudTTS")
            ]
        ),
        .testTarget(
            name: "VaporGoogleCloudTtsTests",
            dependencies: ["VaporGoogleCloudTts"]
        ),
    ]
)
