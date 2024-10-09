import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibc_app/view/home_screen.dart';
import 'package:ibc_app/widgets/slash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/splash-screen',
  routes: [
    GoRoute(
      path: '/splash-screen',
      builder: (BuildContext context, GoRouterState state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);
