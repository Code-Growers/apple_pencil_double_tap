/// Method-channel implementation of the Apple Pencil platform interface.
library;

import 'package:apple_pencil_double_tap/apple_pencil_double_tap_platform_interface.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Decodes Apple Pencil gesture messages sent by the native iOS plugin.
class MethodChannelApplePencilDoubleTap extends ApplePencilDoubleTapPlatform {
  /// Creates the default iOS method-channel implementation.
  MethodChannelApplePencilDoubleTap();

  /// Channel shared with the native plugin, exposed for testing.
  @visibleForTesting
  final methodChannel = const MethodChannel(
    'tech.codegrowers.applepencildoubletap/apple_pencil_double_tap_plugin',
  );

  @override
  void listen({
    Function(PreferredAction p1)? v1Callback,
    Function(TapAction p1)? onTapAction,
    Function(SqueezeAction p1)? onSqueeze,
    Function(dynamic e)? onError,
  }) {
    methodChannel.setMethodCallHandler((call) async {
      try {
        if (call.method == 'onPencilDoubleTap') {
          switch (call.arguments?.toString()) {
            case 'switchPrevious':
              v1Callback?.call(PreferredAction.switchPrevious);
            case 'showColorPalette':
              v1Callback?.call(PreferredAction.showColorPalette);
            case 'showInkAttributes':
              v1Callback?.call(PreferredAction.showInkAttributes);
            case 'ignore':
              v1Callback?.call(PreferredAction.ignore);
            case 'switchEraser':
              v1Callback?.call(PreferredAction.switchEraser);
            default:
              v1Callback?.call(PreferredAction.unknown);
          }
        }
        if (call.method == "onPencilDoubleTapV2") {
          onTapAction?.call(TapAction.fromJson(call.arguments));
        }
        if (call.method == "onPencilSqueeze") {
          onSqueeze?.call(SqueezeAction.fromJson(call.arguments));
        }
      } catch (e) {
        if (onError != null) {
          onError.call(e);
        } else {
          rethrow;
        }
      }
    });
  }

  @override
  void dispose() {
    methodChannel.setMethodCallHandler(null);
  }
}
