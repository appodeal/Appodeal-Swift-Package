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
            checksum: "665ff065691618e3a827b167045885b8aef76bdfb9948d270f0d4b8825066f3a"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/AppodealMediationCore.xcframework.zip",
            checksum: "17aad40cb487cec6148603383a978bc0cfc657e5a1cbcdaf1b0c899237becc46"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackModules.xcframework.zip",
            checksum: "86286b07cb0b0193dd3042195e2846f44f72cde52b78b007327a1441badec1f5"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackRendering.xcframework.zip",
            checksum: "e831cbd1b0b8f518d7959efacd6d1aa050e4965b0280ba69552f67304fa00596"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackProductPresentation.xcframework.zip",
            checksum: "69c97037fe598bdcde84d660fce19cdd91c1766377e077a2c7502cf561f74845"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.4/StackConsentManager.xcframework.zip",
            checksum: "d8329a744ca7242ebde89f16881f13b0f1024bd37ecb600500029b294a36fb68"
        ),
    ]
)