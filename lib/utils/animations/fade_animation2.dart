// Import the necessary packages
import 'package:flutter/material.dart';

//Define a slide animation with default duration
class FadeAnimation2 extends PageRouteBuilder {
  final Widget page;
  dynamic arguments;

  FadeAnimation2({required this.page, this.arguments})
      : super(
          settings: arguments != null
              ? RouteSettings(arguments: arguments)
              : const RouteSettings(),
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            final tween = Tween(begin: 0.0, end: 1.0);
            return FadeTransition(
              opacity: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
        );
}
