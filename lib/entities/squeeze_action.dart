import 'package:apple_pencil_double_tap/apple_pencil_double_tap.dart';
import 'package:apple_pencil_double_tap/entities/preferred_action.dart';

class SqueezeAction extends TapAction {
  final SqueezePhase squeezePhase;

  SqueezeAction({
    required super.preferredAction,
    required this.squeezePhase,
    required super.zOffset,
    required super.locationX,
    required super.locationY,
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
