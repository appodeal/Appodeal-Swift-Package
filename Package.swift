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
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/Appodeal.xcframework.zip",
            checksum: "d089d05bd02a36afbc12e2aac41ea816892e672727e7e469d7d1e97cbcf93db4"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/AppodealMediationCore.xcframework.zip",
            checksum: "376ae0603e021c84875a34e3198eeb1fdd972266bf7b7e4e840ba6b337534f1e"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackModules.xcframework.zip",
            checksum: "0b634bc859f54f1fbd18bde4c35ce94cc6b079b051e9a4c5f71334c0ebfe30c2"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackRendering.xcframework.zip",
            checksum: "acd68ed546e3dad7c8c9ad90b8ce8bb0dde36afb01a2ae13ccbc5c1a2b7e9aa8"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackProductPresentation.xcframework.zip",
            checksum: "eec79919bf4fa79d5132e585a3c914cbc1a9334ab2061b273b8847e4b1f8c269"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackConsentManager.xcframework.zip",
            checksum: "cdfc0f2985f314b25514ba45c9a0a8cdf8e49da3318a6de42605ee86d1c42d6d"
        ),
    ]
)