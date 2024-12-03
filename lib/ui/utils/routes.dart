import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hall_management_client/ui/screens/home.dart';
import 'package:hall_management_client/ui/screens/login.dart';
import 'package:hall_management_client/ui/screens/otp.dart';
import 'package:hall_management_client/ui/screens/reset.dart';
import 'package:hall_management_client/ui/screens/set_pass.dart';
import 'package:hall_management_client/ui/screens/splash.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/reset',
      builder: (BuildContext context, GoRouterState state) {
        return const ResetScreen();
      },
    ),
    GoRoute(
      path: '/otp/:token',
      builder: (BuildContext context, GoRouterState state) {
        final String? token = state.pathParameters['token'];
        return OtpScreen(token: token??'');
      },
    ),
    GoRoute(
      path: '/setPassword/:token',
      builder: (BuildContext context, GoRouterState state) {
        final String? token = state.pathParameters['token'];
        return SetPasswordScreen(token: token??'');
      },
    ),
  ],
);