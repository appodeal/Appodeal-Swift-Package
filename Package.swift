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
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/Appodeal.xcframework.zip",
            checksum: "5d8134df0a2429ae67277ab55e32b42976529d8ad2d9bdf7ed81a9bdeb2540f8"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/AppodealMediationCore.xcframework.zip",
            checksum: "75391da633d19c425b717793a2adfffb691d1f488c905ecefee97b888d36e5ca"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackModules.xcframework.zip",
            checksum: "f64c377b0fec134ba00eac4083194252856af999cc02d4ce05943af0e76ae4ae"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackRendering.xcframework.zip",
            checksum: "85cd501c15533035ee70a080992988d5367c084c8df7e4efe1c7159e35bdf701"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackProductPresentation.xcframework.zip",
            checksum: "87f1f134a7eeef2ab6f5c5ca50dd6a09583758a9e884eb79207ce81022d7be67"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackConsentManager.xcframework.zip",
            checksum: "644ee8dbef93beb28c0f49dfd74bf6f59128d7b04b894643f072e0c980478059"
        ),
    ]
)