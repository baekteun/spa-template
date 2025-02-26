// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "spa-template",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .executable(name: "App", targets: ["App"])
    ],
    dependencies: [
        .package(url: "https://github.com/swifweb/web", from: "1.0.0-beta.1.19.0")
    ],
    targets: [
        .target(name: "App", dependencies: [
            .product(name: "Web", package: "web")
        ], resources: [
            .copy("images/favicon.ico"),
            .copy("images")
        ]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
