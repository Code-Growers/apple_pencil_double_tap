/// Double-tap event data received from UIKit.
library;

import 'package:apple_pencil_double_tap/entities/preferred_action.dart';

/// An Apple Pencil double-tap event and its optional hover pose.
class TapAction {
  /// The user's selected action for this gesture in system Settings.
  final PreferredAction preferredAction;

  /// Normalized distance from the display, from 0.0 to 1.0, if available.
  final double? zOffset;

  /// Horizontal hover position in the native view's coordinates, if available.
  final double? locationX;

  /// Vertical hover position in the native view's coordinates, if available.
  final double? locationY;

  /// Creates an event; use null hover values when no pose is available.
  TapAction({
    required this.preferredAction,
    required this.zOffset,
    required this.locationX,
    required this.locationY,
  });

  /// Decodes a native channel payload containing an action and hover values.
  ///
  /// The payload must contain `preferredAction`; hover values may be null.
  factory TapAction.fromJson(Map<Object?, Object?> json) => TapAction(
    preferredAction: PreferredAction.fromString(
      json["preferredAction"]!.toString(),
    ),
    zOffset: json["zOffset"] as double?,
    locationY: json["locationY"] as double?,
    locationX: json["locationX"] as double?,
  );

  /// Returns the event fields as a map, retaining [PreferredAction] enum values.
  ///
  /// Convert enum values to names before passing the map to `jsonEncode`.
  Map<String, dynamic> toJson() => {
    "preferredAction": preferredAction,
    "zOffset": zOffset,
    "locationY": locationY,
    "locationX": locationX,
  };

  @override
  String toString() => toJson().toString();
}
