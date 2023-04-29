import 'package:flutter/material.dart';
import 'package:fitguide_exercise/UI/view_model/bottom_nav_view_model.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
    required this.provider,
  });

  final BottomNavViewModel provider;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                provider.homeTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.home),
                color: provider.currentTab == 0
                    ? Colors.blue
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            MaterialButton(
              onPressed: () {
                provider.favoriteTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.favorite),
                color: provider.currentTab == 1
                    ? Colors.blue
                    : Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              onPressed: () {
                provider.notificationTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.notifications),
                color: provider.currentTab == 3
                    ? Colors.blue
                    : Colors.black.withOpacity(0.2),
              ),
            ),
            MaterialButton(
              onPressed: () {
                provider.accountTab();
              },
              shape: const CircleBorder(),
              child: Icon(
                (Icons.person),
                color: provider.currentTab == 4
                    ? Colors.blue
                    : Colors.black.withOpacity(0.2),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
