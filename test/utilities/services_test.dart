import 'package:flutter_test/flutter_test.dart';
import 'package:xafe/utilities/services.dart';

void main() {
  test(
      "given email with value hello@gmail.com when validateEmail function is called",
      () async {
    bool result = Service.validateEmail("hello@gmail.com");
    expect(result, true);
  });

  test("given current dateTime instance when dateFormatter function is called",
      () async {
    var testValue = DateTime.now();
    String result = Service.dateFormater(testValue.toString());
    expect(result, testValue.toString().substring(0, 11));
  });

  test("given a number when textFormatting function is called", () async {
    String result = Service.textFormatter("123456");
    expect(result, "123,456");
  });
}
