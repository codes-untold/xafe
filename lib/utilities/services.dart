import '../models/expense_model.dart';

class Service {
  static bool validateEmail(String value) {
    if (!RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  static String dateFormater(String value) {
    return value.substring(0, 11);
  }

  static String textFormatter(String amount) {
    String priceInText = "";
    int counter = 0;
    for (int i = (amount.length - 1); i >= 0; i--) {
      counter++;
      String str = amount[i];
      if ((counter % 3) != 0 && i != 0) {
        priceInText = "$str$priceInText";
      } else if (i == 0) {
        priceInText = "$str$priceInText";
      } else {
        priceInText = ",$str$priceInText";
      }
    }
    return priceInText.trim();
  }
}
