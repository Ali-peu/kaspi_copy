class AppState {
  final int navBarIndex;
  const AppState({this.navBarIndex = 0});
}

enum AppActions { goHome, goQR, goMessages, goServices }

AppState appReducer(AppState state, dynamic action) {
  switch (action) {
    case AppActions.goHome:
      return const AppState(navBarIndex: 0);
    case AppActions.goQR:
      return const AppState(navBarIndex: 1);
    case AppActions.goMessages:
      return const AppState(navBarIndex: 2);
    case AppActions.goServices:
      return const AppState(navBarIndex: 3);
    default:
      return state;
  }
}
