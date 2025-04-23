// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "DynamicOverlay",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "DynamicOverlay",
            targets: ["DynamicOverlay"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/applidium/OverlayContainer.git", from: "3.5.2"),
        .package(url: "https://github.com/siteline/SwiftUI-Introspect.git", .upToNextMajor(from: "1.0.0")),

    ],
    targets: [
        .target(
            name: "DynamicOverlay",
            dependencies: [
                "OverlayContainer",
                .product(name: "SwiftUIIntrospect", package: "swiftui-introspect"),
            ],
            path: "Source"
        ),
        .testTarget(
            name: "DynamicOverlayTests",
            dependencies: [
                "DynamicOverlay"
            ]
        ),
    ],
    swiftLanguageVersions: [.v5]
)
