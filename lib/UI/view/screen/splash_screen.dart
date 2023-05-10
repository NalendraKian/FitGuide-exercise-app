import 'package:fitguide_exercise/UI/view/screen/login_screen.dart';
import 'package:fitguide_exercise/UI/view/widget/bottom_navigation_bar/bottom_navigation.dart';
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
          MaterialPageRoute(
            builder: (context) => const LoginScreen(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFF5722),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.appname,
              style: const TextStyle(
                fontSize: 75.0,
                color: Colors.amberAccent,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              widget.tagline,
              style: const TextStyle(
                fontSize: 15.0,
                letterSpacing: 7.5,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
