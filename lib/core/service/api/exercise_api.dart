import 'package:dio/dio.dart';
import 'package:fitguide_exercise/core/model/exercise_model.dart';
import 'package:fitguide_exercise/core/service/api/api_constant.dart';
import 'package:fitguide_exercise/core/model/search_model.dart';

class ExerciseApi {
  Dio dio = Dio();

  static Future<List<Exercise>> getExercises() async {
    try {
      final Response response = await Dio().get(Api.baseUrlExercise,
          options: Options(headers: {"X-Api-Key": Api.apiKey}),
          queryParameters: {});

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
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<SearchExercise>> searchExercise(
      String name, difficulty, int offset) async {
    try {
      final Response response = await Dio().get(Api.baseUrlExercise,
          options: Options(headers: {"X-Api-Key": Api.apiKey}),
          queryParameters: {
            'name': name,
            'difficulty': difficulty,
            "offset": offset,
          });

      List<SearchExercise> searchExercises = (response.data as List)
          .map((e) => SearchExercise(
                name: e['name'],
                type: e['type'],
                muscle: e['muscle'],
                equipment: e['equipment'],
                difficulty: e['difficulty'],
                instructions: e['instructions'],
              ))
          .toList();

      return searchExercises;
    } catch (e) {
      rethrow;
    }
  }
}
