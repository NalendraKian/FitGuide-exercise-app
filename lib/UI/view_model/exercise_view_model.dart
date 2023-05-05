import 'package:fitguide_exercise/core/service/api/exercise_api.dart';
import 'package:fitguide_exercise/core/model/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseViewModel with ChangeNotifier {
  bool isLoading = true;
  String error = '';
  String searchText = '';

  List<Exercise> _exercises = [];
  List<Exercise> get exercises => _exercises;

  final TextEditingController _searchController = TextEditingController();
  TextEditingController get searchController => _searchController;

  getAllExercises() async {
    final c = await ExerciseApi.getExercises();
    _exercises = c;
    isLoading = false;
    notifyListeners();
  }

  List<SearchExercise> _searchExercises = [];
  List<SearchExercise> get searchExercise => _searchExercises;

  getSearch(String name) async {
    final c = await ExerciseApi.searchExercise(name);
    _searchExercises = c;
    notifyListeners();
  }
}
