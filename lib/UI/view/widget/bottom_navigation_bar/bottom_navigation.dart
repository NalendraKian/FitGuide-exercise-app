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
    final provider = Provider.of<BottomNavViewModel>(context);
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: provider.currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: Colors.amber,
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
