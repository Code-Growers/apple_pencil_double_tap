enum PreferredAction {
  ignore,
  switchEraser,
  switchPrevious,
  showColorPalette,
  showInkAttributes,
  showContextualPalette,
  runSystemShortcut,
  unknown;

  static PreferredAction fromString(String name) {
    return switch(name){
      "ignore" => PreferredAction.ignore,
      "switchEraser" => PreferredAction.switchEraser,
      "switchPrevious" => PreferredAction.switchPrevious,
      "showColorPalette" => PreferredAction.showColorPalette,
      "showInkAttributes" => PreferredAction.showInkAttributes,
      "showContextualPalette" => PreferredAction.showContextualPalette,
      "runSystemShortcut" => PreferredAction.runSystemShortcut,
      _ => PreferredAction.unknown,
    };
  }
}

