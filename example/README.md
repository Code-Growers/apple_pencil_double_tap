# Apple Pencil gesture example

Requires Dart 3.13+, Flutter 3.47+, and iOS/iPadOS 15+.

Run `flutter pub get`, then `flutter run` on a supported device. The example logs double-tap events and Apple Pencil Pro squeeze phases. Apple Pencil (2nd generation) supports double-tap; Apple Pencil Pro supports both gestures, with squeeze requiring iPadOS 17.5+.

The app can also be included on iPhone Duo, but its announced Apple Pencil (USB-C) support provides neither double-tap nor squeeze. No gesture events are expected there. The simulator can validate compilation but cannot reproduce physical Pencil gestures.

The listener is registered in `initState` and removed in `dispose`. See the [package README](../README.md) for device compatibility and the full API.
