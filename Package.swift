// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AppodealSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "AppodealSDK", targets: ["AppodealSDK"]),
    ],
    dependencies: [
        // swift-protobuf is deliberately absent. The core target links it from source and
        // builds as a static library, so libtool has already folded the whole runtime into
        // Appodeal.xcframework — declaring the package here compiled and linked a second copy
        // and every consumer died on `ld: 5905 duplicate symbols`, each pair one object in
        // SwiftProtobuf.o and one in Appodeal.framework/Appodeal(...). The core imports it
        // @_implementationOnly, so it is named by neither the public API nor the shipped
        // .swiftinterface and consumers never need the module.
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
                "StackConsentManager",
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.1/Appodeal.xcframework.zip",
            checksum: "93fd1072476a6d553d0271a09ecccc8a15b74949842ca193710d2ce3fe3742c7"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.1/AppodealMediationCore.xcframework.zip",
            checksum: "bcb974401708f17d35e891b5a113c8ffe5b4fd8339fd31e58316e174adfbfacb"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.1/StackConsentManager.xcframework.zip",
            checksum: "c7d71b37fc0d3248e065fd5248a25155130c68a216279821b1e9faf8ee8a3ad1"
        ),
    ]
)