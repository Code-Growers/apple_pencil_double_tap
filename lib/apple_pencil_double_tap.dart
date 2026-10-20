/// Apple Pencil double-tap and squeeze callbacks for compatible iOS devices.
library;

import 'dart:io';

import 'package:apple_pencil_double_tap/apple_pencil_double_tap_platform_interface.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';
export 'package:apple_pencil_double_tap/entities/preferred_action.dart';
export 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
export 'package:apple_pencil_double_tap/entities/squeeze_phase.dart';
export 'package:apple_pencil_double_tap/entities/tap_action.dart';

/// Listens for Apple Pencil gestures delivered by UIKit.
///
/// Double-tap requires Apple Pencil (2nd generation) or Apple Pencil Pro.
/// Squeeze requires Apple Pencil Pro. Apple Pencil (USB-C), including on
/// iPhone Duo, does not provide either gesture.
class ApplePencilDoubleTap {
  /// Creates an Apple Pencil gesture listener.
  ApplePencilDoubleTap();

  /// Registers callbacks for gestures supported by the connected Apple Pencil.
  ///
  /// Use [v1Callback] before iPadOS 17.5 and [onTapAction] or [onSqueeze] on
  /// iPadOS 17.5 or later. Hover coordinates are null when unavailable.
  /// [onError] receives errors encountered while decoding or handling events;
  /// errors are rethrown when no error callback is supplied.
  ///
  /// Calling this again replaces the callbacks. On non-iOS native platforms,
  /// this method does nothing. Unsupported hardware emits no gesture events.
  void listen({
    Function(PreferredAction action)? v1Callback,
    Function(TapAction action)? onTapAction,
    Function(SqueezeAction action)? onSqueeze,
    Function(dynamic e)? onError,
  }) {
    if (Platform.isIOS) {
      ApplePencilDoubleTapPlatform.instance.listen(
        v1Callback: v1Callback,
        onTapAction: onTapAction,
        onSqueeze: onSqueeze,
        onError: onError,
      );
    }
  }

  /// Removes the shared platform channel's gesture callbacks.
  ///
  /// Call this when the listener is no longer needed, such as in a widget's
  /// `dispose` method. All instances share the same platform channel.
  void dispose() {
    ApplePencilDoubleTapPlatform.instance.dispose();
  }
}
