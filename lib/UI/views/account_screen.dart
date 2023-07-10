import 'package:fitguide_exercise/utils/colors/colors.dart';
import 'package:fitguide_exercise/UI/views/login_screen.dart';
import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  late PreferencesUtils preferencesUtils;
  late String username;
  late String email;
  late String password;

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    preferencesUtils = PreferencesUtils();
    setState(() {
      username = preferencesUtils.getPreferencesString('username').toString();
      email = preferencesUtils.getPreferencesString('email').toString();
      password = preferencesUtils.getPreferencesString('password').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Selamat Datang $username',
                ),
                Text('Email $email'),
                Text('Passwrod $password'),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () {
                    preferencesUtils.savePreferencesBool('loginStatus', false);
                    preferencesUtils.removePreferences('username');
                    preferencesUtils.removePreferences('email');
                    preferencesUtils.removePreferences('password');
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: const Text(
                    'Log Out',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
