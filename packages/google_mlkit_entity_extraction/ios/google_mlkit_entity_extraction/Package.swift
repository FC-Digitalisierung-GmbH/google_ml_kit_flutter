// swift-tools-version: 5.9

// SwiftPM manifest added by FC-Digitalisierung-GmbH for the Prio365 app
// (Azure DevOps #21226): CocoaPods trunk goes read-only on 2026-12-02.
// ML Kit binaries come from d-date/google-mlkit-swiftpm (ML Kit 9.0.0
// repackaged as xcframeworks), because Google publishes no SwiftPM package.
// The podspec next to this folder still works for CocoaPods users.

import PackageDescription

let package = Package(
  name: "google_mlkit_entity_extraction",
  platforms: [
    .iOS("15.5")
  ],
  products: [
    .library(name: "google-mlkit-entity-extraction", targets: ["google_mlkit_entity_extraction"])
  ],
  dependencies: [
    // Flutter symlinks every plugin's SwiftPM folder side by side into
    // ios/Flutter/ephemeral/Packages/.packages/<folder name>, and SwiftPM resolves
    // this path from that symlink. So the sibling is "../google_mlkit_commons":
    // the very path Flutter's generated package uses, which avoids a conflicting
    // package identity. (A repo-relative "../../../google_mlkit_commons/..." would
    // point into nowhere from the symlink.) Holds for path: and git: + path:
    // dependencies, where the folder name has no version suffix.
    .package(path: "../google_mlkit_commons"),
    .package(url: "https://github.com/d-date/google-mlkit-swiftpm", exact: "9.0.2"),
  ],
  targets: [
    .target(
      name: "google_mlkit_entity_extraction",
      dependencies: [
        .product(name: "MLKitEntityExtraction", package: "google-mlkit-swiftpm"),
        .product(name: "google-mlkit-commons", package: "google_mlkit_commons"),
      ]
    )
  ]
)
