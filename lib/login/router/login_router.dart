import 'package:bites_assignment/home/home_screen.dart';
import 'package:flutter/material.dart';

enum LoginRoutes { home, forgotPassword, register }

class LoginRouter {
  void routeTo(LoginRoutes route, BuildContext context) {
    switch (route) {
      case LoginRoutes.home:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      default:
        throw Exception("Unknown route");
    }
  }
}
