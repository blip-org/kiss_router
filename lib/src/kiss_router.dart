library kiss_router;

import 'package:flutter/material.dart';
import 'package:kiss_router/src/utils.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart' as mb;

import '../kiss_router.dart';
import 'enums/modal_type.dart';

part 'models/route.dart';
part 'infrastructure/routes_delegate.dart';
part 'state/provider.dart';
part 'infrastructure/layout.dart';
part 'models/group.dart';
part 'models/group_name.dart';

class KissRouter {
  final KissRoutesDelegate routesDelegate;
  KissRouter({required this.routesDelegate});

  String get initialRoute => routesDelegate.initialRoute.toString();

  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    KissRouteModel route = routesDelegate.getRoute(settings);

    if (route.isModal && route.modalConfig?.modalType == ModalType.material) {
      return mb.ModalSheetRoute(
        builder: (_) => buildPageWithAuthCheck(settings),
        settings: settings,
        expanded: route.modalConfig!.expanded,
        enableDrag: route.modalConfig!.enableDrag,
      );
    }

    if (route.isModal && route.modalConfig?.modalType == ModalType.cupertino) {
      return mb.CupertinoModalBottomSheetRoute(
        builder: (_) => buildPageWithAuthCheck(settings),
        settings: settings,
        expanded: route.modalConfig!.expanded,
        enableDrag: route.modalConfig!.enableDrag,
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
          KissRouteModel route = routesDelegate.getRoute(RouteSettings(name: initialRoute));
          return _getLayout(
            route,
            routesDelegate.wrapperBuilder(
              RouteSettings(name: initialRoute),
              context,
              route.buildWidget(context),
            ),
          );
        },
      )
    ];
  }

  PreferredSizeWidget _getAppBar({required BuildContext context, PreferredSizeWidget? appBar}) {
    if (appBar == null) return noAppBar;
    return appBar;
  }

  Widget _getLayout(KissRouteModel route, Widget screen) {
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
    KissRouteModel route = routesDelegate.getRoute(settings);
    return Builder(builder: (context) {
      // context.watch<KissProvider>().isAuthenticated;
      const isAuthenticated = true;

      if (isAuthenticated && route.isPrivate) {
        return _getLayout(
          route,
          route.buildWidget(
            context,
            wrapper: (child) => routesDelegate.wrapperBuilder(settings, context, child),
          ),
        );
      }

      // if (!isAuthenticated && route.isPrivate) {
      //   if (route.substituteRouteName == null) {
      //     fire404(context);
      //   } else {
      //     route = _getRoute(RouteSettings(
      //       name: route.substituteRouteName?.value,
      //       arguments: settings.arguments,
      //     ));

      //     return _getLayout(route.buildWidget(context), route);
      //   }
      // }

      return _getLayout(
        route,
        route.buildWidget(
          context,
          wrapper: (child) => routesDelegate.wrapperBuilder(
            settings,
            context,
            child,
          ),
        ),
      );
    });
  }

  Widget fire404(BuildContext context) {
    const settings = RouteSettings();
    final route = routesDelegate.getRoute(settings);
    return _getLayout(
      route,
      route.buildWidget(
        context,
        wrapper: (child) => routesDelegate.wrapperBuilder(settings, context, child),
      ),
    );
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
