import 'package:flutter/material.dart';
import 'package:xafe/views/widgets/custom_text.dart';

import '../../constants/app_constants.dart';

class OptionTab extends StatelessWidget {
  const OptionTab(this.text, {Key? key, this.hasSuffix = true})
      : super(key: key);

  final String text;
  final bool hasSuffix;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: offWhite),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.regular(text, color: altGrey),
          hasSuffix
              ? const Icon(
                  Icons.arrow_drop_down,
                  color: appBlack,
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
