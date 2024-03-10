import 'package:flutter/material.dart';
import 'package:task_app/features/auth/login/presentation/screens/login_screen.dart';
import 'package:task_app/features/home_page/presentation/screens/home_screen.dart';

class AppRoute {
  static Route<dynamic>? onGenerated(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        {
          return MaterialPageRoute(builder: (_) => HomeScreen());
        }
      case "/login_screen":
        {
          return MaterialPageRoute(builder: (_) => const LoginScreen());
        }

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: CircularProgressIndicator(),
                ));
    }
  }
}
