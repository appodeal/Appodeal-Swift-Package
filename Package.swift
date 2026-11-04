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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.2/Appodeal.xcframework.zip",
            checksum: "f1f4c44082c147b6ed4f4cd7fd58e7ef42a89bbf5d887f6bcda627abc71c59c6"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.2/AppodealMediationCore.xcframework.zip",
            checksum: "c839a14173dd178f5cd7ba474d2f0638ba75f3720a4d0107fc8d226e1eb96a2d"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.2/StackConsentManager.xcframework.zip",
            checksum: "049ce92f3bdc997c007117238bcc533253cf8554f3694917dbc954fbf95f7288"
        ),
    ]
)