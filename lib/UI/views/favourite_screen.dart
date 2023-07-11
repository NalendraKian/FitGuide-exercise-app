// ignore_for_file: use_build_context_synchronously

import 'package:fitguide_exercise/UI/view_models/bottom_nav_view_model.dart';
import 'package:fitguide_exercise/UI/views/detailed_exercise.dart';
import 'package:fitguide_exercise/UI/views/login_screen.dart';
import 'package:fitguide_exercise/models/exercise_model.dart';
import 'package:fitguide_exercise/models/service/favorite_manager.dart';
import 'package:fitguide_exercise/utils/animations/fade_animation.dart';
import 'package:fitguide_exercise/utils/animations/slide_animation.dart';
import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:fitguide_exercise/widgets/buttons/button_full.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  late SharedPreferences sharedPreferences;
  PreferencesUtils preferencesUtils = PreferencesUtils();
  FavoriteManager favoriteManager = FavoriteManager();
  bool? loginStatus = false;
  List<Exercise> favoriteItems = [];

  @override
  void initState() {
    super.initState();
    getFavoriteItems();
  }

  Future<void> getFavoriteItems() async {
    var navigator = Provider.of<BottomNavViewModel>(context, listen: false);
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      loginStatus = preferencesUtils.getPreferencesBool('loginStatus');
    });
    List<Exercise> wishlist = await favoriteManager.getFavourite();
    setState(() {
      favoriteItems = wishlist;
    });

    if (loginStatus == false) {
      Navigator.push(
        context,
        FadeAnimation(page: const LoginScreen()),
      );
      navigator.homeTab();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          centerTitle: true,
          elevation: 0,
          title: const Text('FitGuide'),
          // action
          actions: loginStatus == null || loginStatus == false
              ? [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: SizedBox(
                      width: 80,
                      child: ButtonFull(
                          title: 'Masuk',
                          color: whiteColor,
                          textColor: primaryColor,
                          borderColor: primaryColor,
                          press: () {
                            Navigator.push(
                              context,
                              SlideAnimation(page: const LoginScreen()),
                            );
                          }),
                    ),
                  )
                ]
              : null,
        ),
        backgroundColor: whiteColor,
        body: SafeArea(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(25),
                child: Text(
                  'Favourite List',
                  style: TextStyle(
                    fontSize: 26,
                    color: quinaryColor,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: favoriteItems.length,
                itemBuilder: (_, index) {
                  final exercise = favoriteItems[index];
                  return GestureDetector(
                    onTap: () async {
                      Navigator.of(context).push(PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            DetailedExercise(
                          name: exercise.name,
                          type: exercise.type,
                          difficulty: exercise.difficulty,
                          equipment: exercise.equipment,
                          instructions: exercise.instructions,
                          muscle: exercise.muscle,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          const begin = Offset(0.0, 1.0);
                          const end = Offset.zero;
                          const curve = Curves.ease;

                          var tween = Tween(begin: begin, end: end)
                              .chain(CurveTween(curve: curve));

                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Column(
                          children: [
                            const Image(
                              image: NetworkImage(
                                  "https://images.pexels.com/photos/2827392/pexels-photo-2827392.jpeg"),
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                exercise.name,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
