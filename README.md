# Apple Pencil Double Tap

Simple and easy to use plugin for [apple pencil interaction](https://developer.apple.com/documentation/uikit/uipencilinteraction) detection in any Flutter application.

This package includes platform-specific implementation code for iOS 12.1+ and iPadOS 12.1+.

## Instalation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
apple_pencil_double_tap: <latest_version>
```

### Swift Package Manager

This plugin supports both CocoaPods and Swift Package Manager for iOS integration.

To use Swift Package Manager (available in Flutter 3.24.0+), you can enable it by running:

```bash
flutter config --enable-swift-package-manager
```

## Usage

You can use it very easily. For example:

```dart
import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';

ApplePencilDoubleTap().listen(
    // For iPadOS <17.5
    v1Callback: (PreferredAction preferedAction) {
        print('Double tap detected. Prefered user action: $preferedAction');
    },
    // For iPadOS >=17.5
    onTapAction: (TapAction action) {
        print('TapAction: $action');
    },
    // For iPadOS >=17.5
    onSqueeze: (SqueezeAction action) {
        print('SqueezeAction: $action');
    },
    onError: (e) {
        print('Error: $e');
    },
);
```

## Info

apple_pencil_double_tap version: 1.0.0

## License

MIT
