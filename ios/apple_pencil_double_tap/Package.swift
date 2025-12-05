// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "apple_pencil_double_tap",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(name: "apple-pencil-double-tap", targets: ["apple_pencil_double_tap"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "apple_pencil_double_tap",
            dependencies: [],
            resources: []
        )
    ]
)
