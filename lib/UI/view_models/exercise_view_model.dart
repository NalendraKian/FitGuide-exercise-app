import 'package:fitguide_exercise/models/service/exercise_api.dart';
import 'package:fitguide_exercise/models/exercise_model.dart';
import 'package:fitguide_exercise/models/search_model.dart';
import 'package:flutter/material.dart';

class ExerciseViewModel with ChangeNotifier {
  bool isLoading = true;
  String error = '';
  String difficulty = '';
  int offset = 0;

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
    difficulty = '';
    offset = 0;

    final c = await ExerciseApi.searchExercise(name, difficulty, offset);
    _searchExercises = c;

    notifyListeners();
  }

  getFilterSearch(String name, String newDifficulty) async {
    difficulty = newDifficulty;
    offset = 0;

    final c = await ExerciseApi.searchExercise(name, difficulty, offset);

    _searchExercises = c;

    if (_searchExercises.isEmpty) {
      error = 'No Result was Found';
    }

    notifyListeners();
  }

  getNextSearch(String name, int newOffset) async {
    if (offset < 0) {
      offset = 0;
    } else {
      offset = newOffset;
    }

    List<SearchExercise> c =
        await ExerciseApi.searchExercise(name, difficulty, offset);

    if (c.isEmpty) {
      await ExerciseApi.searchExercise(name, difficulty, offset - 10);
    } else {
      _searchExercises = c;
    }

    notifyListeners();
  }
}
