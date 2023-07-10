// Import the necessary packages
import 'package:flutter/material.dart';

// Define a slide animation with default duration
class SlideAnimation2 extends PageRouteBuilder {
  final Widget page;
  dynamic arguments;

  SlideAnimation2({required this.page, this.arguments})
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
            return SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
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
