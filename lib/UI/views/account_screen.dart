// ignore_for_file: use_build_context_synchronously

import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:fitguide_exercise/UI/view_models/bottom_nav_view_model.dart';
import 'package:fitguide_exercise/UI/views/home_screen.dart';
import 'package:fitguide_exercise/UI/views/login_screen.dart';
import 'package:fitguide_exercise/utils/animations/fade_animation.dart';
import 'package:fitguide_exercise/utils/animations/fade_animation2.dart';
import 'package:fitguide_exercise/utils/animations/slide_animation.dart';
import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:fitguide_exercise/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:fitguide_exercise/widgets/profile/section_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _ProfileState();
}

class _ProfileState extends State<AccountScreen> {
  late PreferencesUtils preferencesUtils;
  String? email;
  String? username;
  bool? loginStatus = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    var navigator = Provider.of<BottomNavViewModel>(context, listen: false);
    preferencesUtils = PreferencesUtils();
    await preferencesUtils.init();
    setState(() {
      email = preferencesUtils.getPreferencesString('email');
      username = preferencesUtils.getPreferencesString('username');
      loginStatus = preferencesUtils.getPreferencesBool('loginStatus');
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
    final navigation = Provider.of<BottomNavViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: primaryColor,
            centerTitle: true,
            elevation: 0,
            title: Text(
              'Profile',
              style: GoogleFonts.poppins(
                color: tertiaryColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            )),
        body: loginStatus!
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                primaryColor,
                                secondaryColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                            borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        child: Center(
                          child: Column(
                            children: [
                              Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/placeholder.png"),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(username.toString(),
                                  style: GoogleFonts.poppins(
                                    color: tertiaryColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
                                  )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                email.toString(),
                                style: GoogleFonts.poppins(
                                  color: tertiaryColor,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SectionProfile(
                              title: 'Edit Account',
                              icon: Icons.person_outline,
                              press: () {
                                Navigator.push(
                                    context,
                                    SlideAnimation(
                                      page: const Placeholder(),
                                    ));
                              }),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 40,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        color: primaryColor, width: 0.5),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                    if (states
                                        .contains(MaterialState.pressed)) {
                                      return primaryColor;
                                    }
                                    return secondaryColor;
                                  },
                                ),
                              ),
                              onPressed: () async {
                                await preferencesUtils.savePreferencesBool(
                                    'loginStatus', false);
                                navigation.homeTab();
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    FadeAnimation(
                                        page: const BottomNavigatorBar()),
                                    (route) => false);
                              },
                              child: Text("Logout",
                                  style: GoogleFonts.poppins(
                                    color: primaryColor,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            : Container(
                color: whiteColor,
              ));
  }
}
