import 'package:email_auth/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/models/sign_up_sequence.dart';
import 'package:xafe/utilities/shared_preferences.dart';

import '../models/signup_content_model.dart';

class AuthViewModel extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  String? userId;

  List<SignupContentModel> signUpContent = [
    SignupContentModel(
        mainText: "What's your name",
        subText: "Enter your first name and last name",
        signUpSequenceValue: SignUpSequence.userName,
        progressBarNumber: 1),
    SignupContentModel(
        mainText: "What's your email",
        subText: "Enter your email address",
        signUpSequenceValue: SignUpSequence.userEmail,
        progressBarNumber: 2),
    SignupContentModel(
        mainText: "Enter the code",
        subText: "Enter the code sent to your email address",
        signUpSequenceValue: SignUpSequence.verifyOTP,
        progressBarNumber: 3),
    SignupContentModel(
        mainText: "Add a Password",
        subText: "Enter password",
        hasPasswordToggleButton: true,
        signUpSequenceValue: SignUpSequence.password,
        buttonText: "Signup",
        progressBarNumber: 4),
  ];

  int contentIndex = 0;
  late String userName;
  late String userEmail;
  late String userPassword;

  bool isScreenBusy = false;

  EmailAuth emailAuth = EmailAuth(sessionName: "Xafe App session");

  Future<bool> navigateSignUpScreens(String inputedText) async {
    switch (signUpContent[contentIndex].signUpSequenceValue) {
      case SignUpSequence.userName:
        userName = inputedText;
        notifyListeners();
        return true;
      case SignUpSequence.userEmail:
        return sendOTP(inputedText);
      case SignUpSequence.verifyOTP:
        return emailAuth.validateOtp(
            recipientMail: userEmail, userOtp: inputedText);
      case SignUpSequence.password:
        return signUserUp(inputedText);
      default:
        return false;
    }
  }

  Future<bool> signUserUp(String inputedText) async {
    isScreenBusy = true;
    notifyListeners();
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userEmail, password: inputedText);
      setUserId(_auth.currentUser!.uid); //set currentUserId

      SharedPreferencesUtil.setString(userIdKey, userId!);
      isScreenBusy = false;
      notifyListeners();
      return true;
    } catch (e) {
      isScreenBusy = false;
      notifyListeners();
      return false;
    }
  }

  Future<bool> signUserIn(String email, String password) async {
    isScreenBusy = true;
    notifyListeners();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      setUserId(_auth.currentUser!.uid); //set currentUserId
      SharedPreferencesUtil.setString(userIdKey, userId!);
      isScreenBusy = false;
      notifyListeners();
      return true;
    } catch (e) {
      isScreenBusy = false;

      notifyListeners();
      return false;
    }
  }

  Future<bool> sendOTP(String inputedText) async {
    userEmail = inputedText;
    isScreenBusy = true;
    notifyListeners();
    bool result = await emailAuth.sendOtp(recipientMail: userEmail);
    isScreenBusy = false;
    return result;
  }

  void moveToNext() {
    contentIndex++;
    notifyListeners();
  }

  void moveToPrevious() {
    contentIndex--;
    notifyListeners();
  }

  String? getUserId() {
    return userId;
  }

  void setUserId(String id) {
    userId = id;
  }
}
