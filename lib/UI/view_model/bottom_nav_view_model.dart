import 'package:fitguide_exercise/UI/view/screen/account_screen.dart';
import 'package:fitguide_exercise/UI/view/screen/calories_calculator_screen.dart';
import 'package:fitguide_exercise/UI/view/screen/favourite_exercise.dart';
import 'package:flutter/material.dart';
import 'package:fitguide_exercise/UI/view/screen/home_screen.dart';

class BottomNavViewModel with ChangeNotifier {
  int _currentTab = 0;
  final List<Widget> screens = [
    const HomeScreen(),
    const CaloriesCalculatorScreen(),
    const FavouriteScreen(),
    const AccountScreen(),
  ];
  Widget _currentScreen = const HomeScreen();

  Widget get currentScreen => _currentScreen;
  int get currentTab => _currentTab;

  void homeTab() {
    _currentScreen = screens[0];
    _currentTab = 0;
    notifyListeners();
  }

  void caloriesTab() {
    _currentScreen = screens[1];
    _currentTab = 1;
    notifyListeners();
  }

  void favoriteTab() {
    _currentScreen = screens[2];
    _currentTab = 2;
    notifyListeners();
  }

  void accountTab() {
    _currentScreen = screens[3];
    _currentTab = 3;
    notifyListeners();
  }
}
