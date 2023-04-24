part of kiss_router;

class KissRoutesDelegate {
  late final KissRouteName _notFoundRoute;
  late final KissRouteName _initialRoute;
  late final Map<KissRouteName, KissRouteModel> _routes;
  late final List<GroupModel> _groups;

  KissRoutesDelegate({
    required Map<KissRouteName, KissRouteModel> routes,
    KissRouteName? notFoundRoute,
    required KissRouteName initialRoute,
    List<GroupModel> groups = const [],
  }) : assert(routes[notFoundRoute] != null) {
    _notFoundRoute = notFoundRoute ?? KissRouteName('/404');
    _initialRoute = initialRoute;
    _routes = routes;
  }

  KissRouteName get initialRoute => _initialRoute;

  KissRouteModel getRoute(RouteSettings? routeSettings) {
    late KissRouteName routeName;

    if (routeSettings != null && routeSettings.name != null) {
      routeName = KissRouteName(routeSettings.name!);
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

  List<KissRouteName>? _subRouteNames(KissRouteName routeName) {
    List<KissRouteName> routeNames = [];
    final splitRouteName = routeName.toString().split('/')..removeAt(0);
    if (!(splitRouteName.length > 1)) {
      return null;
    }

    for (String route in splitRouteName) {
      routeNames.add(KissRouteName('/$route'));
    }

    return routeNames;
  }
}
