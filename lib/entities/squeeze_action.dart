import 'package:apple_pencil_double_tap/entities/preffered_action.dart';
import 'package:apple_pencil_double_tap/entities/squeeze_phase.dart';

class SqueezeAction {
  final PreferredAction preferredAction;
  final SqueezePhase squeezePhase;
  /// values between 0.0 - 1.0
  final double? zOffset;
  final double? locationX;
  final double? locationY;

  SqueezeAction({
    required this.preferredAction,
    required this.squeezePhase,
    required this.zOffset,
    required this.locationX,
    required this.locationY,
  });


  factory SqueezeAction.fromJson(Map<Object?, Object?> json) => SqueezeAction(
    preferredAction: PreferredAction.fromString(json["preferredAction"]!.toString()),
    squeezePhase: SqueezePhase.fromString(json["squeezePhase"]!.toString()),
    zOffset: json["zOffset"] as double?,
    locationY: json["locationY"] as double?,
    locationX: json["locationX"] as double?,
  );

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
