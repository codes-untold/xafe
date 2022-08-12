import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/utilities/toast.dart';
import 'package:xafe/viewmodels/auth_view_model.dart';
import 'package:xafe/views/widgets/custom_textfield.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isTextObscured = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(
      builder: (context, authViewModel, _) {
        return Scaffold(
          backgroundColor: appWhite,
          body: SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Flexible(
                  child: Form(
                    key: _formkey,
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
                        CustomTextField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          hintText: "email",
                          controller: emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Field can't be empty";
                            }
                            return null;
                          },
                          isFieldObsured: isTextObscured,
                          hintText: "password",
                          controller: passwordController,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isTextObscured) {
                                  isTextObscured = false;
                                } else {
                                  isTextObscured = true;
                                }
                              });
                            },
                            child: Icon(isTextObscured
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
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
                ),
                CustomButton(
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomText.bold("Login", fontSize: 12, color: appWhite),
                        authViewModel.isScreenBusy
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: ConstrainedBox(
                                  constraints: const BoxConstraints.tightFor(
                                      width: 15, height: 15),
                                  child: const CircularProgressIndicator(
                                    color: appWhite,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink()
                      ],
                    ), () async {
                  if (_formkey.currentState!.validate()) {
                    bool result = await authViewModel.signUserIn(
                        emailController.text, passwordController.text);
                    if (result) {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          "/navigation_screen",
                          (Route<dynamic> route) => false);
                    } else {
                      showToastAlert(context, "Invalid Login Details",
                          isSuccess: false);
                    }
                  }
                }),
              ],
            ),
          )),
        );
      },
    );
  }
}
