/// User-selected Apple Pencil actions reported by UIKit.
library;

/// The action selected for an Apple Pencil gesture in system Settings.
enum PreferredAction {
  /// Take no action.
  ignore,

  /// Switch between the current tool and the eraser.
  switchEraser,

  /// Switch between the current tool and the previously used tool.
  switchPrevious,

  /// Display the color palette.
  showColorPalette,

  /// Display ink attributes; available on iOS 16 or later.
  showInkAttributes,

  /// Display the contextual palette; available on iOS 17.5 or later.
  showContextualPalette,

  /// Run the configured system shortcut; available on iOS 17.5 or later.
  runSystemShortcut,

  /// The native action was absent or unrecognized by this package.
  unknown;

  /// Converts a native action name, returning [unknown] for unrecognized names.
  static PreferredAction fromString(String name) {
    return switch (name) {
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
