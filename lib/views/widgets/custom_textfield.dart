import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      required this.hintText,
      this.suffixIcon,
      this.controller,
      this.validator,
      this.isFieldObsured = false})
      : super(key: key);

  final String hintText;
  final Widget? suffixIcon;
  final bool isFieldObsured;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isFieldObsured,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintStyle: const TextStyle(fontSize: 14),
          filled: true,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
          fillColor: offWhite,
          hintText: hintText,
          isDense: true,
          suffixIcon: suffixIcon),
    );
  }
}
