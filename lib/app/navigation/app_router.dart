import 'package:diwodo_21/app/models/app_state_manager.dart';
import 'package:diwodo_21/app/models/buddy_manager.dart';
import 'package:diwodo_21/app/navigation/app_link.dart';
import 'package:diwodo_21/home/home_view.dart';
import 'package:diwodo_21/splash/splash.dart';
import 'package:flutter/material.dart';

class AppRouter extends RouterDelegate<AppLink>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  final AppStateManager appStateManager;
  final BuddyManager buddyManager;

  AppRouter({
    required this.appStateManager,
    required this.buddyManager,
  }) {
    appStateManager.addListener(notifyListeners);
    buddyManager.addListener(notifyListeners);
  }

  @override
  void dispose() {
    appStateManager.removeListener(notifyListeners);
    buddyManager.removeListener(notifyListeners);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: [
        if (!appStateManager.isInitialized) SplashView.page(),
        if (appStateManager.isInitialized)
          HomeView.page(appStateManager.getSelectedTab),
      ],
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) {
      return false;
    }

    return true;
  }

  @override
  Future<void> setNewRoutePath(AppLink configuration) async {
    switch (configuration.location) {
      case AppLink.kHomePath:
        appStateManager.goToTab(configuration.currentTab ?? 0);
        break;
      default:
        break;
    }
  }

  AppLink getCurrentPath() {
    if (!appStateManager.isInitialized) {
      return AppLink(location: AppLink.kSplashPath);
    }
    return AppLink(
        location: AppLink.kHomePath,
        currentTab: appStateManager.getSelectedTab);
  }

  @override
  AppLink? get currentConfiguration => getCurrentPath();
}
