import 'package:apple_pencil_double_tap/entities/preferred_action.dart';

class TapAction {
  final PreferredAction preferredAction;

  /// values between 0.0 - 1.0
  final double? zOffset;
  final double? locationX;
  final double? locationY;

  TapAction({
    required this.preferredAction,
    required this.zOffset,
    required this.locationX,
    required this.locationY,
  });

  factory TapAction.fromJson(Map<Object?, Object?> json) => TapAction(
        preferredAction:
            PreferredAction.fromString(json["preferredAction"]!.toString()),
        zOffset: json["zOffset"] as double?,
        locationY: json["locationY"] as double?,
        locationX: json["locationX"] as double?,
      );

  Map<String, dynamic> toJson() => {
        "preferredAction": preferredAction,
        "zOffset": zOffset,
        "locationY": locationY,
        "locationX": locationX,
      };

  @override
  String toString() => toJson().toString();
}
