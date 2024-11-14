import 'package:flutter/material.dart';
import 'package:kaspi_copy/app/app.dart';
import 'package:kaspi_copy/app/core/redux/app_redux.dart';
import 'package:redux/redux.dart';

void main() {
  final store = Store<AppState>(appReducer, initialState: const AppState());
  print(store.state.navBarIndex); // Prints an empty list
  runApp(App(store: store,));
}
