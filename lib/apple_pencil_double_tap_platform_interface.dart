/// Platform interface for receiving native Apple Pencil gesture events.
library;

import 'package:apple_pencil_double_tap/apple_pencil_double_tap_method_channel.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_action.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// Contract implemented by Apple Pencil platform integrations.
abstract class ApplePencilDoubleTapPlatform extends PlatformInterface {
  /// Creates a token-verified platform implementation.
  ApplePencilDoubleTapPlatform() : super(token: _token);

  static final Object _token = Object();

  static ApplePencilDoubleTapPlatform _instance =
      MethodChannelApplePencilDoubleTap();

  /// The active platform implementation, defaulting to the iOS method channel.
  static ApplePencilDoubleTapPlatform get instance => _instance;

  /// Replaces the platform implementation after verifying its interface token.
  static set instance(ApplePencilDoubleTapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Registers legacy tap, modern tap, squeeze, and error callbacks.
  ///
  /// Implementations replace any previously registered callbacks.
  void listen({
    Function(PreferredAction p1)? v1Callback,
    Function(TapAction p1)? onTapAction,
    Function(SqueezeAction p1)? onSqueeze,
    Function(dynamic e)? onError,
  }) {
    throw UnimplementedError('listen() has not been implemented.');
  }

  /// Removes callbacks and releases resources owned by the implementation.
  void dispose() {
    throw UnimplementedError('dispose() has not been implemented.');
  }
}
