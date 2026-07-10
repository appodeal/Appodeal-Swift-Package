// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "Appodeal",
    platforms: [.iOS(.v15)],
    products: [
        // Core SDK
        .library(name: "Appodeal", targets: ["AppodealWrapper"]),
        
        // Individual adapters
        
        
        // Full SDK with all adapters
        .library(
            name: "AppodealFull",
            targets: ["AppodealWrapper"] + adapterTargets
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.38.0"),
        .package(
            url: "https://github.com/googleads/swift-package-manager-google-user-messaging-platform.git",
            from: "3.1.0"
        ),
        // Adapter dependencies
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", from: "11.0.0"),
        .package(url: "https://github.com/bidon-io/bidon-sdk-ios", from: "1.0.0"),
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-SDK-iOS.git", from: "13.0.0"),
        .package(url: "https://github.com/Unity-Technologies/unity-ads-ios", from: "4.12.0"),
        // Note: Some SDKs like BidMachine, Meta, Yandex may not have official SPM support yet
        // They would need to be included as binary targets or wait for official SPM releases
    ],
    targets: [
        // Core wrapper target
        .target(
            name: "AppodealWrapper",
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
            ]
        ),
        
        // Core binary targets
        .binaryTarget(
            name: "Appodeal",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.4/Appodeal.xcframework.zip",
            checksum: "b2c16698e16db8cabc6426ca18e879aef63b96e86c68687e802493f6438a8dec"
        ),
        .binaryTarget(
            name: "AppodealMediationCore", 
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.4/AppodealMediationCore.xcframework.zip",
            checksum: "e278a73de58a5b88dd14610ef5060572d816e89622b9e2c25c26cf527b0e4cc0"
        ),
        .binaryTarget(
            name: "StackModules",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.4/StackModules.xcframework.zip",
            checksum: "143050a4d5a0c2e6d11f8dd831b8494475ce3bda62a40564fb628069ce47a962"
        ),
        .binaryTarget(
            name: "StackRendering",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.4/StackRendering.xcframework.zip",
            checksum: "34c2cd2e662324d879d168300edaeee3e46876a3c06093852074f7fc6ce9a4c5"
        ),
        .binaryTarget(
            name: "StackProductPresentation",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.4/StackProductPresentation.xcframework.zip",
            checksum: "bcc8e02d91a1e6275b21837b4e8486a5be96c76698929bb12f4879aa70ae6962"
        ),
        .binaryTarget(
            name: "StackConsentManager",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/4.3.0-alpha.4/StackConsentManager.xcframework.zip",
            checksum: "601f4fc815707ab840bec8b91934623b2b75fe10432931a79611610b6dda77e0"
        ),
        
        // Adapter wrapper targets
        
        
        // Adapter binary targets
        
    ]
)

// Helper array for AppodealFull product
let adapterTargets: [String] = [
    
]