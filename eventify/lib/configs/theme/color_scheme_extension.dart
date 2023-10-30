import 'package:flutter/material.dart';

/// App-specific custom color properties defined by the design.
@immutable
class ColorSchemeExtension extends ThemeExtension<ColorSchemeExtension> {
  const ColorSchemeExtension({
    required this.primaryDefault,
    required this.primaryDisabled,
    required this.secondaryDefault,
    required this.secondaryDisabled,
    required this.backgroundPrimary,
    required this.backgroundSecondary,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.error,
    required this.warning,
    required this.success,
  });

  final Color primaryDefault;
  final Color primaryDisabled;
  final Color secondaryDefault;
  final Color secondaryDisabled;
  final Color backgroundPrimary;
  final Color backgroundSecondary;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color error;
  final Color warning;
  final Color success;

  @override
  ColorSchemeExtension copyWith({
    Color? primaryDefault,
    Color? primaryDisabled,
    Color? secondaryDefault,
    Color? secondaryDisabled,
    Color? backgroundPrimary,
    Color? backgroundSecondary,
    Color? textPrimary,
    Color? textSecondary,
    Color? textDisabled,
    Color? error,
    Color? warning,
    Color? success,
  }) {
    return ColorSchemeExtension(
      primaryDefault: primaryDefault ?? this.primaryDefault,
      primaryDisabled: primaryDisabled ?? this.primaryDisabled,
      secondaryDefault: secondaryDefault ?? this.secondaryDefault,
      secondaryDisabled: secondaryDisabled ?? this.secondaryDisabled,
      backgroundPrimary: backgroundPrimary ?? this.backgroundPrimary,
      backgroundSecondary: backgroundSecondary ?? this.backgroundSecondary,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      error: error ?? this.error,
      warning: warning ?? this.warning,
      success: success ?? this.success,
    );
  }

  @override
  ColorSchemeExtension lerp(
    ThemeExtension<ColorSchemeExtension>? other,
    double t,
  ) {
    if (other is! ColorSchemeExtension) {
      return this;
    }
    return ColorSchemeExtension(
      primaryDefault: Color.lerp(
            primaryDefault,
            other.primaryDefault,
            t,
          ) ??
          primaryDefault,
      primaryDisabled: Color.lerp(
            primaryDisabled,
            other.primaryDisabled,
            t,
          ) ??
          primaryDisabled,
      secondaryDefault: Color.lerp(
            secondaryDefault,
            other.secondaryDefault,
            t,
          ) ??
          secondaryDefault,
      secondaryDisabled: Color.lerp(
            secondaryDisabled,
            other.secondaryDisabled,
            t,
          ) ??
          secondaryDisabled,
      backgroundPrimary: Color.lerp(
            backgroundPrimary,
            other.backgroundPrimary,
            t,
          ) ??
          backgroundPrimary,
      backgroundSecondary: Color.lerp(
            backgroundSecondary,
            other.backgroundSecondary,
            t,
          ) ??
          backgroundSecondary,
      textPrimary: Color.lerp(
            textPrimary,
            other.textPrimary,
            t,
          ) ??
          textPrimary,
      textSecondary: Color.lerp(
            textSecondary,
            other.textSecondary,
            t,
          ) ??
          textSecondary,
      textDisabled: Color.lerp(
            textDisabled,
            other.textDisabled,
            t,
          ) ??
          textDisabled,
      error: Color.lerp(
            error,
            other.error,
            t,
          ) ??
          error,
      warning: Color.lerp(
            warning,
            other.warning,
            t,
          ) ??
          warning,
      success: Color.lerp(
            success,
            other.success,
            t,
          ) ??
          success,
    );
  }
}
