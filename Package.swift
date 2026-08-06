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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/Appodeal.xcframework.zip",
            checksum: "877cdbc86424ed246cfef81c455d679cc4c72967b47eb76bc053455de428e0f9"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/AppodealMediationCore.xcframework.zip",
            checksum: "1fed62edc8dc026d0e2602e27f3b2dc6c4c380b3a3c09e6261676d606be69285"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackModules.xcframework.zip",
            checksum: "56826cbf42b9d96c11976deea6d99ec5b7366631977878ae90f11e07b07f429c"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackRendering.xcframework.zip",
            checksum: "ae0054668e2fee9f7bd933b391f6d11553543b5c4fd686840961e0bf4ffeea78"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackProductPresentation.xcframework.zip",
            checksum: "e48b69bace0d767088eb8b7a05a89bb82d2f42e0c5638a686d779da4d31a60c8"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.3.5/StackConsentManager.xcframework.zip",
            checksum: "956768265d0d47033a1e2b149b7e5c4823942cc7a0f2f51c779bf5f2de912b92"
        ),
    ]
)