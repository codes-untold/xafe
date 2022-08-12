import 'package:email_auth/email_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/models/sign_up_sequence.dart';
import 'package:xafe/utilities/services.dart';
import 'package:xafe/utilities/toast.dart';
import 'package:xafe/viewmodels/auth_view_model.dart';
import 'package:xafe/views/widgets/custom_button.dart';
import 'package:xafe/views/widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();
  bool isTextObscured = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: ((context, authViewModel, _) {
      return Scaffold(
        backgroundColor: appWhite,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints.tightFor(height: 20),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: double.infinity,
                            child: Center(
                              child: CustomText.bold("Sign Up", fontSize: 15),
                            ),
                          ),
                          Positioned(
                            child: GestureDetector(
                              onTap: () {
                                if (authViewModel.contentIndex == 0) {
                                  Navigator.pop(context);
                                  return;
                                }

                                controller.clear();
                                authViewModel
                                    .moveToPrevious(); //Navigate signup screens
                              },
                              child: const Icon(
                                Icons.arrow_back_ios,
                                color: appGrey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText.extraBold(
                        authViewModel
                            .signUpContent[authViewModel.contentIndex].mainText,
                        fontSize: 25),
                    const SizedBox(
                      height: 5,
                    ),
                    Form(
                      key: _formkey,
                      child: TextFormField(
                        obscureText: isTextObscured,
                        controller: controller,
                        keyboardType: getkeyboardType(authViewModel
                            .signUpContent[authViewModel.contentIndex]
                            .signUpSequenceValue),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "field cant be blank";
                          }
                          return validateFields(
                              authViewModel
                                  .signUpContent[authViewModel.contentIndex]
                                  .signUpSequenceValue,
                              value);
                        },
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(fontSize: 14),
                            hintText: authViewModel
                                .signUpContent[authViewModel.contentIndex]
                                .subText,
                            isDense: true,
                            border: InputBorder.none),
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
                          child: authViewModel
                                  .signUpContent[authViewModel.contentIndex]
                                  .hasPasswordToggleButton
                              ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (isTextObscured) {
                                        isTextObscured = false;
                                      } else {
                                        isTextObscured = true;
                                      }
                                    });
                                  },
                                  child: CustomText.regular(isTextObscured
                                      ? "show password"
                                      : "Hide password"))
                              : const SizedBox.shrink(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 8,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: appBlack,
                            borderRadius: BorderRadius.circular(30)),
                      ),
                      flex: authViewModel
                          .signUpContent[authViewModel.contentIndex]
                          .progressBarNumber,
                    ),
                    Expanded(
                      child: Container(
                        color: const Color(0x10ffffff),
                      ),
                      flex: 4 -
                          authViewModel
                              .signUpContent[authViewModel.contentIndex]
                              .progressBarNumber,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText.bold(
                          authViewModel
                              .signUpContent[authViewModel.contentIndex]
                              .buttonText,
                          fontSize: 15,
                          color: appWhite),
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
                  ), () {
                if (_formkey.currentState!.validate()) {
                  authViewModel
                      .navigateSignUpScreens(controller.text)
                      .then((value) {
                    if (value) {
                      if (authViewModel.contentIndex == 3) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            "/navigation_screen",
                            (Route<dynamic> route) => false);
                        return;
                      }
                      authViewModel.moveToNext();
                      controller.clear();
                    } else {
                      //only returns false on cases of invalid OTP
                      showToastAlert(context, "invalid OTP", isSuccess: false);
                    }
                  });
                }
              })
            ],
          ),
        )),
      );
    }));
  }

  TextInputType getkeyboardType(Enum signUpSequence) {
    switch (signUpSequence) {
      case SignUpSequence.userName:
        return TextInputType.name;
      case SignUpSequence.userEmail:
        return TextInputType.emailAddress;
      case SignUpSequence.verifyOTP:
        return TextInputType.phone;
      case SignUpSequence.password:
        return TextInputType.name;
    }
    return TextInputType.name;
  }

  String? validateFields(Enum signUpSequence, String text) {
    switch (signUpSequence) {
      case SignUpSequence.userEmail:
        if (Service.validateEmail(text)) {
          return null;
        } else {
          return "Enter a valid Email Address";
        }
      case SignUpSequence.password:
        if (text.length >= 6) {
          return null;
        } else {
          return "Password must be up to 6 characters";
        }
      default:
        return null;
    }
  }
}
