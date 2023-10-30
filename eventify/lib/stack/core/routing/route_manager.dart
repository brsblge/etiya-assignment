import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

import '../../common/models/routing/route_setup_params.dart';
import '../logging/logger.dart';

/// A tool to manage navigation between routes.
abstract class RouteManager {
  /// This should be given to MaterialApp.onGenerateRoute.
  Route<dynamic>? Function(RouteSettings)? get generator;

  /// Sets up all the route definitions by [setupParams].
  /// To be called in main before runApp.
  ///
  /// Example usage:
  ///
  /// ```dart
  /// abstract class RouteConfig {
  ///   static const route1 = 'route1';
  ///   static const route2 = 'route2';
  ///
  ///   static final setupParams = RouteSetupParams(
  ///     routeDefinitions: [
  ///       _routeDefinition1,
  ///       _routeDefinition2,
  ///     ],
  ///   );
  ///
  ///   static final _routeDefinition1 = RouteDefinition(
  ///     routePath: route1,
  ///     routeHandler: (context) {
  ///       return Page1();
  ///     },
  ///     transitionType: RouteTransitionType.inFromLeft,
  ///   );
  ///   static final _routeDefinition2 = RouteDefinition(
  ///     routePath: route2,
  ///     routeHandler: (context) {
  ///       return Page2();
  ///     },
  ///     transitionType: RouteTransitionType.inFromRight,
  ///   );
  /// }
  ///
  /// void main() {
  ///   routeManager.setup(RouteConfig.setupParams);
  /// }
  /// ```
  void setup(RouteSetupParams setupParams);

  /// Navigates to the given [route] with optional [params].
  Future<void> goRoute(
    BuildContext context,
    String route, {
    Object? params,
  });

  /// Navigates to the given [route]
  /// removing all the others with optional [params].
  Future<void> goRouteAsRoot(
    BuildContext context,
    String route, {
    Object? params,
  });

  /// Navigates back to the previous route.
  void goBack(
    BuildContext context,
  );

  /// Navigates back to a [route] removing all the routes in between.
  void returnRoute(
    BuildContext context,
    String route,
  );

  /// Replaces the current route with the given [route].
  Future<void> replaceRoute(
    BuildContext context,
    String route, {
    Object? params,
  });

  /// Refreshes the current route.
  Future<void> refreshRoute(
    BuildContext context, {
    Object? params,
  });
}

/// RouteManager Implementation
class RouteManagerImpl implements RouteManager {
  RouteManagerImpl(this._logger);

  final Logger _logger;

  final _router = FluroRouter();

  @override
  Route<dynamic>? Function(RouteSettings)? get generator => _router.generator;

  @override
  void setup(RouteSetupParams setupParams) {
    for (final definition in setupParams.routeDefinitions) {
      _router.define(
        definition.routePath,
        handler: Handler(
          handlerFunc: (context, _) {
            // Construct the page as per the definition.
            return definition.routeHandler(
              context,
              ModalRoute.of(context!)?.settings.arguments,
            );
          },
        ),
        transitionType: definition.transitionType != null
            ? TransitionType.values.byName(
                definition.transitionType!.name,
              )
            : null,
        transitionBuilder: definition.transitionBuilder,
        transitionDuration: definition.transitionDuration,
      );
    }
  }

  @override
  Future<void> goRoute(
    BuildContext context,
    String route, {
    Object? params,
  }) {
    try {
      return Navigator.of(context).pushNamed(
        route,
        arguments: params,
      );
    } catch (e) {
      _logger.error(
        'Navigating to $route failed.\n${e.toString()}',
        callerType: runtimeType,
      );
    }
    return Future.value();
  }

  @override
  Future<void> goRouteAsRoot(
    BuildContext context,
    String route, {
    Object? params,
  }) {
    try {
      return Navigator.of(context).pushNamedAndRemoveUntil(
        route,
        arguments: params,
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      _logger.error(
        'Navigating to $route as root failed.\n${e.toString()}',
        callerType: runtimeType,
      );
    }
    return Future.value();
  }

  @override
  void goBack(
    BuildContext context,
  ) {
    try {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop();
      }
    } catch (e) {
      _logger.error(
        'Navigating back failed.\n${e.toString()}',
        callerType: runtimeType,
      );
    }
  }

  @override
  void returnRoute(
    BuildContext context,
    String route,
  ) {
    try {
      Navigator.of(context).popUntil(
        ModalRoute.withName(route),
      );
    } catch (e) {
      _logger.error(
        'Returning to $route failed.\n${e.toString()}',
        callerType: runtimeType,
      );
    }
  }

  @override
  Future<void> replaceRoute(
    BuildContext context,
    String route, {
    Object? params,
  }) {
    try {
      return Navigator.of(context).pushReplacementNamed(
        route,
        arguments: params,
      );
    } catch (e) {
      _logger.error(
        'Replacing route with $route failed.\n${e.toString()}',
        callerType: runtimeType,
      );
    }
    return Future.value();
  }

  @override
  Future<void> refreshRoute(
    BuildContext context, {
    Object? params,
  }) {
    try {
      // Get the current route name.
      final currentRoute = ModalRoute.of(context)?.settings.name;
      if (currentRoute == null) {
        _logger.error(
          'Refreshing current route failed '
          'as route name could not be determined.',
          callerType: runtimeType,
        );
        return Future.value();
      }
      // Refresh the current route.
      return Navigator.of(context).pushReplacementNamed(
        currentRoute,
        arguments: params,
      );
    } catch (e) {
      _logger.error(
        'Refreshing current route failed.\n${e.toString()}',
        callerType: runtimeType,
      );
    }
    return Future.value();
  }
}
