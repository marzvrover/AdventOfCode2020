// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AdventOfCode2020",
    products: [
        .executable(name: "AdventOfCode2020", targets: ["AdventOfCode2020"]),
        .library(name: "AdventOfCode2020Days", targets: ["AdventOfCode2020Days"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/onevcat/Rainbow", from: "3.2.0"),
        .package(url: "https://github.com/swiftpackages/Heap.git", from: "1.1.1"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "AdventOfCode2020",
            dependencies: ["AdventOfCode2020Days"],
            resources: [
                .process("Resources")
            ]),
        .target(
            name: "AdventOfCode2020Days",
            dependencies: [
                .product(name: "Rainbow", package: "Rainbow"),
                .product(name: "Heap", package: "Heap"),
            ]),
        .testTarget(
            name: "AdventOfCode2020DaysTests",
            dependencies: ["AdventOfCode2020Days"]),
    ]
)
