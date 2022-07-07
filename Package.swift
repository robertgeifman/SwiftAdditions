// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "SwiftAdditions",
	platforms: [
		.macOS("11.0"), .iOS(.v13), .tvOS(.v13), .watchOS(.v5),
	],
    products: [
        .library(
           name: "SwiftAdditions",
           targets: ["SwiftAdditions"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftAdditions",
            dependencies: ["SwiftAdditionsHelpers"],
            path: "SwiftAdditions"),
		.target(
			name: "SwiftAdditionsHelpers",
			path: "SwiftAdditionsHelpers"),
    ]
)
