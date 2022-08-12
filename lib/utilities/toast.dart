import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xafe/constants/app_constants.dart';
import 'package:xafe/views/widgets/custom_text.dart';

showToastAlert(BuildContext context, String msg, {bool isSuccess = true}) {
  FToast fToast = FToast().init(context);

  Widget toast = Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.symmetric(horizontal: 24.0),
    padding: const EdgeInsets.only(left: 6.0, right: 8.0, top: 14, bottom: 14),
    decoration: BoxDecoration(color: appWhite, boxShadow: [
      BoxShadow(
          color: appBlack.withOpacity(0.15),
          blurRadius: 20,
          spreadRadius: 0,
          offset: const Offset(0, 0))
    ]),
    alignment: Alignment.center,
    child: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Image.asset(
            isSuccess
                ? " assets/icons/alert_success.png"
                : "assets/icons/alert_error.png",
            width: 20,
            height: 20,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 9,
          child: CustomText.regular(msg),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () => fToast.removeCustomToast(),
              child: const Icon(
                Icons.cancel,
                color: appGrey,
              )),
        ),
      ],
    ),
  );

  fToast.showToast(
      child: toast,
      toastDuration: const Duration(seconds: 5),
      positionedToastBuilder: (context, child) {
        return Positioned(child: child, top: 50.0, left: 0, right: 0);
      });
}
