class Calories {
  late String name;
  late int caloriesPerHour;
  late int durationMinutes;
  late int totalCalories;

  Calories({
    required this.name,
    required this.caloriesPerHour,
    required this.durationMinutes,
    required this.totalCalories,
  });

  Calories.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    caloriesPerHour = json['caloriesPerHour'];
    durationMinutes = json['durationMinutes'];
    totalCalories = json['totalCalories'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['caloriesPerHour'] = caloriesPerHour;
    data['durationMinutes'] = durationMinutes;
    data['totalCalories'] = totalCalories;
    return data;
  }
}
