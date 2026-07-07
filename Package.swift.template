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
                // Load ObjC categories (APDFactory+*, NS*+*) from the static core.
                .unsafeFlags(["-Xlinker", "-ObjC"]),
            ]
        ),

        // ── Prebuilt binaries (url + checksum injected by the release lane) ──
        .binaryTarget(
            name: "Appodeal",
            url: "https://APPODEAL_SPM_BASE_URL/Appodeal.xcframework.zip",
            checksum: "APPODEAL_CHECKSUM"
        ),
        .binaryTarget(
            name: "AppodealMediationCore",
            url: "https://APPODEAL_SPM_BASE_URL/AppodealMediationCore.xcframework.zip",
            checksum: "APPODEALMEDIATIONCORE_CHECKSUM"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://APPODEAL_SPM_BASE_URL/StackModules.xcframework.zip",
            checksum: "STACKMODULES_CHECKSUM"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://APPODEAL_SPM_BASE_URL/StackRendering.xcframework.zip",
            checksum: "STACKRENDERING_CHECKSUM"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://APPODEAL_SPM_BASE_URL/StackProductPresentation.xcframework.zip",
            checksum: "STACKPRODUCTPRESENTATION_CHECKSUM"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://APPODEAL_SPM_BASE_URL/StackConsentManager.xcframework.zip",
            checksum: "STACKCONSENTMANAGER_CHECKSUM"
        ),
    ]
)
