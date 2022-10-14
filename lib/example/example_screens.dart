import 'package:flutter/material.dart';
import 'package:kiss_router/example/app_bar_util.dart';

import 'kiss_router.dart';

final kissRoutes = KissRoutesDelegate(
  routes: {
    KissRouteName('/'): KissRouteModel(
      widget: (_, __) => const UpComings(),
      appBar: AppBarUtil.appBar(),
      substituteRouteName: KissRouteName('/welcome'),
    ),
    KissRouteName('/live_session'): KissRouteModel<CourseEntity>(
      widget: (_, arguments) => LiveVideo(
        course: arguments!,
      ),
      substituteRouteName: KissRouteName('/login'),
      appBar: AppBarUtil.appBar(),
      isModal: true,
      modalEnableDrag: false,
    ),
    KissRouteName('/account'): KissRouteModel(
      widget: (_, __) => Account(),
      substituteRouteName: KissRouteName('/login'),
      appBar: AppBarUtil.appBar(),
      subRoutes: {
        KissRouteName('/faq'): KissRouteModel(
          widget: (_, __) => const Faq(),
          substituteRouteName: KissRouteName('/login'),
          appBar: AppBarUtil.appBar(),
          isPrivate: true,
        ),
        KissRouteName('/tos'): KissRouteModel(
          widget: (_, __) => const Tos(),
          substituteRouteName: KissRouteName('/login'),
          appBar: AppBarUtil.appBar(),
          isPrivate: true,
        ),
        KissRouteName('/privacy_policy'): KissRouteModel(
          substituteRouteName: KissRouteName('/login'),
          widget: (_, __) => const PrivacyPolicy(),
          appBar: AppBarUtil.appBar(),
          isPrivate: true,
        ),
      },
      isPrivate: true,
    ),
    KissRouteName('/profile'): KissRouteModel(
      widget: (_, __) => const Profile(),
      substituteRouteName: KissRouteName('/login'),
      appBar: AppBarUtil.appBar(),
      subRoutes: {
        KissRouteName('/edit_name'): KissRouteModel(
          substituteRouteName: KissRouteName('/login'),
          widget: (_, __) => const NameModal(),
          isModal: true,
          isPrivate: true,
        ),
        KissRouteName('/edit_email'): KissRouteModel(
          substituteRouteName: KissRouteName('/login'),
          widget: (_, __) => const EmailModal(),
          isModal: true,
          isPrivate: true,
        ),
        KissRouteName('/edit_password'): KissRouteModel(
          substituteRouteName: KissRouteName('/login'),
          widget: (_, __) => const PasswordModal(),
          isModal: true,
          isPrivate: true,
        ),
      },
      isPrivate: true,
    ),
  },
  notFoundRoute: KissRouteName('/404'),
  initialRoute: KissRouteName('/'),
);
