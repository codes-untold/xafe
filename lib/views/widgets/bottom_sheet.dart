import 'package:flutter/material.dart';
import 'package:xafe/utilities/toast.dart';

import '../../constants/app_constants.dart';
import 'custom_text.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: appWhite,
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: size.width * 0.2,
            height: 5,
            decoration: BoxDecoration(
                color: const Color(0x10757866),
                borderRadius: BorderRadius.circular(12)),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/add_expense_screen");
              },
              child: customRow("add_expense", "Add an Expense")),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                showToastAlert(context, "Feature not avaliable",
                    isSuccess: false);
              },
              child: customRow("create_budget", "Create a budget")),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
              onTap: () {
                showToastAlert(context, "Feature not avaliable",
                    isSuccess: false);
              },
              child: customRow("add_spending", "Add an spending category")),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget customRow(String imgpath, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/icons/$imgpath.png",
          width: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.regular(text),
              const SizedBox(
                height: 10,
              ),
              const Divider()
            ],
          ),
        )
      ],
    );
  }
}
