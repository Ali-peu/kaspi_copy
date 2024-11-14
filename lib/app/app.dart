import 'package:flutter/material.dart';
import 'package:kaspi_copy/app/core/redux/app_redux.dart';
import 'package:kaspi_copy/app/core/router.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  const App({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => store,
      child: MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    );
  }
}
