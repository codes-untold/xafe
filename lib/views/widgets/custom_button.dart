import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(this.widget, this.onPressed, {Key? key}) : super(key: key);

  final Widget widget;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // <-- Radius
          ),
          primary: appBlue,
          padding: const EdgeInsets.symmetric(vertical: 15),
          textStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      onPressed: onPressed,
      child: Center(child: widget),
    );
  }
}
