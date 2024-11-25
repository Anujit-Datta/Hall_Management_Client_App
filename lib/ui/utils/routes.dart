import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hall_management_client/ui/screens/login.dart';
import 'package:hall_management_client/ui/screens/splash.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'home',
          builder: (BuildContext context, GoRouterState state) {
            return const LoginScreen();
          },
        ),
      ],
    ),
  ],
);