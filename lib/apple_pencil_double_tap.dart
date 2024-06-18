import 'dart:io';

import 'package:apple_pencil_double_tap/apple_pencil_double_tap_platform_interface.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';
export 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
export 'package:apple_pencil_double_tap/entities/squeeze_phase.dart';
export 'package:apple_pencil_double_tap/entities/tap_action.dart';

class ApplePencilDoubleTap {
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

  void dispose() {
    ApplePencilDoubleTapPlatform.instance.dispose();
  }
}
