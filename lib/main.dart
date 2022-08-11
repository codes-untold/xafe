import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/views/screens/sign_up.dart';
import 'package:xafe/views/screens/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: allProviders,
    child: const MaterialApp(
      home: SignUpScreen(),
    ),
  ));
}
