import 'dart:io';

import 'prefered_double_tap_action.dart';
import 'apple_pencil_double_tap_platform_interface.dart';

export 'prefered_double_tap_action.dart';

class ApplePencilDoubleTap {
  void listen(Function(PreferredDoubleTapAction) callback) {
    if (Platform.isIOS) {
      ApplePencilDoubleTapPlatform.instance.listen(callback);
    }
  }

  void dispose() {
    ApplePencilDoubleTapPlatform.instance.dispose();
  }
}
