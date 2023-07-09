// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously, body_might_complete_normally_nullable

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
  late bool newUser;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    loginData = await SharedPreferences.getInstance();
    newUser = loginData.getBool('login') ?? true;

    if (newUser == false) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const BottomNavigationWidget(),
          ),
          (route) => false);
    }
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
                  onPressed: () {
                    final isValidForm = formKey.currentState!.validate();

                    String username = loginViewModel.nameController.text;
                    if (isValidForm) {
                      loginData.setBool('login', false);
                      loginData.setString('username', username);
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const BottomNavigationWidget(),
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
