// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LaunchAlertKit-SwiftUI",
    platforms: [
         .iOS(.v15)
    ],
    products: [
        .library(
            name: "LaunchAlertKit-SwiftUI",
            targets: ["LaunchAlertKit-SwiftUI"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/ControlKit/ControlKitBase.git",
            branch: "main"
        )
    ],
    targets: [
        .target(
            name: "LaunchAlertKit-SwiftUI",
            dependencies: ["ControlKitBase"],
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "LaunchAlertKit-SwiftUITests",
            dependencies: ["LaunchAlertKit-SwiftUI"]
        ),
    ]
)
