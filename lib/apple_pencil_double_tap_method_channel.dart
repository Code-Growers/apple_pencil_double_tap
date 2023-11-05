import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'prefered_double_tap_action.dart';
import 'apple_pencil_double_tap_platform_interface.dart';

class MethodChannelApplePencilDoubleTap extends ApplePencilDoubleTapPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel(
      'tech.codegrowers.applepencildoubletap/apple_pencil_double_tap_plugin');

  @override
  void listen(Function(PreferredDoubleTapAction) callback) {
    methodChannel.setMethodCallHandler((call) async {
      if (call.method == 'onPencilDoubleTap') {
        switch (call.arguments?.toString()) {
          case 'switchPrevious':
            callback(PreferredDoubleTapAction.switchPrevious);
          case 'showColorPalette':
            callback(PreferredDoubleTapAction.showColorPalette);
          case 'showInkAttributes':
            callback(PreferredDoubleTapAction.showInkAttributes);
          case 'ignore':
            callback(PreferredDoubleTapAction.ignore);
          case 'switchEraser':
            callback(PreferredDoubleTapAction.switchEraser);
          default:
            callback(PreferredDoubleTapAction.none);
        }
      }
    });
  }

  @override
  void dispose() {
    methodChannel.setMethodCallHandler(null);
  }
}
