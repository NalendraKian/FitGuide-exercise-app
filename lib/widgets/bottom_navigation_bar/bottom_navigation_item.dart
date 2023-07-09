import 'package:fitguide_exercise/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:fitguide_exercise/UI/view_models/bottom_nav_view_model.dart';
import 'package:provider/provider.dart';

class BottomNavItems extends StatelessWidget {
  const BottomNavItems({
    super.key,
    required this.provider,
  });

  final BottomNavViewModel provider;

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavViewModel>(
      builder: (context, value, _) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    size: 30,
                    color: provider.currentTab == 0
                        ? primaryColor
                        : quarternaryColor.withOpacity(0.8),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    provider.caloriesTab();
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    (Icons.local_fire_department),
                    size: 30,
                    color: provider.currentTab == 1
                        ? primaryColor
                        : quarternaryColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                MaterialButton(
                  onPressed: () {
                    provider.favoriteTab();
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    (Icons.favorite_rounded),
                    size: 30,
                    color: provider.currentTab == 2
                        ? primaryColor
                        : quarternaryColor.withOpacity(0.8),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    provider.accountTab();
                  },
                  shape: const CircleBorder(),
                  child: Icon(
                    (Icons.account_circle),
                    size: 30,
                    color: provider.currentTab == 3
                        ? primaryColor
                        : quarternaryColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
