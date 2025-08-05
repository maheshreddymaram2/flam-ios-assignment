// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "socialfeedapp",
    products: [
        .executable(name: "socialfeedapp", targets: ["FeedApp"]),
    ],
    dependencies: [],
    targets: [
        .executableTarget(
            name: "FeedApp",
            dependencies: [],
            path: "Sources/FeedApp"
        ),
        .testTarget(
            name: "FeedAppTests",
            dependencies: ["FeedApp"],
            path: "Tests/FeedAppTests"
        ),
    ]
)
