import 'package:fitguide_exercise/utils/animations/fade_animation2.dart';
import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({required this.appname, required this.tagline, Key? key})
      : super(key: key);

  final String appname;
  final String tagline;

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(
          context,
          FadeAnimation2(
            page: const BottomNavigatorBar(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.appname,
              style: TextStyle(
                fontSize: 75.0,
                color: secondaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              widget.tagline,
              style: TextStyle(
                fontSize: 15.0,
                letterSpacing: 7.5,
                color: whiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
