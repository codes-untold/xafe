import 'package:flutter/material.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/views/widgets/custom_text.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      child: Center(
                          child: CustomText.bold("Login",
                              color: appWhite, fontSize: 12)),
                      decoration: BoxDecoration(
                          color: appBlue,
                          borderRadius: BorderRadius.circular(8)),
                    ),
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
                        CustomText.medium("Create an account", color: appWhite)
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
