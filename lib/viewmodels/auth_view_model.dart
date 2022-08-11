import 'package:flutter/foundation.dart';

import '../models/signup_content_model.dart';

class AuthViewModel extends ChangeNotifier {
  List<SignupContentModel> signUpContent = [
    SignupContentModel(
        mainText: "What's your name",
        subText: "Enter your first name and last name",
        progressBarNumber: 1),
    SignupContentModel(
        mainText: "What's your email",
        subText: "Enter your email address",
        progressBarNumber: 2),
    SignupContentModel(
        mainText: "Enter the code",
        subText: "Enter the code sent to your email address",
        progressBarNumber: 3),
    SignupContentModel(
        mainText: "Add a Password",
        subText: "Enter password",
        hasPasswordToggleButton: true,
        buttonText: "Signup",
        progressBarNumber: 4),
  ];
}
