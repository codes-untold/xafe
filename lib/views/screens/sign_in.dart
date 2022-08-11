import 'package:flutter/material.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/views/widgets/custom_textfield.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    color: appGrey,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText.extraBold("Welcome Back", fontSize: 25),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomText.extraBold("Login to your account",
                      fontSize: 14, color: textGrey),
                  const SizedBox(
                    height: 40,
                  ),
                  const CustomTextField(hintText: "email"),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextField(
                    hintText: "password",
                    suffixIcon: Icon(Icons.visibility),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: offWhite),
                          child: CustomText.regular("forgot password?")),
                    ],
                  ),
                ],
              ),
            ),
            CustomButton(
                CustomText.bold("Login", fontSize: 12, color: appWhite), () {}),
          ],
        ),
      )),
    );
  }
}
