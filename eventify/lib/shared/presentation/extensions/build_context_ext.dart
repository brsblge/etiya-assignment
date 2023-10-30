import 'package:flutter/material.dart';

import '../../../configs/theme/color_scheme_extension.dart';
import '../../../configs/theme/text_theme_extension.dart';

extension BuildContextExt on BuildContext {
  /// Gets the nearest theme data in the widget tree.
  ThemeData get theme => Theme.of(this);

  /// Gets the current color scheme combining built-in and custom color schemes.
  ColorSchemeExtension get colorScheme {
    return Theme.of(this).extension<ColorSchemeExtension>()!;
  }

  /// Gets the current text theme combining built-in and custom text themes.
  TextThemeExtension get textTheme {
    return Theme.of(this).extension<TextThemeExtension>()!;
  }
}
