import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class ListBottomSheet extends StatelessWidget {
  const ListBottomSheet(this.widget, {Key? key}) : super(key: key);

  final Widget widget;
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
          widget
        ],
      ),
    );
  }
}
