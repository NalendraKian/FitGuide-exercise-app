import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class LoginViewModel with ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  String? validateName(String? value) {
    if (value != null && value.length < 4) {
      return 'Enter at least 4 characters';
    } else {
      return null;
    }
  }

  String? validateEmail(String? email) {
    if (email != null && !EmailValidator.validate(email)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? validatePassword(String? value) {
    if (value != null && value.length < 5) {
      return 'Enter min. 5 characters';
    } else {
      return null;
    }
  }
}
