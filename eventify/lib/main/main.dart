// ignore_for_file: prefer-static-class

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../configs/dependency/dependency_config.dart';
import '../configs/route/route_config.dart';
import '../configs/theme/theme_config.dart';
import '../stack/core/ioc/service_locator.dart';
import '../stack/core/localization/localizor.dart';
import '../stack/core/logging/logger.dart';
import '../stack/core/network/api_manager.dart';
import '../stack/core/routing/route_manager.dart';
import '../stack/core/theme/theme_manager.dart';
import 'main_app.dart';

void main() {
  // Run app handling Dart errors.
  runZonedGuarded(
    () async {
      // Initialize all the app components.
      await _initializeComponents();
      // Handle Flutter errors.
      FlutterError.onError = _onFlutterError;
      // Run main app.
      runApp(
        MainApp(
          logger: locator<Logger>(),
          localizor: locator<Localizor>(),
          apiManager: locator<ApiManager>(),
          routeManager: locator<RouteManager>(),
          // Get the currently saved theme mode to prevent flashing.
          themeMode: await locator<ThemeManager>().getThemeMode(),
          lightTheme: ThemeConfig.lightTheme,
          darkTheme: ThemeConfig.darkTheme,
        ),
      );
    },
    // Handle Dart errors.
    _onDartError,
  );
}

Future<void> _initializeComponents() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Service locator must be initialized before the other components.
  locator.initialize(external: DependencyConfig.register);
  await locator<Localizor>().initialize();
  locator<RouteManager>().setup(RouteConfig.setupParams);
}

void _onFlutterError(FlutterErrorDetails error) {
  FlutterError.presentError(error);
  locator<Logger>().critical(
    error.toString(minLevel: DiagnosticLevel.error),
  );
  if (kReleaseMode) exit(1);
}

void _onDartError(Object error, StackTrace stack) {
  locator<Logger>().critical(
    '${error.toString()}\n${stack.toString()}',
  );
  if (kReleaseMode) exit(1);
}
