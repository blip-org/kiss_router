part of kiss_router;

typedef ScreenWidget<A> = Widget Function(BuildContext context, A? arguments);

class KissRouteModel<A> {
  final ScreenWidget<A> widget;
  final Map<String, KissRouteModel> subRoutes;
  final bool isPrivate;
  final bool isModal;
  final bool modalExpanded;
  final bool modalEnableDrag;
  final ModalType modalType;
  final String? substituteRouteName;
  final PreferredSizeWidget? appBar;
  final bool showBottomNavbar;
  RouteTransitionsBuilder? transitionsBuilder;

  final bool fire404;

  A? routeArguments;

  KissRouteModel({
    required this.widget,
    this.subRoutes = const <String, KissRouteModel>{},
    this.isPrivate = false,
    this.isModal = false,
    this.modalExpanded = false,
    this.modalEnableDrag = true,
    this.modalType = ModalType.material,
    this.substituteRouteName,
    this.appBar,
    this.showBottomNavbar = true,
    this.transitionsBuilder,
    this.fire404 = false,
  }) : assert(
          substituteRouteName?.isInvalid ?? false,
          'Substition route name is not valid. It shouldn\'t start with a slash "/" or end with a slash "/)',
        ) {
    transitionsBuilder ??= _defaultTransitionsBuilder;

    for (final route in subRoutes.keys) {
      if (!route.isInvalid) continue;
      throw Exception(
        'The sub route: $route is not valid, It shouldn\'t start with a slash "/" or end with a slash "/)',
      );
    }
  }

  Widget buildWidget(BuildContext context) {
    return widget(context, routeArguments);
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
