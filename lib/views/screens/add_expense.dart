import 'package:flutter/material.dart';
import 'package:xafe/views/widgets/custom_button.dart';
import 'package:xafe/views/widgets/custom_text.dart';
import 'package:xafe/views/widgets/custom_textfield.dart';
import 'package:xafe/views/widgets/option_tab.dart';

import '../../constants/app_constants.dart';

class AddExpense extends StatelessWidget {
  const AddExpense({Key? key}) : super(key: key);

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
                  CustomText.bold("Add an expense", fontSize: 25),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(hintText: "expense amount"),
                  const SizedBox(
                    height: 20,
                  ),
                  const OptionTab("Select Category"),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextField(hintText: "expense name"),
                  const SizedBox(
                    height: 20,
                  ),
                  const OptionTab("date(dd/mm/yy)"),
                ],
              ),
            ),
            CustomButton(
                CustomText.bold("Add Expense", color: appWhite, fontSize: 14),
                () {})
          ],
        ),
      )),
    );
  }
}
