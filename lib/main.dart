import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/utilities/router.dart';
import 'package:xafe/utilities/shared_preferences.dart';
import 'package:xafe/viewmodels/transaction_view_model.dart';
import 'package:xafe/views/screens/add_expense.dart';
import 'package:xafe/views/screens/category_screen.dart';
import 'package:xafe/views/screens/create_category.dart';
import 'package:xafe/views/screens/expense_history.dart';
import 'package:xafe/views/screens/home_screen.dart';
import 'package:xafe/views/screens/navigation_screen.dart';
import 'package:xafe/views/screens/sign_in.dart';
import 'package:xafe/views/screens/sign_up.dart';
import 'package:xafe/views/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: allProviders,
    child: MaterialApp(
      home: await isUserLoggedIn()
          ? const NavigationScreen()
          : const SplashScreen(),
      onGenerateRoute: AppRouter.generateRoute,
    ),
  ));
}

Future<bool> isUserLoggedIn() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String? result = preferences.getString(userIdKey);
  if (result == null) {
    return false;
  } else {
    return true;
  }
}
