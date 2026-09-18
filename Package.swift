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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.0/Appodeal.xcframework.zip",
            checksum: "82b0b0248f9ab212be674d976960d53740320fa67e7785a6def942b96e4c8536"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.0/AppodealMediationCore.xcframework.zip",
            checksum: "443a79d6e8dfdb1f3ed4d6646da66704bc392103cc46cb58adee179d0ab065df"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/Appodeal/4.4.0/StackConsentManager.xcframework.zip",
            checksum: "7ff0b84f8f8b0c252ecda0c0f94f53e620022434f88c3fde7e83dd9c11cc7d4e"
        ),
    ]
)