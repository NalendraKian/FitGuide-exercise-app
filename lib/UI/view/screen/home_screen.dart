// ignore_for_file: prefer_const_constructors

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
    final modelView = Provider.of<ExerciseViewModel>(context);

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
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: modelView.exercises.length,
              itemBuilder: (_, index) {
                final exercise = modelView.exercises[index];
                return Padding(
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
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
