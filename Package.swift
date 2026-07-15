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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.15/Appodeal.xcframework.zip",
            checksum: "4aaec7c09d67cb8243c53d4c8495d03b3bdff3b286d9c14bd8b69c500bbbaa6c"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.15/AppodealMediationCore.xcframework.zip",
            checksum: "d479b1a4cc6cd0ece22739e29afe662751991fc0cc669f2f63e0eb52e9364f30"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.15/StackModules.xcframework.zip",
            checksum: "788498aa7822cacf193ef18c8aa095c88362ed1deeceec1bd41cad6b327e088e"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.15/StackRendering.xcframework.zip",
            checksum: "e1582dc535da2b7c79d98586abf4930ad0eb4eb40c28d721fae80ce12ad2e4e3"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.15/StackProductPresentation.xcframework.zip",
            checksum: "6005e7e34b15dda1a13e03b3bb185c14a02ecf2f5bcc6f429639fb4431ba8310"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.15/StackConsentManager.xcframework.zip",
            checksum: "0a344dce2e882c50b6d9687984a2bbadb31287f785fe67a9db4bb17c803f6ad1"
        ),
    ]
)