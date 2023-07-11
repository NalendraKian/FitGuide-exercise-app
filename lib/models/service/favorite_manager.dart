import 'dart:convert';
import 'package:fitguide_exercise/models/exercise_model.dart';
import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteManager {
  PreferencesUtils preferencesUtils = PreferencesUtils();
  String? email;

  Future<List<Exercise>> getFavourite() async {
    email = preferencesUtils.getPreferencesString("email");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final favoriteData = prefs.getStringList('favorite$email');

    if (favoriteData != null) {
      List<Exercise> favorite = [];
      for (String itemJson in favoriteData) {
        final itemMap = jsonDecode(itemJson);
        final item = Exercise.fromJson(itemMap);
        favorite.add(item);
      }
      return favorite;
    }

    return [];
  }

  Future<void> addWishlistItem(
    String name,
    String type,
    String muscle,
    String equipment,
    String difficulty,
    String instructions,
  ) async {
    List<Exercise> favorite = await getFavourite();
    bool isExerciseFavorite = favorite.any((item) => item.name == name);

    if (!isExerciseFavorite) {
      favorite.add(Exercise(
        name: name,
        type: type,
        muscle: muscle,
        equipment: equipment,
        difficulty: difficulty,
        instructions: instructions,
      ));
      await saveFavorite(favorite);
    }
  }

  Future<void> removeFavoriteExercise(String name) async {
    List<Exercise> favorite = await getFavourite();
    favorite.removeWhere((item) => item.name == name);
    await saveFavorite(favorite);
  }

  Future<void> saveFavorite(List<Exercise> favorite) async {
    email = preferencesUtils.getPreferencesString("email");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoriteData =
        favorite.map((item) => jsonEncode(item.toJson())).toList();
    await prefs.setStringList('favorite$email', favoriteData);
  }
}
