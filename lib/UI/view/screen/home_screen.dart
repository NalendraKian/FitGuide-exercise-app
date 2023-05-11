import 'package:fitguide_exercise/UI/constant/color.dart';
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
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ExerciseViewModel>(context, listen: false).getAllExercises();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final modelView = Provider.of<ExerciseViewModel>(context);
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'Welcome to FitGuide',
                  style: TextStyle(
                    fontSize: 26,
                    color: quinaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              modelView.isLoading
                  ? getLoading()
                  : modelView.exercises.isNotEmpty
                      ? showExercise()
                      : getError()
            ],
          ),
        ));
  }

  Widget getLoading() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(
            color: quinaryColor,
          ),
          Text(
            'Loading Data',
            style: TextStyle(fontSize: 20, color: quinaryColor),
          ),
        ],
      ),
    );
  }

  Widget getError() {
    return Center(
      child: Text(
        'error',
        style: const TextStyle(color: Colors.red, fontSize: 22),
      ),
    );
  }

  Consumer<ExerciseViewModel> showExercise() {
    return Consumer<ExerciseViewModel>(builder: (context, provider, _) {
      final modelView = Provider.of<ExerciseViewModel>(context, listen: false);

      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
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
              padding: const EdgeInsets.all(10),
              child: Card(
                child: Column(
                  children: [
                    const Image(
                      image: NetworkImage(
                          "https://images.pexels.com/photos/2827392/pexels-photo-2827392.jpeg"),
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
