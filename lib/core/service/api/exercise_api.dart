import 'package:dio/dio.dart';
import 'package:fitguide_exercise/core/model/exercise_model.dart';
import 'package:fitguide_exercise/core/service/api/api.dart';

class ExerciseApi {
  Dio dio = Dio();
  static Future<List<Exercise>> getExercises() async {
    final Response response = await Dio().get(
        'https://api.api-ninjas.com/v1/exercises',
        options: Options(headers: {"X-Api-Key": Api.apiKey}));

    List<Exercise> exercises = (response.data as List)
        .map((e) => Exercise(
              name: e['name'],
              type: e['type'],
              muscle: e['muscle'],
              equipment: e['equipment'],
              difficulty: e['difficulty'],
              instructions: e['instructions'],
            ))
        .toList();

    return exercises;
  }
}
