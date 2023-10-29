import '../../../stack/common/models/routing/route_definition.dart';
import '../../../stack/common/models/routing/route_setup_params.dart';
import '../../shared/presentation/ui/pages/main_page.dart';

abstract class RouteConfig {
  // Define all the routes here.
  static const mainRoute = '/';

  // Pass this to the setup method of RouteManager.
  static final setupParams = RouteSetupParams(
    routeDefinitions: [
      _mainRouteDefinition,
    ],
  );

  // Construct all the routes here as needed.
  //
  // Main route definition
  static final _mainRouteDefinition = RouteDefinition(
    routePath: mainRoute,
    routeHandler: (context, params) {
      return MainPage(
        params: params,
      );
    },
    transitionType: RouteTransitionType.none,
  );
}
