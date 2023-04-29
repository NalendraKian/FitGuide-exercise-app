import 'package:flutter/material.dart';
import 'package:fitguide_exercise/UI/view/screen/home_screen.dart';

class BottomNavViewModel with ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
  ];
  Widget _currentScreen = const HomeScreen();

  Widget get currentScreen => _currentScreen;
  int get currentTab => _currentTab;

  void homeTab() {
    _currentScreen = screens[0];
    _currentTab = 0;
    notifyListeners();
  }

  void favoriteTab() {
    _currentScreen = screens[1];
    _currentTab = 1;
    notifyListeners();
  }

  void notificationTab() {
    _currentScreen = screens[2];
    _currentTab = 3;
    notifyListeners();
  }

  void accountTab() {
    _currentScreen = screens[3];
    _currentTab = 4;
    notifyListeners();
  }
}
