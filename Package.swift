// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AppodealSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "AppodealSDK", targets: ["AppodealSDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.38.0"),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
            from: "3.1.0"
        ),
    ],
    targets: [
        .target(
            name: "AppodealSDK",
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
            ],
            path: "Sources/AppodealSDK",
            resources: [.copy("PrivacyInfo.xcprivacy")],
            linkerSettings: [
                .linkedFramework("AdSupport"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("ImageIO"),
                .linkedFramework("MobileCoreServices"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("SafariServices"),
                .linkedFramework("StoreKit"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("WebKit"),
                .linkedLibrary("z"),
            ]
        ),
        
        // Prebuilt binaries
        .binaryTarget(
            name: "Appodeal",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.12/Appodeal.xcframework.zip",
            checksum: "85241578cc7439c721b5b8ac9e28be584a3bc7a4543daed37089d5b08e2c3869"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.12/AppodealMediationCore.xcframework.zip",
            checksum: "e00a615fecfe9963849f306619d97df52e8c69bad1bb96820ae2f04e81bad449"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.12/StackModules.xcframework.zip",
            checksum: "af723608bd4bac0dacd13ef10eb41f69a796918f9c46b178f2d8bc015a9b39e1"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.12/StackRendering.xcframework.zip",
            checksum: "221d50b97bc2dcb7b4270d861927da2bf751d2d1592f138c37023c61e4741be9"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.12/StackProductPresentation.xcframework.zip",
            checksum: "65cbd5b0322457c9bedb5776edb96c0516440b210d1209957e711b5efa9a82ef"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.12/StackConsentManager.xcframework.zip",
            checksum: "1263cf5fbf3c33012f01839e6a8d8189b1be2c252ec426f100d969e657955a3b"
        ),
    ]
)