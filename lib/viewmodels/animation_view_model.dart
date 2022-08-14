import 'dart:async';

import 'package:flutter/material.dart';

class AnimationViewModel extends ChangeNotifier {
  int expenseText = 0;
  int incomeText = 0;
  double expenseBarHeight = 0;
  double incomeBarHeight = 0;

  void animateExpenseText() {
    const oneSec = Duration(microseconds: 1);
    Timer.periodic(
      oneSec,
      (Timer timer) {
        if (expenseText > 4750) {
          timer.cancel();
          return;
        }
        expenseText += 15;
        incomeText += 30;
        expenseBarHeight += 0.0002;
        incomeBarHeight += 0.0004;
        print(expenseText);

        notifyListeners();
      },
    );
  }
}
