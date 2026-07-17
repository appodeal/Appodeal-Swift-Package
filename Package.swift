// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Appodeal",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Appodeal", targets: ["AppodealWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.38.0"),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
            from: "3.1.0"
        ),
    ],
    targets: [
        // Core wrapper target
        .target(
            name: "AppodealWrapper",
            dependencies: [
                "Appodeal",
                "AppodealMediationCore",
                "StackModules",
                "StackRendering", 
                "StackProductPresentation",
                "StackConsentManager",
                .product(name: "SwiftProtobuf", package: "swift-protobuf"),
                .product(name: "GoogleUserMessagingPlatform", 
                        package: "swift-package-manager-google-user-messaging-platform"),
            ]
        ),
        
        // Core binary targets
        .binaryTarget(
            name: "Appodeal",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/Appodeal/4.3.0/Appodeal.xcframework.zip",
            checksum: "6e1c8abb4c095b25bb4ae81ff56c45643885d67934d4aec3c1b7e88d116d9d3d"
        ),
        .binaryTarget(
            name: "AppodealMediationCore", 
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/Appodeal/4.3.0/AppodealMediationCore.xcframework.zip",
            checksum: "bedf672d3a26100dff7300abe11e2aaed08682880654258a476d44e98cfb3ef1"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/Appodeal/4.3.0/StackModules.xcframework.zip",
            checksum: "6372c616e8fdc65f2b8d348be25524ac65876c6f814ed6ade4620fc140123f33"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/Appodeal/4.3.0/StackRendering.xcframework.zip",
            checksum: "b5979dc4f2b6cc97f38783374c79d88b9b9a1bcc4814024a5125e9cb3fed9e62"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/Appodeal/4.3.0/StackProductPresentation.xcframework.zip",
            checksum: "f74194d59f2b68dda70b90a5fec3e48653f025ee6e24d94255bc9cc874c726bd"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/Appodeal/4.3.0/StackConsentManager.xcframework.zip",
            checksum: "5ad9d9516decd493633605bb4142871f3f927ffe290687325cf698e5ce3bd92b"
        ),
    ]
)