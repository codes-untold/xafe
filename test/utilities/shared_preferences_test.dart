import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xafe/utilities/shared_preferences.dart';

void main() {
  test(
      "given a key for stored value that doesn't exist when the getString function is called",
      () async {
    SharedPreferences.setMockInitialValues({});
    WidgetsFlutterBinding.ensureInitialized();
    String? result = await SharedPreferencesUtil.getString("false_key");
    expect(result, "");
  });

  test(
      "given a key for stored value that doesn't exist when the getString function is called",
      () async {
    await SharedPreferencesUtil.setString("key", "value");
    String? result = await SharedPreferencesUtil.getString("key");
    expect(result, "value");
  });
}
