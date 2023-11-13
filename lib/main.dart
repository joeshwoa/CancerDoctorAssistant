import 'package:cancer_doctor_assistant/pages/home_page.dart';
import 'package:cancer_doctor_assistant/pages/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomeScreenWidget();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'HomePage',
          builder: (BuildContext context, GoRouterState state) {
            return const HomePageWidget();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'CDA',
    );
  }
}
