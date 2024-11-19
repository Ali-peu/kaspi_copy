import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kaspi_copy/app/core/redux/app_redux.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const ScaffoldWithNestedNavigation(
      {super.key, required this.navigationShell});

  void _goBranch(int index, BuildContext context) {
    final store = Provider.of<Store<AppState>>(context, listen: false);

    // Диспатч действия в зависимости от индекса
    switch (index) {
      case 0:
        store.dispatch(AppActions.goHome);
        break;
      case 1:
        store.dispatch(AppActions.goQR);
        break;
      case 2:
        store.dispatch(AppActions.goMessages);
        break;
      case 3:
        store.dispatch(AppActions.goServices);
        break;
      default:
        store.dispatch(AppActions.goHome);
    }

    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Store<AppState>>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: navigationShell),
      bottomNavigationBar: NavigationBar(
        selectedIndex: store.state.navBarIndex,
        destinations: const [
          NavigationDestination(label: 'Section A', icon: Icon(Icons.home)),
          NavigationDestination(label: 'Section B', icon: Icon(Icons.settings)),
          NavigationDestination(label: 'Section C', icon: Icon(Icons.cabin)),
          NavigationDestination(
              label: 'Section D', icon: Icon(Icons.dangerous)),
        ],
        onDestinationSelected: (index) {
          _goBranch(index, context);
        },
      ),
    );
  }
}
