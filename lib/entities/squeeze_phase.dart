/// Lifecycle phases of Apple Pencil Pro squeeze gestures.
library;

/// The current stage of an Apple Pencil Pro squeeze gesture.
enum SqueezePhase {
  /// The squeeze gesture started.
  began,

  /// The squeeze gesture is continuing.
  changed,

  /// The squeeze gesture completed.
  ended,

  /// The system cancelled the squeeze gesture.
  cancelled,

  /// The native phase was absent or unrecognized by this package.
  unknown;

  /// Converts a native phase name, returning [unknown] for unrecognized names.
  static SqueezePhase fromString(String name) {
    return switch (name) {
      "began" => SqueezePhase.began,
      "changed" => SqueezePhase.changed,
      "ended" => SqueezePhase.ended,
      "cancelled" => SqueezePhase.cancelled,
      _ => SqueezePhase.unknown,
    };
  }
}
