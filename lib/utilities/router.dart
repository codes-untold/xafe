// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xafe/views/screens/navigation_screen.dart';
import 'package:xafe/views/screens/sign_up.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case "/sign_up":
        return MaterialPageRoute(builder: (_) => const SignUpScreen());
      case "/navigation_screen":
        return MaterialPageRoute(builder: (_) => const NavigationScreen());
      case "/add_expense_screen":
        return MaterialPageRoute(builder: (_) => const NavigationScreen());

      //NewLiveClass
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
