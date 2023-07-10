// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, body_might_complete_normally_nullable

import 'package:fitguide_exercise/utils/preferences/preferences_utils.dart';
import 'package:fitguide_exercise/widgets/bottom_navigation_bar/bottom_navigation.dart';
import 'package:fitguide_exercise/UI/view_models/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  late SharedPreferences loginData;
  late PreferencesUtils preferenceUtils;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    preferenceUtils = PreferencesUtils();
    await preferenceUtils.init();
    String? email = preferenceUtils.getPreferencesString('email');
    String? password = preferenceUtils.getPreferencesString('password');
    bool? loginStatus = preferenceUtils.getPreferencesBool('loginStatus');

    if (loginStatus == true) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigatorBar(),
          ),
          (route) => false);
    }
  }

  Future<void> saveUsername(String usernameValue) async {
    preferenceUtils.savePreferencesString('username', usernameValue);
  }

  Future<void> saveEmail(String emailValue) async {
    preferenceUtils.savePreferencesString('email', emailValue);
  }

  Future<void> savePassword(String passwordValue) async {
    preferenceUtils.savePreferencesString('password', passwordValue);
  }

  Future<void> saveStatus() async {
    preferenceUtils.savePreferencesBool('loginStatus', true);
  }

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Login Page'),
        ),
        body: Container(
          padding: const EdgeInsets.all(16),
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: loginViewModel.nameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_rounded),
                    labelText: 'Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    loginViewModel.validateName(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: loginViewModel.emailController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (email) {
                    loginViewModel.validateEmail(email);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: loginViewModel.passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.password_rounded),
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    loginViewModel.validatePassword(value);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: () async {
                    final isValidForm = formKey.currentState!.validate();

                    if (isValidForm) {
                      await saveUsername(loginViewModel.nameController.text);
                      await saveEmail(loginViewModel.emailController.text);
                      await savePassword(
                          loginViewModel.passwordController.text);
                      await saveStatus();

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BottomNavigatorBar(),
                          ),
                          (route) => false);
                    }
                    loginViewModel.nameController.clear();
                    loginViewModel.emailController.clear();
                    loginViewModel.passwordController.clear();
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        ));
  }
}
