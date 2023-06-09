import 'package:fitguide_exercise/UI/view/screen/splash_screen.dart';
import 'package:fitguide_exercise/UI/view_model/bottom_nav_view_model.dart';
import 'package:fitguide_exercise/UI/view_model/calories_view_model.dart';
import 'package:fitguide_exercise/UI/view_model/exercise_view_model.dart';
import 'package:fitguide_exercise/UI/view_model/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

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
        ),
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
        ChangeNotifierProvider<CaloriesViewModel>(
          create: (context) => CaloriesViewModel(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FitGuide',
        theme: ThemeData(
          textTheme: GoogleFonts.montserratTextTheme(),
        ),
        home:
            const SplashScreen(appname: "FitGuide", tagline: "Keep Exercising"),
      ),
    );
  }
}
