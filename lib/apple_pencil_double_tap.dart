import 'dart:io';

import 'package:apple_pencil_double_tap/entities/preffered_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';

import 'apple_pencil_double_tap_platform_interface.dart';

export 'package:apple_pencil_double_tap/entities/preffered_action.dart';
export 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
export 'package:apple_pencil_double_tap/entities/squeeze_phase.dart';
export 'package:apple_pencil_double_tap/entities/tap_action.dart';

class ApplePencilDoubleTap {
  void listen({
    Function(PreferredAction p1)? v1Callback,
    Function(TapAction p1)? onTapAction,
    Function(SqueezeAction p1)? onSqueeze,
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
