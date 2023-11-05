import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'prefered_double_tap_action.dart';
import 'apple_pencil_double_tap_method_channel.dart';

abstract class ApplePencilDoubleTapPlatform extends PlatformInterface {
  ApplePencilDoubleTapPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApplePencilDoubleTapPlatform _instance =
      MethodChannelApplePencilDoubleTap();

  static ApplePencilDoubleTapPlatform get instance => _instance;

  static set instance(ApplePencilDoubleTapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void listen(Function(PreferredDoubleTapAction) callback) {
    throw UnimplementedError('listen() has not been implemented.');
  }

  void dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
