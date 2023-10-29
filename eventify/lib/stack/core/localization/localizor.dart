import 'package:easy_localization/easy_localization.dart';
import 'package:easy_logger/easy_logger.dart';
import 'package:flutter/widgets.dart';

/// A tool to handle localization over the course of the app lifecycle.
abstract class Localizor {
  /// To be called in main before runApp.
  Future<void> initialize();

  /// Gets localization delegates to be used in MaterialApp widget.
  List<LocalizationsDelegate<dynamic>> getLocalizationDelegates(
    BuildContext context,
  );

  /// Gets all the supported Locales.
  List<Locale> getSupportedLocales(BuildContext context);

  /// Gets the current Locale.
  Locale getLocale(BuildContext context);

  /// Changes the current Locale with the given one and rebuilds the app.
  Future<void> changeLocale(BuildContext context, Locale newLocale);

  /// Translates the given [text] with [args] if provided.
  String translate(
    String text, {
    num? pluralValue,
    List<String>? args,
    Map<String, String>? namedArgs,
  });

  /// Short version of the [translate] method.
  String tr(
    String text, {
    num? pluralValue,
    List<String>? args,
    Map<String, String>? namedArgs,
  });
}

/// Localizor Implementation
class LocalizorImpl implements Localizor {
  @override
  Future<void> initialize() {
    EasyLocalization.logger.enableLevels = const <LevelMessages>[
      LevelMessages.error,
      LevelMessages.warning,
    ];
    return EasyLocalization.ensureInitialized();
  }

  @override
  List<LocalizationsDelegate<dynamic>> getLocalizationDelegates(
    BuildContext context,
  ) {
    return context.localizationDelegates;
  }

  @override
  List<Locale> getSupportedLocales(BuildContext context) {
    return context.supportedLocales;
  }

  @override
  Locale getLocale(BuildContext context) {
    return context.locale;
  }

  @override
  Future<void> changeLocale(BuildContext context, Locale newLocale) {
    return context.setLocale(newLocale);
  }

  @override
  String translate(
    String text, {
    num? pluralValue,
    List<String>? args,
    Map<String, String>? namedArgs,
  }) {
    if (pluralValue != null) {
      return plural(
        text,
        pluralValue,
        args: args,
        namedArgs: namedArgs,
      );
    }
    return text.tr(args: args, namedArgs: namedArgs);
  }

  @override
  String tr(
    String text, {
    num? pluralValue,
    List<String>? args,
    Map<String, String>? namedArgs,
  }) {
    return translate(
      text,
      pluralValue: pluralValue,
      args: args,
      namedArgs: namedArgs,
    );
  }
}
