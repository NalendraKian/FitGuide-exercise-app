// ignore_for_file: prefer_const_constructors

import 'package:fitguide_exercise/UI/constant/color.dart';
import 'package:fitguide_exercise/UI/view/screen/search_screen.dart';
import 'package:fitguide_exercise/UI/view/widget/bottom_navigation_bar/bottom_navigation_item.dart';
import 'package:fitguide_exercise/UI/view_model/bottom_nav_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<BottomNavigationWidget> createState() => _InitialBottomWidgetState();
}

class _InitialBottomWidgetState extends State<BottomNavigationWidget> {
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<BottomNavViewModel>(context, listen: false);
    return Scaffold(
      backgroundColor: primaryColor,
      resizeToAvoidBottomInset: false,
      body: PageStorage(
        bucket: bucket,
        child: provider.currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: secondaryColor,
        onPressed: () {
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                SearchScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, 1.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ));
        },
        child: Icon(Icons.search, color: primaryColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: secondaryColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: SizedBox(
          height: 86,
          child: BottomNavItems(
            provider: provider,
          ),
        ),
      ),
    );
  }
}
