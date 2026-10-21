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
            checksum: "d64a148732ab474b524b18f3db56624aded4a1a5e17f384a16d5e09f497df112"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.1/AppodealMediationCore.xcframework.zip",
            checksum: "0017b0db2323383fb12d60fc8ba0d16c595798de725ff510010973e36cf9e3de"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.1/StackConsentManager.xcframework.zip",
            checksum: "6fc0d718b6ee289dfcc7610c85a373f4b34d448269ccac4afe02189b82545976"
        ),
    ]
)