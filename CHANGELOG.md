## 2.0.0

**Breaking changes:** minimum Dart SDK is now 3.13.0 and minimum Flutter is 3.47.0. Minimum iOS/iPadOS is now 15.0.

- Remove the iPad-only device check from both CocoaPods and Swift Package Manager implementations, allowing UIKit interaction registration on iPhone, including iPhone Duo.
- Update the package description and pub.dev topics for Apple Pencil, iPad, iPhone Duo, stylus, and gestures.
- Document that iPhone Duo's announced Apple Pencil (USB-C) support does not provide double-tap or squeeze gestures. No iPhone Duo hardware testing is claimed.
- Add public API documentation and enable the `public_member_api_docs` lint.
- Export `PreferredAction` from the main library for simpler imports.
- Update Swift Package Manager dependencies for current Flutter integration.
- Align CocoaPods and Swift Package Manager deployment targets and update the example's SDK constraints and lint dependency.

## 1.0.2

- Fix issues with newest flutter

## 1.0.1

### Added

- Additional unit tests for squeeze action functionality
- Integration test scenarios for squeeze gesture lifecycle

### Documentation

- Completely rewritten README with detailed API reference
- Added comprehensive code examples for squeeze handling

## 1.0.0

- Update resolving of root view controller
- Swift Package Manager support

**BREAKING CHANGES:**

- Support SDK 3.10+
- Support Flutter 3.38.0+

## 0.1.0

**BREAKING CHANGES:**

- Interface changes after adding support for iPadOS >=17.5

## 0.0.2

- Update minimum dependencies versions.
- Small update to readme.

## 0.0.1

- Initial release.
