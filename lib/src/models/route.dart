part of kiss_router;

typedef ScreenWidget<A> = Widget Function(BuildContext context, A? arguments);

class KissRouteModel<A> {
  final ScreenWidget<A> widget;
  final Map<String, KissRouteModel> subRoutes;
  final bool isPrivate;
  final ModalConfig? modalConfig;
  final String? substituteRouteName;
  final PreferredSizeWidget? appBar;
  final bool showBottomNavbar;
  RouteTransitionsBuilder? transitionsBuilder;

  final bool fire404;

  A? routeArguments;

  bool get isModal => modalConfig != null;

  KissRouteModel({
    required this.widget,
    this.subRoutes = const <String, KissRouteModel>{},
    this.isPrivate = false,
    this.modalConfig,
    this.substituteRouteName,
    this.appBar,
    this.showBottomNavbar = true,
    this.transitionsBuilder,
    this.fire404 = false,
  }) {
    transitionsBuilder ??= _defaultTransitionsBuilder;
    if (substituteRouteName?.isInvalid ?? false) {
      throw Exception(
        'The substitute route: $substituteRouteName is not valid, It shouldn\'t start with a slash "/" or end with a slash "/)',
      );
    }
    for (final route in subRoutes.keys) {
      if (!route.isInvalid) continue;
      throw Exception(
        'The sub route: $route is not valid, It shouldn\'t start with a slash "/" or end with a slash "/)',
      );
    }
  }

  Widget buildWidget(
    BuildContext context, {
    Widget Function(Widget child)? wrapper,
  }) {
    final child = widget(context, routeArguments);
    return wrapper?.call(child) ?? child;
  }

  Widget _defaultTransitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }

  void setArguments(dynamic arguments) {
    routeArguments = arguments as A;
  }
}
