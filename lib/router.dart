import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ibc_app/widgets/slash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final router = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: '/slash-screen',
  routes: [
    GoRoute(
      path: '/slash-screen',
      builder: (BuildContext _, GoRouterState state) {
        return const SlashScreen();
      },
    ),

    // ShellRoute(
    //   navigatorKey: shellNavigatorKey,
    //   builder: (context, state, child) {
    //     return ButtomNavigationBarScrenn(
    //       child: child,
    //     );
    //   },
    //   routes: [
    //     // Displayed ShellRoute's Navigator.
    //   ],
    // ),
  ],
);
