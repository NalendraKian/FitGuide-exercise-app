import 'package:fitguide_exercise/UI/view/widget/bottom_navigation_bar/bottom_navigation.dart';
import 'package:fitguide_exercise/UI/view_model/bottom_nav_view_model.dart';
import 'package:fitguide_exercise/UI/view_model/exercise_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<BottomNavViewModel>(
          create: (context) => BottomNavViewModel(),
        ),
        ChangeNotifierProvider<ExerciseViewModel>(
          create: (context) => ExerciseViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FitGuide',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        routes: {
          '/': (context) => const BottomNavigationWidget(),
        },
      ),
    );
  }
}
