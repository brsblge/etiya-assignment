import 'dart:ui';

abstract class LocalizationConfig {
  // Provide a new Locale here when supported.
  static const enUS = Locale('en', 'US');
  static const trTR = Locale('tr', 'TR');

  /// Fallback locale to load when others fail.
  /// Important: This MUST be the locale which has all the reference
  /// translations in a JSON file under assets/translations.
  static const fallbackLocale = enUS;

  /// Update this list if a new Locale is supported.
  static const supportedLocales = [enUS, trTR];

  static const assetsPath = 'assets/translations';
}
