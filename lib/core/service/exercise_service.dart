import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api/api_constant.dart';

class ExerciseService {
  Dio dio = Dio();

  Future fetchExercise() async {
    try {
      final Response response = await dio.get(
          'https://api.api-ninjas.com/v1/exercises',
          options: Options(headers: {"X-Api-Key": Api.apiKey}));

      debugPrint(response.data.toString());

      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
