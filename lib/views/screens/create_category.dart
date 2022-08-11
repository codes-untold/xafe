import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/option_tab.dart';

class CreateCategory extends StatelessWidget {
  const CreateCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  const SizedBox(
                    height: 20,
                  ),
                  const Icon(
                    Icons.arrow_back_ios,
                    color: appBlack,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomText.bold("Add a spending category", fontSize: 25),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(hintText: "Enter Category Name"),
                  const SizedBox(
                    height: 20,
                  ),
                  const OptionTab("Choose Category emoji"),
                ],
              ),
            ),
            CustomButton(
                CustomText.bold("Create Category",
                    color: appWhite, fontSize: 14),
                () {})
          ],
        ),
      )),
    );
  }
}
