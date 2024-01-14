# Apple Pencil Double Tap

Simple and easy to use plugin for [apple pencil interaction](https://developer.apple.com/documentation/uikit/uipencilinteraction) detection in any Flutter application.

This package includes platform-specific implementation code for iOS 12.1+ and iPadOS 12.1+.

## Instalation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
apple_pencil_double_tap: <latest_version>
```

## Usage

You can use it very easily. For example:

```dart
import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';
 
ApplePencilDoubleTap().listen((PreferredDoubleTapAction preferedAction) {
    print('Double tap detected. Prefered user action: $preferedAction');
});
```

## Info

apple_pencil_double_tap version: 0.0.2

## License

MIT

## TODO

- Integration tests
