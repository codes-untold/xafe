import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/utilities/router.dart';
import 'package:xafe/views/screens/navigation_screen.dart';
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
