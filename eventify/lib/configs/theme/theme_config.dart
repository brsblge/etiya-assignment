import 'package:flutter/material.dart';

import 'color_scheme_extension.dart';
import 'text_theme_extension.dart';

/// Custom theme configuration for Case Construction.
/// Theme data and both color schemes can be accessed over [BuildContextExt].
abstract class ThemeConfig {
  static ThemeData get lightTheme => ThemeData.light().copyWith(
        useMaterial3: true,
        extensions: <ThemeExtension<dynamic>>[
          // App-specific custom color scheme
          const ColorSchemeExtension(
            primaryDefault: _Colors.primaryDefault,
            primaryDisabled: _Colors.primaryDisabled,
            secondaryDefault: _Colors.secondaryDefault,
            secondaryDisabled: _Colors.secondaryDisabled,
            backgroundPrimary: _Colors.backgroundPrimary,
            backgroundSecondary: _Colors.backgroundSecondary,
            textPrimary: _Colors.textPrimary,
            textSecondary: _Colors.textSecondary,
            textDisabled: _Colors.textDisabled,
            error: _Colors.error,
            warning: _Colors.warning,
            success: _Colors.success,
          ),
          // App-specific custom text theme
          TextThemeExtension(
            headerLarge: _Typography.headerLarge,
            headerMedium: _Typography.headerMedium,
            headerSmall: _Typography.headerSmall,
            bodyRegular: _Typography.bodyRegular,
            bodyMedium: _Typography.bodyMedium,
            bodyBold: _Typography.bodyBold,
            bodyMetaRegular: _Typography.bodyMetaRegular,
            bodyMetaMedium: _Typography.bodyMetaMedium,
            bodyMetaBold: _Typography.bodyMetaBold,
            bodyInfoRegular: _Typography.bodyInfoRegular,
            bodyInfoMedium: _Typography.bodyInfoMedium,
            linkBodySmall: _Typography.linkBodySmall,
            linkBodyMedium: _Typography.linkBodyMedium,
          ).apply(
            fontFamily: 'Roboto',
            bodyColor: _Colors.textPrimary,
            displayColor: _Colors.textPrimary,
          ),
        ],
        scaffoldBackgroundColor: _Colors.backgroundPrimary,
      );

  static ThemeData get darkTheme => ThemeData.dark().copyWith(
      // Properties to be set when dark mode is supported.
      );
}

abstract class _Colors {
  // Primary colors
  static const primaryDefault = Color(0xFF0B3096);
  static const primaryDisabled = Color(0x99E58E1A);
  static const secondaryDefault = Color(0xFFFFFFFF);
  static const secondaryDisabled = Color(0xFFF4F4F4);
  // Background colors
  static const backgroundPrimary = Color(0xFFFFFFFF);
  static const backgroundSecondary = Color(0xFFF9F9F9);
  // Text colors
  static const textPrimary = Color(0xFF000000);
  static const textSecondary = Color(0xFF515353);
  static const textDisabled = Color(0xFF9B9B9B);
  // Others
  static const error = Color(0xFFB50202);
  static const warning = Color(0xFFCE7001);
  static const success = Color(0xFF00AB3E);
}

abstract class _Typography {
  static TextStyle get headerLarge => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 30,
        height: 1.2,
        letterSpacing: 0,
      );
  static TextStyle get headerMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 24,
        height: 1.5,
        letterSpacing: 0,
      );
  static TextStyle get headerSmall => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        height: 1.2,
        letterSpacing: 0,
      );
  static TextStyle get bodyRegular => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0,
      );
  static TextStyle get bodyMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0,
      );
  static TextStyle get bodyBold => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.5,
        letterSpacing: 0,
      );
  static TextStyle get bodyMetaRegular => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        height: 1.428,
        letterSpacing: 0,
      );
  static TextStyle get bodyMetaMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.428,
        letterSpacing: 0,
      );
  static TextStyle get bodyMetaBold => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        height: 1.428,
        letterSpacing: 0,
      );
  static TextStyle get bodyInfoRegular => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0,
      );
  static TextStyle get bodyInfoMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1.5,
        letterSpacing: 0,
      );
  static TextStyle get linkBodyMedium => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
        height: 1.25,
        letterSpacing: 0,
      );
  static TextStyle get linkBodySmall => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        height: 1.285,
        letterSpacing: 0,
      );
}
