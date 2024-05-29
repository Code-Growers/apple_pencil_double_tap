enum SqueezePhase {
  began,
  changed,
  ended,
  cancelled,
  unknown;

  static SqueezePhase fromString(String name) {
    return switch(name){
      "began" => SqueezePhase.began,
      "changed" => SqueezePhase.changed,
      "ended" => SqueezePhase.ended,
      "cancelled" => SqueezePhase.cancelled,
      _ => SqueezePhase.unknown,
    };
  }
}