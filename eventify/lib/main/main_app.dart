import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../configs/localization/localization_config.dart';
import '../configs/route/route_config.dart';
import '../features/discover/presentation/cubits/event_cubit.dart';
import '../stack/base/data/local_storage.dart';
import '../stack/core/ioc/service_locator.dart';
import '../stack/core/localization/dynamic_localization.dart';
import '../stack/core/localization/localizor.dart';
import '../stack/core/logging/logger.dart';
import '../stack/core/network/api_manager.dart';
import '../stack/core/routing/route_manager.dart';
import '../stack/core/theme/dynamic_theme.dart';

class MainApp extends StatefulWidget {
  const MainApp({
    super.key,
    required this.logger,
    required this.localizor,
    required this.apiManager,
    required this.routeManager,
    required this.lightTheme,
    required this.darkTheme,
    this.themeMode,
  });

  final Logger logger;
  final Localizor localizor;
  final ApiManager apiManager;
  final RouteManager routeManager;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final ThemeMode? themeMode;

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return DynamicLocalization(
      path: LocalizationConfig.assetsPath,
      supportedLocales: LocalizationConfig.supportedLocales,
      fallbackLocale: LocalizationConfig.fallbackLocale,
      useFallbackTranslations: true,
      child: DynamicTheme(
        lightTheme: widget.lightTheme,
        darkTheme: widget.darkTheme,
        initialMode: widget.themeMode ?? ThemeMode.light,
        builder: _buildMaterialApp,
      ),
    );
  }

  @override
  void dispose() async {
    // Dispose local storage.
    await LocalStorage.dispose();
    super.dispose();
  }

  // Helpers
  Widget _buildMaterialApp(ThemeData theme, ThemeData darkTheme) {
    final localizor = widget.localizor;
    final routeManager = widget.routeManager;

    return _MaterialApp(
      theme: theme,
      darkTheme: darkTheme,
      localizor: localizor,
      routeManager: routeManager,
    );
  }
}

class _MaterialApp extends StatelessWidget {
  const _MaterialApp({
    required this.theme,
    required this.darkTheme,
    required this.localizor,
    required this.routeManager,
  });

  final ThemeData theme;
  final ThemeData darkTheme;
  final Localizor localizor;
  final RouteManager routeManager;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _buildCubitProviders(),
      child: MaterialApp(
        onGenerateTitle: (_) => localizor.tr('title_app'),
        // Localization
        localizationsDelegates: localizor.getLocalizationDelegates(context),
        supportedLocales: localizor.getSupportedLocales(context),
        locale: localizor.getLocale(context),
        // Theme
        theme: theme,
        darkTheme: darkTheme,
        // Navigation
        onGenerateRoute: routeManager.generator,
        initialRoute: RouteConfig.mainRoute,
        builder: _buildApp,
      ),
    );
  }

  // Helpers
  List<BlocProvider> _buildCubitProviders() {
    return [
      BlocProvider<EventCubit>(
        create: (context) => locator<EventCubit>(),
      ),
    ];
  }

  Widget _buildApp(BuildContext context, Widget? child) {
    return MediaQuery(
      // Prevent system settings change font size of the app.
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
      child: child!,
    );
  }
  // - Helpers
}
