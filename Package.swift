// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "MC1_Practice",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "MC1_Practice",
            targets: ["AppModule"],
            bundleIdentifier: "Pohang.MC1-Practice",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .clock),
            accentColor: .presetColor(.cyan),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources")
            ]
        )
    ]
)