library kiss_router;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

part 'route_model.dart';
part 'route_name.dart';
part 'routes.dart';
part 'provider.dart';
part 'layout.dart';

class KissRouter {
  KissRouter({
    required this.routesDelegate,
  });

  final KissRoutesDelegate routesDelegate;

  KissRouteModel _getRoute(RouteSettings? routeSettings) {
    return routesDelegate.getRoute(routeSettings);
  }

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    KissRouteModel route = _getRoute(settings);

    if (route.isModal && route.modalType == ModalType.material) {
      return ModalBottomSheetRoute(
        builder: (_) => buildPageWithAuthCheck(settings),
        settings: settings,
        expanded: route.modalExpanded,
        enableDrag: route.modalEnableDrag,
      );
    }

    if (route.isModal && route.modalType == ModalType.cupertino) {
      return CupertinoModalBottomSheetRoute(
        builder: (_) => buildPageWithAuthCheck(settings),
        settings: settings,
        expanded: route.modalExpanded,
        enableDrag: route.modalEnableDrag,
      );
    }

    return PageRouteBuilder(
      pageBuilder: (context, _, __) {
        return buildPageWithAuthCheck(settings);
      },
      settings: settings,
      transitionDuration: const Duration(seconds: 0),
    );
  }

  List<Route<dynamic>> onGenerateInitialRoute(String initialRoute) {
    return <Route>[
      MaterialPageRoute(
        builder: (context) {
          KissRouteModel route = _getRoute(RouteSettings(name: initialRoute));

          return _getLayout(route.buildWidget(context), route);
        },
      )
    ];
  }

  PreferredSizeWidget _getAppBar(
      {required BuildContext context, PreferredSizeWidget? appBar}) {
    if (appBar == null) {
      return noAppBar;
    }
    return appBar;
  }

  Widget _getLayout(Widget screen, KissRouteModel route) {
    if (route.isModal) return screen;
    return Builder(
      builder: (context) {
        return KissLayout(
          body: screen,
          appBar: _getAppBar(context: context, appBar: route.appBar),
          showBottomNavBar: route.showBottomNavbar,
        );
      },
    );
  }

  Widget buildPageWithAuthCheck(RouteSettings settings) {
    KissRouteModel route = _getRoute(settings);
    return Builder(builder: (context) {
      final isAuthenticated = context.watch<KissProvider>().isAuthenticated;
      if (isAuthenticated && route.isPrivate) {
        return _getLayout(route.buildWidget(context), route);
      }

      if (!isAuthenticated && route.isPrivate) {
        if (route.substituteRouteName == null) {
          fire404(context);
        } else {
          route = _getRoute(RouteSettings(
            name: route.substituteRouteName?.value,
            arguments: settings.arguments,
          ));

          return _getLayout(route.buildWidget(context), route);
        }
      }

      return _getLayout(route.buildWidget(context), route);
    });
  }

  Widget fire404(BuildContext context) {
    final route = _getRoute(const RouteSettings());
    return _getLayout(route.buildWidget(context), route);
  }

  PreferredSize noAppBar = PreferredSize(
    preferredSize: const Size(0, 0),
    child: Container(
      color: Colors.transparent,
      height: 0,
      width: 0,
    ),
  );
}
