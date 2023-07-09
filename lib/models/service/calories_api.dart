import 'package:dio/dio.dart';
import 'package:fitguide_exercise/models/calories_model.dart';
import 'package:fitguide_exercise/models/service/api_constant.dart';

class CaloriesApi {
  Dio dio = Dio();

  static Future<List<Calories>> getCalories(String activity) async {
    try {
      final Response response = await Dio().get(Api.baseUrlCalories,
          options: Options(headers: {"X-Api-Key": Api.apiKey}),
          queryParameters: {
            'activity': activity,
          });

      List<Calories> calories = (response.data as List)
          .map((e) => Calories(
                name: e['name'],
                caloriesPerHour: e['calories_per_hour'],
                durationMinutes: e['duration_minutes'],
                totalCalories: e['total_calories'],
              ))
          .toList();

      return calories;
    } catch (e) {
      rethrow;
    }
  }
}
