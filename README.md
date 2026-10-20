# Apple Pencil Double Tap

A Flutter plugin for **Apple Pencil double-tap and squeeze gestures** on compatible iPads, with iOS integration that also allows **iPhone Duo**. Gesture availability depends on the Apple Pencil model.

Receive native [UIKit Apple Pencil interactions](https://developer.apple.com/documentation/uikit/uipencilinteraction) through Dart callbacks in your Flutter iOS app.

## Features

- Detect Apple Pencil double-tap gestures (Apple Pencil 2nd generation or Apple Pencil Pro)
- Detect Apple Pencil squeeze gestures (Apple Pencil Pro only)
- Gesture callbacks with hover pose information when available
- Access user's preferred action settings from iOS Settings app
- Native UIKit registration on iPad and iPhone, including iPhone Duo
- Swift Package Manager support

## Device and Apple Pencil compatibility

| Device and Apple Pencil | Double-tap | Squeeze |
| ----------------------- | ---------- | ------- |
| Compatible iPad + Apple Pencil (2nd generation) | Yes | No |
| Compatible iPad + Apple Pencil Pro | Yes | Yes, with iPadOS 17.5+ |
| iPhone Duo + Apple Pencil (USB-C) | No | No |
| Apple Pencil (1st generation) or Apple Pencil (USB-C) | No | No |

The plugin no longer restricts `UIPencilInteraction` registration to the iPad device idiom. It can be included in iPhone Duo apps, but **this does not add double-tap or squeeze to Apple Pencil (USB-C)**. Apple's [iPhone Duo announcement](https://www.apple.com/newsroom/2026/09/apple-unveils-iphone-duo/) lists Apple Pencil (USB-C) support as coming later in 2026; that model has neither gesture. See Apple's [Pencil feature comparison](https://www.apple.com/apple-pencil/) for hardware capabilities.

This package listens for UIKit gesture callbacks. It does not implement drawing, handwriting recognition, raw stylus input, or standalone hover tracking. No gesture callbacks are expected on hardware without double-tap or squeeze. iPhone Duo hardware has not been tested with this release.

## Requirements

- iOS/iPadOS 15.0 or later
- Apple Pencil (2nd generation) for double-tap
- **Apple Pencil Pro** for squeeze gesture (requires iPadOS 17.5+)
- Dart 3.13.0 or later
- Flutter 3.47.0 or later
- Xcode 15.4 or later for the iOS 17.5 Pencil APIs; your Flutter version may require a newer Xcode

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
apple_pencil_double_tap: ^2.0.0
```

Then run:

```bash
flutter pub get
```

### Swift Package Manager

This plugin supports both CocoaPods and Swift Package Manager for iOS integration.

Swift Package Manager is enabled by default in current Flutter releases. If your local configuration has disabled it, enable it with:

```bash
flutter config --enable-swift-package-manager
```

## Usage

### Basic Setup

```dart
import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';

final applePencil = ApplePencilDoubleTap();

applePencil.listen(
    // Before iPadOS 17.5 (legacy API)
    v1Callback: (PreferredAction preferredAction) {
        print('Double tap detected. Preferred user action: $preferredAction');
    },
    // For iPadOS >=17.5 (new API with hover pose)
    onTapAction: (TapAction action) {
        print('TapAction: $action');
        print('Preferred action: ${action.preferredAction}');
        if (action.zOffset != null) {
            print('Hover z-offset: ${action.zOffset}');
        }
    },
    // For iPadOS >=17.5 - Apple Pencil Pro squeeze gesture
    onSqueeze: (SqueezeAction action) {
        print('SqueezeAction: $action');
        print('Phase: ${action.squeezePhase}');
        print('Preferred action: ${action.preferredAction}');
    },
    onError: (e) {
        print('Error: $e');
    },
);

// Call from your widget's dispose method when done
applePencil.dispose();
```

### Handling Squeeze Events

The squeeze gesture is a continuous interaction available only on **Apple Pencil Pro**. It provides phase information to track the gesture lifecycle:

```dart
applePencil.listen(
    onSqueeze: (SqueezeAction action) {
        switch (action.squeezePhase) {
            case SqueezePhase.began:
                print('Squeeze started');
                break;
            case SqueezePhase.changed:
                print('Squeeze ongoing');
                break;
            case SqueezePhase.ended:
                print('Squeeze completed - perform action');
                break;
            case SqueezePhase.cancelled:
                print('Squeeze was cancelled');
                break;
            case SqueezePhase.unknown:
                print('Unknown phase');
                break;
        }
    },
);
```

## API Reference

### ApplePencilDoubleTap

The main class for interacting with Apple Pencil.

#### Methods

- `listen({...})` - Start listening for Apple Pencil interactions
- `dispose()` - Stop listening and clean up resources

### Callback Parameters

| Parameter     | Type                         | Description                                                  |
| ------------- | ---------------------------- | ------------------------------------------------------------ |
| `v1Callback`  | `Function(PreferredAction)?` | Legacy callback for iPadOS <17.5                             |
| `onTapAction` | `Function(TapAction)?`       | Callback for double-tap events (iPadOS 17.5+)                |
| `onSqueeze`   | `Function(SqueezeAction)?`   | Callback for squeeze events (Apple Pencil Pro, iPadOS 17.5+) |
| `onError`     | `Function(dynamic)?`         | Error callback                                               |

### TapAction

Represents a double-tap event on the Apple Pencil.

| Property          | Type              | Description                               |
| ----------------- | ----------------- | ----------------------------------------- |
| `preferredAction` | `PreferredAction` | User's preferred action from Settings     |
| `locationX`       | `double?`         | X coordinate of hover position            |
| `locationY`       | `double?`         | Y coordinate of hover position            |
| `zOffset`         | `double?`         | Z-offset (0.0-1.0) - distance from screen |

### SqueezeAction

Represents a squeeze event on Apple Pencil Pro. Extends `TapAction`.

| Property          | Type              | Description                               |
| ----------------- | ----------------- | ----------------------------------------- |
| `preferredAction` | `PreferredAction` | User's preferred action from Settings     |
| `squeezePhase`    | `SqueezePhase`    | Current phase of the squeeze gesture      |
| `locationX`       | `double?`         | X coordinate of hover position            |
| `locationY`       | `double?`         | Y coordinate of hover position            |
| `zOffset`         | `double?`         | Z-offset (0.0-1.0) - distance from screen |

### SqueezePhase

Enum representing the phase of a squeeze gesture.

| Value       | Description                   |
| ----------- | ----------------------------- |
| `began`     | Squeeze gesture started       |
| `changed`   | Squeeze gesture is ongoing    |
| `ended`     | Squeeze gesture completed     |
| `cancelled` | Squeeze gesture was cancelled |
| `unknown`   | Unknown phase                 |

### PreferredAction

Enum representing the user's preferred action as configured in iOS Settings.

| Value                   | Description                              |
| ----------------------- | ---------------------------------------- |
| `ignore`                | No action                                |
| `switchEraser`          | Switch between current tool and eraser   |
| `switchPrevious`        | Switch between current and previous tool |
| `showColorPalette`      | Show color palette                       |
| `showInkAttributes`     | Show ink attributes (iOS 16.0+)          |
| `showContextualPalette` | Show contextual palette (iOS 17.5+)      |
| `runSystemShortcut`     | Run system shortcut (iOS 17.5+)          |
| `unknown`               | Unknown action                           |

## Example

See the [example](example/) directory for a complete sample application demonstrating both double-tap and squeeze detection.

## Topics

`#apple-pencil` `#ipad` `#iphone-duo` `#stylus` `#gestures`

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT
