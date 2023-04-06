

part of kiss_router;

class KissRoutesDelegate {
  KissRoutesDelegate({
    required Map<KissRouteName, KissRouteModel> routes,
    KissRouteName? notFoundRoute,
    required KissRouteName initialRoute,
  }) : assert(routes[notFoundRoute] != null) {
    _notFoundRoute = notFoundRoute ?? KissRouteName('/404');
    _initialRoute = initialRoute;
    _routes = routes;
  }

  late final KissRouteName _notFoundRoute;

  late final KissRouteName _initialRoute;

  late final Map<KissRouteName, KissRouteModel> _routes;

  KissRouteModel getRoute(RouteSettings? routeSettings) {
    KissRouteName? routeName;

    if (routeSettings != null && routeSettings.name != null) {
      routeName = KissRouteName(routeSettings.name!);
    } else {
      routeName = _notFoundRoute;
    }

    KissRouteModel? route;
    print("=============== route: $routeName");
    final subRouteNames = _subRouteNames(routeName);
    print("=============== subRoutes: $subRouteNames");
    if (subRouteNames != null) {
      final mainRoute = subRouteNames[0];
      final subRouteName = subRouteNames[1];
      route = _routes[mainRoute]?.subRoutes[subRouteName];
    } else {
      route = _routes[routeName];
    }

    route ??= _routes[_notFoundRoute];

    if (routeSettings?.arguments != null) {
      print("=========== arguments: ${routeSettings?.arguments}");
      route?.setArguments(routeSettings?.arguments);
    }

    return route!;
  }

  List<KissRouteName>? _subRouteNames(KissRouteName routeName) {
    List<KissRouteName> routeNames = [];
    final splitRouteName = routeName.toString().split('/')..removeAt(0);
    print("========= splited: $splitRouteName");
    if (!(splitRouteName.length > 1)) {
      return null;
    }

    for (String route in splitRouteName) {
      routeNames.add(KissRouteName('/$route'));
    }
    print("==== looped route: $routeNames");
    return routeNames;
  }
}
