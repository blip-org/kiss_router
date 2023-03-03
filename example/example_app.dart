import 'package:flutter/material.dart';
import './example_screens.dart' as screens;
import 'package:kiss_router/kiss_router.dart';

KissRouter router = KissRouter(routesDelegate: screens.kissRoutes);

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) => router.onGenerateRoute(settings),
      onGenerateInitialRoutes: router.onGenerateInitialRoute,
      theme: null,
      darkTheme: null,
      themeMode: ThemeMode.dark,
    );
  }
}

void main() {
  runApp(MyApp());
}
