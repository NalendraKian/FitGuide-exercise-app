import 'package:fitguide_exercise/core/model/calories_model.dart';
import 'package:fitguide_exercise/core/service/api/calories_api.dart';
import 'package:flutter/material.dart';

class CaloriesViewModel with ChangeNotifier {
  String difficulty = '';
  int offset = 0;

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  List<Calories> _calories = [];
  List<Calories> get calories => _calories;

  getSearchCalories(String name) async {
    final c = await CaloriesApi.getCalories(name);
    _calories = c;
    notifyListeners();
  }
}
