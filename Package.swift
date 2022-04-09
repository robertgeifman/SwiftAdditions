// swift-tools-version:4.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftAdditions",
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftAdditions",
            targets: ["SwiftAdditions"]),
        .library(
            name: "SwiftAudioAdditions",
            targets: ["SwiftAudioAdditions"]),
        .library(
           name: "CoreTextAdditions",
           targets: ["CoreTextAdditions"]),
		.library(
		   name: "TISAdditions",
		   targets: ["TISAdditions"]),
		.library(
		   name: "UTTypeOSTypes",
		   targets: ["UTTypeOSTypes"]),
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
            dependencies: [],
            path: "SwiftAdditions",
            exclude: ["SAMacError.m"]),
        .testTarget(
            name: "SwiftAdditionsTests",
            dependencies: ["SwiftAdditions"],
            path: "SwiftAdditionsTests"),
        .target(
            name: "SwiftAudioAdditions",
            dependencies: ["SwiftAdditions"],
            path: "SwiftAudioAdditions",
            exclude: ["SAAError.m"]),
        .testTarget(
            name: "SwiftAudioAdditionsTests",
            dependencies: ["SwiftAdditions", "SwiftAudioAdditions"],
            path: "SwiftAudioAdditionsTests"),
        .target(
            name: "CoreTextAdditions",
            dependencies: ["CTAdditionsSwiftHelpers"],
            path: "CoreTextAdditions"),
		.target(
			name: "CTAdditionsSwiftHelpers",
			path: "CTAdditionsSwiftHelpers"),
        .testTarget(
            name: "CoreTextAdditionsTests",
            dependencies: ["SwiftAdditions", "CoreTextAdditions"],
            path: "CoreTextAdditionsTests"),
		.target(
			name: "TISAdditions",
			dependencies: ["SwiftAdditions"],
			path: "TISAdditions"),
		.testTarget(
			name: "TISAdditionsTests",
			dependencies: ["SwiftAdditions", "TISAdditions"],
			path: "TISAdditionsTests"),
		.target(
			name: "UTTypeOSTypes",
			dependencies: [],
			path: "UTTypeOSTypes"),
		.testTarget(
			name: "UTTypeOSTypesTests",
			dependencies: ["UTTypeOSTypes"],
			path: "UTTypeOSTypesTests"),
    ]
)
