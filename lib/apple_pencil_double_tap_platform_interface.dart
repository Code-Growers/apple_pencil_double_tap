import 'package:apple_pencil_double_tap/apple_pencil_double_tap_method_channel.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

abstract class ApplePencilDoubleTapPlatform extends PlatformInterface {
  ApplePencilDoubleTapPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApplePencilDoubleTapPlatform _instance = MethodChannelApplePencilDoubleTap();

  static ApplePencilDoubleTapPlatform get instance => _instance;

  static set instance(ApplePencilDoubleTapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  void listen({
    Function(PreferredAction p1)? v1Callback,
    Function(TapAction p1)? onTapAction,
    Function(SqueezeAction p1)? onSqueeze,
    Function(dynamic e)? onError,
  }) {
    throw UnimplementedError('listen() has not been implemented.');
  }

  void dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
