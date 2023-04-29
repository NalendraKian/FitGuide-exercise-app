class Exercise {
  late String name;
  late String type;
  late String muscle;
  late String equipment;
  late String difficulty;
  late String instructions;

  Exercise({
    required this.name,
    required this.type,
    required this.muscle,
    required this.equipment,
    required this.difficulty,
    required this.instructions,
  });

  Exercise.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    muscle = json['muscle'];
    equipment = json['equipment'];
    difficulty = json['difficulty'];
    instructions = json['instructions'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['type'] = type;
    data['muscle'] = muscle;
    data['equipment'] = equipment;
    data['difficulty'] = difficulty;
    data['instructions'] = instructions;
    return data;
  }
}
