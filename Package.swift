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
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/Appodeal.xcframework.zip",
            checksum: "370adac307ec79bd396bbc7e3c5b7144f2107aeb1cbc5e7a53b1af3f15627216"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/AppodealMediationCore.xcframework.zip",
            checksum: "f0b0b1b53552bb9748aa4ab1cfa169f29fb8f6b5339a14877b1bcdd547d0d0a8"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackModules.xcframework.zip",
            checksum: "e1591c1d187a9fc9f2e23a984ad2794a255a800a5210cf4ef75073382f73e45d"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackRendering.xcframework.zip",
            checksum: "5c78ff9600045c49da6613988d87718310ac3147422ba0070b3f356e264ef2a5"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackProductPresentation.xcframework.zip",
            checksum: "8d247bd7a4fd5f04366390a14c3c674d865c4bb1c1f17f93e06dd82c2fddcc29"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.eu-central-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.6/StackConsentManager.xcframework.zip",
            checksum: "b340cf82fd06a758ac3e557f0c34f0bdc978eacbb48d3cc9943066c7ea742569"
        ),
    ]
)