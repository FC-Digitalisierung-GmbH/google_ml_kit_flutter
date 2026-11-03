// swift-tools-version: 5.9

// SwiftPM manifest added by FC-Digitalisierung-GmbH for the Prio365 app
// (Azure DevOps #21226): CocoaPods trunk goes read-only on 2026-12-02.
// ML Kit binaries come from d-date/google-mlkit-swiftpm (ML Kit 9.0.0
// repackaged as xcframeworks), because Google publishes no SwiftPM package.
// The podspec next to this folder still works for CocoaPods users.

import PackageDescription

let package = Package(
  name: "google_mlkit_commons",
  platforms: [
    .iOS("15.5")
  ],
  products: [
    .library(name: "google-mlkit-commons", targets: ["google_mlkit_commons"])
  ],
  dependencies: [
    .package(url: "https://github.com/d-date/google-mlkit-swiftpm", exact: "9.0.2")
  ],
  targets: [
    .target(
      name: "google_mlkit_commons",
      dependencies: [
        // d-date exposes no standalone MLKitVision / MLKitCommon product; every
        // product that contains them also ships a model. Text recognition (Latin)
        // is the one this fork's consumer ships anyway, so it adds nothing.
        .product(name: "MLKitTextRecognition", package: "google-mlkit-swiftpm")
      ]
    )
  ]
)
