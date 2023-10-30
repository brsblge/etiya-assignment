import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';

/// Wrapper widget to abstract theming.
/// Use this to wrap your material app as below.
///
/// ```dart
/// void main() async {
///   runApp(
///     MyApp(
///       themeMode: await locator<ThemeManager>().getSavedThemeMode(),
///     ),
///   );
/// }
///
/// class MyApp extends StatelessWidget {
///   MyApp({super.key, this.themeMode});
///
///   final ThemeMode? themeMode;
///
///   @override
///   Widget build(BuildContext context) {
///     return DynamicTheme(
///       lightTheme: ThemeData(
///         brightness: Brightness.light,
///         primarySwatch: Colors.blue,
///       ),
///       darkTheme: ThemeData(
///         brightness: Brightness.dark,
///         primarySwatch: Colors.blueGrey,
///       ),
///       initialMode: themeMode ?? ThemeMode.system,
///       builder: (theme, darkTheme) => MaterialApp(
///         theme: theme,
///         darkTheme: darkTheme,
///         home: MyHomePage(),
///       ),
///     );
///   }
/// }
/// ```
///
/// Note that, initialMode only works at first run after installation.
/// After that, the last saved theme mode will be used for theming.
///
/// Getting the current theme in main before runApp prevents flashing at start.
class DynamicTheme extends AdaptiveTheme {
  DynamicTheme({
    super.key,
    required ThemeData lightTheme,
    ThemeData? darkTheme,
    required ThemeMode initialMode,
    required super.builder,
  }) : super(
          light: lightTheme,
          dark: darkTheme,
          initial: AdaptiveThemeMode.values.byName(
            initialMode.name,
          ),
        );
}
