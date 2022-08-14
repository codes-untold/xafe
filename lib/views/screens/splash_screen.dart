import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/utilities/shared_preferences.dart';
import 'package:xafe/views/screens/sign_in.dart';
import 'package:xafe/views/screens/sign_up.dart';
import 'package:xafe/views/widgets/custom_button.dart';
import 'package:xafe/views/widgets/custom_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: appBlack,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText.bold("xafe", color: appWhite, fontSize: 35),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomText.bold("Smart Budgeting",
                        color: appWhite, fontSize: 14),
                  ],
                ),
              ),
              flex: 7,
            ),
            Flexible(
                child: Column(
                  children: [
                    CustomButton(
                        CustomText.bold("Login", fontSize: 12, color: appWhite),
                        () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const SignInScreen())));
                    }),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText.regular("New here?", color: appWhite),
                        const SizedBox(
                          width: 5,
                        ),
                        GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const SignUpScreen())));
                            },
                            child: CustomText.medium("Create an account",
                                color: appWhite))
                      ],
                    ),
                    Flexible(
                        child: Center(
                      child: SizedBox(
                        width: screenSize.width * 0.75,
                        child: CustomText.regular(
                            "By continuing, you agree to Xafe’s terms of use and privacy policy",
                            color: appWhite,
                            fontSize: 12,
                            align: TextAlign.center),
                      ),
                    ))
                  ],
                ),
                flex: 3)
          ],
        ),
      )),
    );
  }
}
