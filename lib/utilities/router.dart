// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:xafe/views/screens/add_expense.dart';
import 'package:xafe/views/screens/category_screen.dart';
import 'package:xafe/views/screens/create_category.dart';
import 'package:xafe/views/screens/expense_history.dart';
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
        return MaterialPageRoute(builder: (_) => AddExpense());
      case "/createCategory":
        return MaterialPageRoute(builder: (_) => CreateCategory());

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
