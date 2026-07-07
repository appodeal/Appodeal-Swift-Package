// swift-tools-version:5.9
import PackageDescription

// ─────────────────────────────────────────────────────────────────────────────
// Appodeal SDK — Swift Package (binary distribution, core only for now).
//
// The core ships as prebuilt xcframeworks (Appodeal, AppodealMediationCore) hosted on S3;
// the first-party Stack* xcframeworks are vendored the same way until they publish their own
// SwiftPM packages. binaryTargets carry no dependencies/linker flags, so the `AppodealSDK`
// wrapper target holds the SwiftProtobuf + UMP dependencies, the system-framework links, and
// `-ObjC` (so the core's ObjC categories load).
//
// `url` + `checksum` for every binaryTarget are filled in by the release automation
// (fastlane `swift_package` lane) at publish time. The placeholders below are replaced per
// release; do not hand-edit.
// ─────────────────────────────────────────────────────────────────────────────

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

        // ── Prebuilt binaries (url + checksum injected by the release lane) ──
        .binaryTarget(
            name: "Appodeal",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.3/Appodeal.xcframework.zip",
            checksum: "29f0efbb02aaa409299b515e4c1b5fb368be107032efac5b9ef0b763ee93f723"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.3/AppodealMediationCore.xcframework.zip",
            checksum: "065cf8c4fc06477040d1cadc10fe0998b2d1dc73e5d650655d38eb538c42d258"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.3/StackModules.xcframework.zip",
            checksum: "0393c62a86aab91d9ed36aeea2b9a2cc5790b901c4ca0204d8676664c8e49192"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.3/StackRendering.xcframework.zip",
            checksum: "46f20e63fe9a4036213db0ce54938be5b3499fe639ff3714fe0cd1d435a683bc"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.3/StackProductPresentation.xcframework.zip",
            checksum: "61633d4d09ef3651918dc6ada304143562f8310c28b1fa99cf80e36d3dbdd9f9"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.3/StackConsentManager.xcframework.zip",
            checksum: "0edc4d7e4527076c9da6e57b991c8555e874d105e8042d6203de04f990e9f83a"
        ),
    ]
)
