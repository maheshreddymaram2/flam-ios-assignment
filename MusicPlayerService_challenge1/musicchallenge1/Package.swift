// swift-tools-version: 6.1
import PackageDescription

let package = Package(
    name: "musicchallenge1",
    products: [
        .library(name: "musicchallenge1", targets: ["musicchallenge1"]),
        .executable(name: "musicchallenge1_cli", targets: ["musicchallenge1_cli"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "musicchallenge1"),
        .executableTarget(name: "musicchallenge1_cli", dependencies: ["musicchallenge1"]),
        .testTarget(name: "musicchallenge1Tests", dependencies: ["musicchallenge1"]),
    ]
)
