// ignore_for_file: prefer_const_constructors

import 'package:fitguide_exercise/UI/view/screen/detailed_exercise.dart';
import 'package:flutter/material.dart';
import 'package:fitguide_exercise/UI/view_model/exercise_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExerciseViewModel>(context, listen: false).getAllExercises();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(25),
            child: Text(
              'Welcome to FitGuide',
              style: TextStyle(fontSize: 26),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          showExercise(),
        ],
      ),
    ));
  }

  showExercise() {
    return Consumer<ExerciseViewModel>(builder: (context, provider, _) {
      final modelView = Provider.of<ExerciseViewModel>(context, listen: false);

      return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: modelView.exercises.length,
        itemBuilder: (_, index) {
          final exercise = modelView.exercises[index];
          return GestureDetector(
            onTap: () async {
              Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) =>
                    DetailedExercise(
                  name: exercise.name,
                  type: exercise.type,
                  difficulty: exercise.difficulty,
                  equipment: exercise.equipment,
                  instructions: exercise.instructions,
                  muscle: exercise.muscle,
                ),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) {
                  const begin = Offset(0.0, 1.0);
                  const end = Offset.zero;
                  const curve = Curves.ease;

                  var tween = Tween(begin: begin, end: end)
                      .chain(CurveTween(curve: curve));

                  return SlideTransition(
                    position: animation.drive(tween),
                    child: child,
                  );
                },
              ));
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Card(
                child: Column(
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135__340.jpg"),
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        exercise.name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
