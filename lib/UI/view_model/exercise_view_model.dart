import 'package:fitguide_exercise/core/service/api/exercise_api.dart';
import 'package:fitguide_exercise/core/model/exercise_model.dart';
import 'package:flutter/material.dart';

class ExerciseViewModel with ChangeNotifier {
  List<Exercise> _exercises = [];
  List<Exercise> get exercises => _exercises;

  getAllExercises() async {
    final c = await ExerciseApi.getExercises(0);
    _exercises = c;
    notifyListeners();
  }
}
