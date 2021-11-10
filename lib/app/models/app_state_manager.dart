import 'dart:async';

import 'package:flutter/material.dart';

class HomeTab {
  static const int dialPad = 0;
  static const int buddyList = 1;
  static const int settings = 2;
}

class AppStateManager extends ChangeNotifier {
  bool _initialized = false;

  int _selectedTab = HomeTab.dialPad;

  bool _isDarkTheme = false;

  bool get isInitialized => _initialized;

  int get getSelectedTab => _selectedTab;

  bool get isDarkTheme => _isDarkTheme;

  void initializeApp() {
    Timer(
      const Duration(milliseconds: 2000),
      () {
        _initialized = true;
        notifyListeners();
      },
    );
  }

  void goToTab(index) {
    _selectedTab = index;
    notifyListeners();
  }

  set isDarkTheme(bool darkTheme) {
    _isDarkTheme = darkTheme;
    notifyListeners();
  }
}
