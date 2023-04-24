part of kiss_router;

class KissRoutesDelegate {
  late final String _notFoundRoute;
  late final String _initialRoute;
  late final Map<String, KissRouteModel> _routes;
  late final List<GroupModel> _groups;

  KissRoutesDelegate({
    required Map<String, KissRouteModel> routes,
    String? notFoundRoute,
    required String initialRoute,
    List<GroupModel> groups = const [],
  }) : assert(routes[notFoundRoute] != null) {
    _notFoundRoute = notFoundRoute ?? '/404';
    _initialRoute = initialRoute;
    _routes = routes;
  }

  String get initialRoute => _initialRoute;

  KissRouteModel getRoute(RouteSettings? routeSettings) {
    late String routeName;

    if (routeSettings != null && routeSettings.name != null) {
      routeName = routeSettings.name!;
    } else {
      routeName = _notFoundRoute;
    }

    final subRouteNames = _subRouteNames(routeName);

    KissRouteModel? route;

    if (subRouteNames == null) {
      route = _routes[routeName];
    } else {
      final mainRoute = subRouteNames[0];
      final subRouteName = subRouteNames[1];
      route = _routes[mainRoute]?.subRoutes[subRouteName];
    }

    route ??= _routes[_notFoundRoute];

    if (routeSettings?.arguments != null) {
      route?.setArguments(routeSettings?.arguments);
    }

    return route!;
  }

  List<String>? _subRouteNames(String routeName) {
    List<String> routeNames = [];
    final splitRouteName = routeName.toString().split('/')..removeAt(0);
    if (!(splitRouteName.length > 1)) return null;

    for (String route in splitRouteName) {
      routeNames.add('/$route');
    }

    return routeNames;
  }
}
