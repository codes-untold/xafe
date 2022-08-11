import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/viewmodels/auth_view_model.dart';
import 'package:xafe/views/widgets/custom_button.dart';
import 'package:xafe/views/widgets/custom_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int contentIndex = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: ((context, authViewModel, _) {
      return Scaffold(
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
                          const Positioned(
                            child: Icon(
                              Icons.arrow_back_ios,
                              color: appGrey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomText.extraBold(
                        authViewModel.signUpContent[contentIndex].mainText,
                        fontSize: 25),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controller,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(fontSize: 14),
                          hintText:
                              authViewModel.signUpContent[contentIndex].subText,
                          isDense: true,
                          border: InputBorder.none),
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
                          child: authViewModel.signUpContent[contentIndex]
                                  .hasPasswordToggleButton
                              ? CustomText.regular("show password")
                              : const SizedBox.shrink(),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 8,
                decoration: BoxDecoration(
                    color: offWhite, borderRadius: BorderRadius.circular(16)),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomButton(
                  CustomText.bold(
                      authViewModel.signUpContent[contentIndex].buttonText,
                      fontSize: 15,
                      color: appWhite), () {
                if (contentIndex == 3) {
                  return;
                }
                setState(() {
                  controller.clear();
                  contentIndex++;
                });
              })
            ],
          ),
        )),
      );
    }));
  }
}
