// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AppServices",
    platforms: [
        .iOS("26.0")
    ],
    products: [
        .library(name: "AppServices", targets: ["AppServices"]),
    ],
    targets: [
        .target(name: "AppServices"),
        .testTarget(name: "AppServicesTests", dependencies: ["AppServices"]),
    ]
)
