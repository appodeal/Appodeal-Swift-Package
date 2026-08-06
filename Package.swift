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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.7/Appodeal.xcframework.zip",
            checksum: "d963fe2825aade8f2670e009ac6440adf7650fa482e739c8342a24c4c8109a49"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.7/AppodealMediationCore.xcframework.zip",
            checksum: "96982400899491ae9df11581495b15e1abc70b97b0cfd921a86a780aa826a338"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.7/StackModules.xcframework.zip",
            checksum: "8c5e275d5bfc34ed628dd2dba176c03dd2487705f6cbf11026d24b012f1450fb"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.7/StackRendering.xcframework.zip",
            checksum: "65a38729c626490bb89ac3347ecb5bca94038433ce7449b477ab26ba1fdd9068"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.7/StackProductPresentation.xcframework.zip",
            checksum: "05ff8e91b061e3fe98ec7777bdd352487bd9319855f14d00c47bc83edf433e64"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.7/StackConsentManager.xcframework.zip",
            checksum: "ed70c59a92fc9113cafecde6c7a81a243701b2878f9e6bfc717877a7528c4e18"
        ),
    ]
)