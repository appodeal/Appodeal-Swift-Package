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
        
        // Core binary targets
        .binaryTarget(
            name: "Appodeal",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.5/Appodeal.xcframework.zip",
            checksum: "6a83cdf681dced8c58bcb6f30637435383220639fa685baf37548ca101ff8647"
        ),
        .binaryTarget(
            name: "AppodealMediationCore", 
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.5/AppodealMediationCore.xcframework.zip",
            checksum: "d0e510745da7502896cb3912bda0c722a01d635739af3c4d3c8872c620a48c32"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.5/StackModules.xcframework.zip",
            checksum: "2829bdf8580c50c9e9fcc86ae28a8c99434f210a666c88cb76f6e7507c1c5019"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.5/StackRendering.xcframework.zip",
            checksum: "503d4f52e9c00d66c48c2a199e18b07e9e5c34599d49fc70e600ea2476f7adeb"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.5/StackProductPresentation.xcframework.zip",
            checksum: "e5b7088a7b4249da9e4fd3aeb4594cc1011f34355f628920fd9f252cbdd2a8be"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.5/StackConsentManager.xcframework.zip",
            checksum: "53d2d7344b0d2b3eca932f57836aa5924ca72a1e0da9fd1d8347b360b8d33f17"
        ),
    ]
)