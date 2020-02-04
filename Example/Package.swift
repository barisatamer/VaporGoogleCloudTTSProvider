// swift-tools-version:5.1
import PackageDescription

let package = Package(
    name: "GoogleCloudProviderVapor4",
    platforms: [
       .macOS(.v10_14)
    ],
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0-beta.3.9"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0-beta.2.3"),
        .package(url: "https://github.com/vapor/fluent-sqlite-driver.git", from: "4.0.0-beta.3"),
        .package(url: "https://github.com/vapor-community/google-cloud-provider.git", from: "1.0.0-beta.2.2"),
        .package(url: "../", from: "0.0.8")
    ],
    targets: [
        .target(name: "App", dependencies: [
            "Fluent", 
            "FluentSQLiteDriver",
            "Vapor",
            "GoogleCloud",
            "VaporGoogleCloudTts"
        ]),
        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App", "XCTVapor"])
    ]
)
