part of kiss_router;

typedef ScreenWidget<A> = Widget Function(BuildContext context, A? arguments);

enum ModalType {
  cupertino,
  material,
  bar,
}

class KissRouteModel<A> {
  final ScreenWidget<A> widget;
  final Map<KissRouteName, KissRouteModel> subRoutes;
  final bool isPrivate;
  final bool isModal;
  final bool modalExpanded;
  final bool modalEnableDrag;
  final ModalType modalType;
  final KissRouteName? substituteRouteName;
  final PreferredSizeWidget? appBar;
  final bool showBottomNavbar;
  RouteTransitionsBuilder? transitionsBuilder;

  final bool fire404;

  A? routeArguments;

  KissRouteModel({
    required this.widget,
    this.subRoutes = const <KissRouteName, KissRouteModel>{},
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
  }) {
    transitionsBuilder ??= _defaultTransitionsBuilder;
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
