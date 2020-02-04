// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "VaporGoogleCloudTts",
    platforms: [
       .macOS(.v10_14)
    ],
    products: [
        .library(name: "VaporGoogleCloudTts", targets: ["VaporGoogleCloudTts"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor", from: "4.0.0-beta.3.9"),
        .package(url: "https://github.com/barisatamer/SwiftGoogleCloudTTS.git", from: "0.0.12"),
    ],
    targets: [
        .target(
            name: "VaporGoogleCloudTts", 
            dependencies: [
                "Vapor",
                "SwiftGoogleCloudTTS",
            ]
        ),
        .testTarget(
            name: "VaporGoogleCloudTtsTests",
            dependencies: ["VaporGoogleCloudTts"]
        ),
    ]
)
