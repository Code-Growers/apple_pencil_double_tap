/// Apple Pencil Pro squeeze event data received from UIKit.
library;

import 'package:apple_pencil_double_tap/entities/squeeze_phase.dart';
import 'package:apple_pencil_double_tap/entities/tap_action.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';

/// An Apple Pencil Pro squeeze event, including its phase and hover pose.
class SqueezeAction extends TapAction {
  /// The current stage of the squeeze gesture.
  final SqueezePhase squeezePhase;

  /// Creates a squeeze event; hover values may be null when unavailable.
  SqueezeAction({
    required super.preferredAction,
    required this.squeezePhase,
    required super.zOffset,
    required super.locationX,
    required super.locationY,
  });

  /// Decodes a native payload containing `preferredAction` and `squeezePhase`.
  ///
  /// Hover values may be null. Unrecognized action and phase names map to
  /// their respective `unknown` enum values.
  factory SqueezeAction.fromJson(Map<Object?, Object?> json) => SqueezeAction(
    preferredAction: PreferredAction.fromString(
      json["preferredAction"]!.toString(),
    ),
    squeezePhase: SqueezePhase.fromString(json["squeezePhase"]!.toString()),
    zOffset: json["zOffset"] as double?,
    locationY: json["locationY"] as double?,
    locationX: json["locationX"] as double?,
  );

  @override
  Map<String, dynamic> toJson() => {
    "preferredAction": preferredAction,
    "squeezePhase": squeezePhase,
    "zOffset": zOffset,
    "locationY": locationY,
    "locationX": locationX,
  };

  @override
  String toString() => toJson().toString();
}
