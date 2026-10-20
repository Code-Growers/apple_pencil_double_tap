// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "apple_pencil_double_tap",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(name: "apple-pencil-double-tap", targets: ["apple_pencil_double_tap"])
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework")
    ],
    targets: [
        .target(
            name: "apple_pencil_double_tap",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework")
            ],
            resources: []
        )
    ]
)
