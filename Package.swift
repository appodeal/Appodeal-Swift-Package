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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/Appodeal.xcframework.zip",
            checksum: "bd87f7233896bb76794452654fddba50daf5a97238fcb0cfb8e08183ca04f15d"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/AppodealMediationCore.xcframework.zip",
            checksum: "36fb06b6abd242f7e662579688db8655b2f90d70db3d9ba36bfe6395bfdbb3a9"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackModules.xcframework.zip",
            checksum: "7e7e5b2ada0e14c3745d7693127f91bafeb6f5adbe3aa8ce69a66df643b103ce"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackRendering.xcframework.zip",
            checksum: "5e927ef297397f28c57a775fb5cdb561200c4f41832a895939fd937f213aff5a"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackProductPresentation.xcframework.zip",
            checksum: "11b1af7c671cd29c8e933a8c0e91e35ed6575742098a10d9713e4aabb3d6efd7"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackConsentManager.xcframework.zip",
            checksum: "42411c7ee97b4a328bf8af283945e31ccc4e90e395148843a8911f7f45da30f1"
        ),
    ]
)