# Apple Pencil Double Tap

A Flutter plugin for detecting Apple Pencil interactions including **double-tap** and **squeeze** gestures.

Simple and easy to use plugin for [Apple Pencil interaction](https://developer.apple.com/documentation/uikit/uipencilinteraction) detection in any Flutter application.

## Features

- Detect Apple Pencil double-tap gestures (Apple Pencil 2nd generation and later)
- Detect Apple Pencil squeeze gestures (Apple Pencil Pro only)
- Real-time event streaming with hover pose information
- Access user's preferred action settings from iOS Settings app
- Support for iOS 12.1+ and iPadOS 12.1+
- Swift Package Manager support

## Requirements

- iOS/iPadOS 12.1 or later
- Apple Pencil (2nd generation) for double-tap
- **Apple Pencil Pro** for squeeze gesture (requires iPadOS 17.5+)
- Flutter 3.38.0 or later

## Installation

In the `dependencies:` section of your `pubspec.yaml`, add the following line:

```yaml
apple_pencil_double_tap: <latest_version>
```

Then run:

```bash
flutter pub get
```

### Swift Package Manager

This plugin supports both CocoaPods and Swift Package Manager for iOS integration.

To use Swift Package Manager (available in Flutter 3.24.0+), you can enable it by running:

```bash
flutter config --enable-swift-package-manager
```

## Usage

### Basic Setup

```dart
import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';

final applePencil = ApplePencilDoubleTap();

applePencil.listen(
    // For iPadOS <17.5 (legacy API)
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

// Don't forget to dispose when done
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

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

MIT
