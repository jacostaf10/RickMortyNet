// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RickMortyNet",
    platforms: [.iOS(.v16), .macOS(.v14), .tvOS(.v16), .watchOS(.v7)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "RickMortyNet",
            targets: ["RickMortyNet"]),
    ],
    dependencies: [
        .package(url: "https://github.com/jacostaf10/SwiftNet.git", from: "0.0.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "RickMortyNet",
            dependencies: ["SwiftNet"]
        ),

    ]
)
