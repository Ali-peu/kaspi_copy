import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kaspi_copy/app/core/redux/app_redux.dart';
import 'package:kaspi_copy/app/core/theme_data/app_theme.dart';

import 'package:kaspi_copy/app/core/router.dart';
import 'package:kaspi_copy/future/local_auth_screen/bloc/local_auth_bloc.dart';
import 'package:kaspi_copy/future/local_auth_screen/repo/local_auth_repo.dart';
import 'package:provider/provider.dart';
import 'package:redux/redux.dart';

class App extends StatelessWidget {
  final Store<AppState> store;
  const App({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => store,
      child: MultiProvider(
        providers: [
          BlocProvider(
              create: (context) =>
                  LocalAuthBloc(localAuthRepo: LocalAuthRepo()))
        ],
        child: MaterialApp.router(
            routerConfig: router,
            debugShowCheckedModeBanner: false,
            theme: AppThemeData.lightTheme),
      ),
    );
  }
}
