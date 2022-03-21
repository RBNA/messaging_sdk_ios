// swift-tools-version:5.5
import PackageDescription
let package = Package(
    name: "ZendeskMessagingSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskMessagingSDK",
            targets: [
              "ZendeskMessagingSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskMessagingAPISDK",
                 url: "https://github.com/RBNA/messagingapi_sdk_ios",
                 branch: "master"),
        .package(name: "ZendeskCommonUISDK",
                 url: "https://github.com/RBNA/commonui_sdk_ios",
                 branch: "master")
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskMessagingSDK",
            path: "ZendeskMessagingSDK.xcframework"
        ),
        .target(name: "ZendeskMessagingSDKTargets",
                dependencies: [
                    .target(name: "ZendeskMessagingSDK"),
                    .product(name: "ZendeskMessagingAPISDK", package: "ZendeskMessagingAPISDK"),
                    .product(name: "ZendeskCommonUISDK", package: "ZendeskCommonUISDK")
                ],
                path: "Sources"
        )
    ]
)
