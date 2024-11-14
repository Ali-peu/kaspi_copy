import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaspi_copy/app/app_home.dart';
import 'package:kaspi_copy/future/main_screen/main_screen.dart';
import 'package:kaspi_copy/future/messages_screen/messages_screen.dart';
import 'package:kaspi_copy/future/qr_screen/qr_screen.dart';
import 'package:kaspi_copy/future/service_screen/service_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _sectionANavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'sectionANav');

abstract class RouterNames {
  static const home = '/home';
  static const service = '/service';
  static const qr = '/qr';
  static const messages = '/messages';
}

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouterNames.home,
  routes: <RouteBase>[
    // #docregion configuration-builder
    StatefulShellRoute.indexedStack(
      builder: (BuildContext context, GoRouterState state,
          StatefulNavigationShell navigationShell) {
        // Return the widget that implements the custom shell (in this case
        // using a BottomNavigationBar). The StatefulNavigationShell is passed
        // to be able access the state of the shell and to navigate to other
        // branches in a stateful way.
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      // #enddocregion configuration-builder
      // #docregion configuration-branches
      branches: <StatefulShellBranch>[
        // The route branch for the first tab of the bottom navigation bar.
        StatefulShellBranch(
          navigatorKey: _sectionANavigatorKey,
          routes: <RouteBase>[
            GoRoute(
              // The screen to display as the root in the first tab of the
              // bottom navigation bar.
              path: RouterNames.home,
              builder: (BuildContext context, GoRouterState state) =>
                  const MainScreen(),
              routes: const <RouteBase>[
                // The details screen to display stacked on navigator of the
                // first tab. This will cover screen A but not the application
                // shell (bottom navigation bar).
              ],
            ),
          ],
        ),
        // #enddocregion configuration-branches

        // The route branch for the second tab of the bottom navigation bar.
        statefulShellBranch(path: RouterNames.qr, builder: const QrScreen()),
        statefulShellBranch(
            path: RouterNames.service, builder: const ServiceScreen()),

        statefulShellBranch(
            path: RouterNames.messages, builder: const MessagesScreen()),

        // The route branch for the third tab of the bottom navigation bar.
        // StatefulShellBranch(
        //   routes: <RouteBase>[
        //     GoRoute(
        //       // The screen to display as the root in the third tab of the
        //       // bottom navigation bar.
        //       path: '/c',
        //       builder: (BuildContext context, GoRouterState state) =>
        //           const RootScreen(
        //         label: 'C',
        //         detailsPath: '/c/details',
        //       ),
        //       routes: <RouteBase>[
        //         GoRoute(
        //           path: 'details',
        //           builder: (BuildContext context, GoRouterState state) =>
        //               DetailsScreen(
        //             label: 'C',
        //             extra: state.extra,
        //           ),
        //         ),
        //       ],
        //     ),
        //   ],
        // ),
      ],
    ),
  ],
);

StatefulShellBranch statefulShellBranch(
    {required String path, required Widget builder}) {
  return StatefulShellBranch(
    // It's not necessary to provide a navigatorKey if it isn't also
    // needed elsewhere. If not provided, a default key will be used.
    routes: <RouteBase>[
      GoRoute(
        // The screen to display as the root in the second tab of the
        // bottom navigation bar.
        path: path,
        builder: (BuildContext context, GoRouterState state) => builder,
        routes: const <RouteBase>[],
      ),
    ],
  );
}
