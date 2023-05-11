import 'dart:convert';

class FavouriteExercise {
  late String name;
  late String type;
  late String muscle;
  late String equipment;
  late String difficulty;
  late String instructions;
  // bool favourite;

  FavouriteExercise({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
    // required this.favourite,
  });

  factory FavouriteExercise.fromJson(Map<String, dynamic> json) {
    return FavouriteExercise(
      name: json['name'],
      type: json['type'],
      muscle: json['muscle'],
      equipment: json['equipment'],
      difficulty: json['difficulty'],
      instructions: json['instructions'],
      // favourite: json['favourite'],
    );
  }

  get items => null;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['muscle'] = muscle;
    data['equipment'] = equipment;
    data['difficulty'] = difficulty;
    data['instructions'] = instructions;
    // data['favourite'] = favourite;
    return data;
  }

  static Map<String, dynamic> toMap(FavouriteExercise favourites) => {
        'name': favourites.name,
        'type': favourites.type,
        'muscle': favourites.muscle,
        'equipment': favourites.equipment,
        'difficulty': favourites.difficulty,
        'instructions': favourites.instructions,
        // 'favourite': favourites.favourite,
      };

  static String encode(List<FavouriteExercise> favourites) => json.encode(
        favourites
            .map<Map<String, dynamic>>(
                (music) => FavouriteExercise.toMap(music))
            .toList(),
      );

  static List<FavouriteExercise> decode(String favourites) =>
      (json.decode(favourites) as List<dynamic>)
          .map<FavouriteExercise>((item) => FavouriteExercise.fromJson(item))
          .toList();

  static fromMap(decode) {}
}
