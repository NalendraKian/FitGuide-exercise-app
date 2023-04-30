import 'package:fitguide_exercise/UI/view_model/exercise_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailedExercise extends StatefulWidget {
  final String name;
  final String type;
  final String muscle;
  final String equipment;
  final String difficulty;
  final String instructions;

  const DetailedExercise(
      {super.key,
      required this.name,
      required this.type,
      required this.muscle,
      required this.equipment,
      required this.difficulty,
      required this.instructions});

  @override
  State<DetailedExercise> createState() => _DetailedExerciseState();
}

class _DetailedExerciseState extends State<DetailedExercise> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.name),
            Text(widget.difficulty),
            Text(widget.equipment),
            Text(widget.muscle),
            Text(widget.type),
            Text(widget.instructions),
          ],
        ),
      ),
    );
  }
}
