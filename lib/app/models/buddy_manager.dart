import 'package:diwodo_21/app/mock/mock_buddies.dart';
import 'package:diwodo_21/app/models/buddy.dart';
import 'package:flutter/material.dart';

class BuddyManager extends ChangeNotifier {
  final _buddies = buddyList;
  int _selectedIndex = -1;

  List<Buddy> get buddies => List.unmodifiable(_buddies);
  int get selectedIndex => _selectedIndex;

  Buddy? get selectedBuddyItem =>
      _selectedIndex != -1 ? _buddies[_selectedIndex] : null;

  void buddyTapped(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setSelectedBuddy(int id) {
    final index = _buddies.indexWhere((element) => element.id == id);
    _selectedIndex = index;
    notifyListeners();
  }
}