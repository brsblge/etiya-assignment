import 'package:flutter/material.dart';

/// App-specific custom text style properties defined by the design.
@immutable
class TextThemeExtension extends ThemeExtension<TextThemeExtension> {
  const TextThemeExtension({
    required this.headerLarge,
    required this.headerMedium,
    required this.headerSmall,
    required this.bodyRegular,
    required this.bodyMedium,
    required this.bodyBold,
    required this.bodyMetaRegular,
    required this.bodyMetaMedium,
    required this.bodyMetaBold,
    required this.bodyInfoRegular,
    required this.bodyInfoMedium,
    required this.linkBodyMedium,
    required this.linkBodySmall,
  });

  final TextStyle headerLarge;
  final TextStyle headerMedium;
  final TextStyle headerSmall;
  final TextStyle bodyRegular;
  final TextStyle bodyMedium;
  final TextStyle bodyBold;
  final TextStyle bodyMetaRegular;
  final TextStyle bodyMetaMedium;
  final TextStyle bodyMetaBold;
  final TextStyle bodyInfoRegular;
  final TextStyle bodyInfoMedium;
  final TextStyle linkBodyMedium;
  final TextStyle linkBodySmall;

  @override
  TextThemeExtension copyWith({
    TextStyle? headerLarge,
    TextStyle? headerMedium,
    TextStyle? headerSmall,
    TextStyle? bodyRegular,
    TextStyle? bodyMedium,
    TextStyle? bodyBold,
    TextStyle? bodyMetaRegular,
    TextStyle? bodyMetaMedium,
    TextStyle? bodyMetaBold,
    TextStyle? bodyInfoRegular,
    TextStyle? bodyInfoMedium,
    TextStyle? linkBodyMedium,
    TextStyle? linkBodySmall,
  }) {
    return TextThemeExtension(
      headerLarge: headerLarge ?? this.headerLarge,
      headerMedium: headerMedium ?? this.headerMedium,
      headerSmall: headerSmall ?? this.headerSmall,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      bodyMedium: bodyMedium ?? this.bodyMedium,
      bodyBold: bodyBold ?? this.bodyBold,
      bodyMetaRegular: bodyMetaRegular ?? this.bodyMetaRegular,
      bodyMetaMedium: bodyMetaMedium ?? this.bodyMetaMedium,
      bodyMetaBold: bodyMetaBold ?? this.bodyMetaBold,
      bodyInfoRegular: bodyInfoRegular ?? this.bodyInfoRegular,
      bodyInfoMedium: bodyInfoMedium ?? this.bodyInfoMedium,
      linkBodyMedium: linkBodyMedium ?? this.linkBodyMedium,
      linkBodySmall: linkBodySmall ?? this.linkBodySmall,
    );
  }

  @override
  TextThemeExtension lerp(
    ThemeExtension<TextThemeExtension>? other,
    double t,
  ) {
    if (other is! TextThemeExtension) {
      return this;
    }
    return TextThemeExtension(
      headerLarge: TextStyle.lerp(
            headerLarge,
            other.headerLarge,
            t,
          ) ??
          headerLarge,
      headerMedium: TextStyle.lerp(
            headerMedium,
            other.headerMedium,
            t,
          ) ??
          headerMedium,
      headerSmall: TextStyle.lerp(
            headerSmall,
            other.headerSmall,
            t,
          ) ??
          headerSmall,
      bodyRegular: TextStyle.lerp(
            bodyRegular,
            other.bodyRegular,
            t,
          ) ??
          bodyRegular,
      bodyMedium: TextStyle.lerp(
            bodyMedium,
            other.bodyMedium,
            t,
          ) ??
          bodyMedium,
      bodyBold: TextStyle.lerp(
            bodyBold,
            other.bodyBold,
            t,
          ) ??
          bodyBold,
      bodyMetaRegular: TextStyle.lerp(
            bodyMetaRegular,
            other.bodyMetaRegular,
            t,
          ) ??
          bodyMetaRegular,
      bodyMetaMedium: TextStyle.lerp(
            bodyMetaMedium,
            other.bodyMetaMedium,
            t,
          ) ??
          bodyMetaMedium,
      bodyMetaBold: TextStyle.lerp(
            bodyMetaBold,
            other.bodyMetaBold,
            t,
          ) ??
          bodyMetaBold,
      bodyInfoRegular: TextStyle.lerp(
            bodyInfoRegular,
            other.bodyInfoRegular,
            t,
          ) ??
          bodyInfoRegular,
      bodyInfoMedium: TextStyle.lerp(
            bodyInfoMedium,
            other.bodyInfoMedium,
            t,
          ) ??
          bodyInfoMedium,
      linkBodyMedium: TextStyle.lerp(
            linkBodyMedium,
            other.linkBodyMedium,
            t,
          ) ??
          linkBodyMedium,
      linkBodySmall: TextStyle.lerp(
            linkBodySmall,
            other.linkBodySmall,
            t,
          ) ??
          linkBodySmall,
    );
  }

  TextThemeExtension apply({
    String? fontFamily,
    double fontSizeFactor = 1.0,
    double fontSizeDelta = 0.0,
    Color? displayColor,
    Color? bodyColor,
    TextDecoration? decoration,
    Color? decorationColor,
    TextDecorationStyle? decorationStyle,
  }) {
    return TextThemeExtension(
      headerLarge: headerLarge.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headerMedium: headerMedium.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      headerSmall: headerSmall.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyRegular: bodyRegular.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyMedium: bodyMedium.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyBold: bodyBold.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyMetaRegular: bodyMetaRegular.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyMetaMedium: bodyMetaMedium.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyMetaBold: bodyMetaBold.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyInfoRegular: bodyInfoRegular.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      bodyInfoMedium: bodyInfoMedium.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      linkBodyMedium: linkBodyMedium.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
      linkBodySmall: linkBodySmall.apply(
        color: displayColor,
        decoration: decoration,
        decorationColor: decorationColor,
        decorationStyle: decorationStyle,
        fontFamily: fontFamily,
        fontSizeFactor: fontSizeFactor,
        fontSizeDelta: fontSizeDelta,
      ),
    );
  }
}
