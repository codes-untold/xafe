import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:xafe/utilities/router.dart';
import 'package:xafe/views/screens/navigation_screen.dart';

void main() {
  test("given navigation route key when generate route function is called",
      () async {
    RouteSettings routeSettings =
        const RouteSettings(name: "/navigation_screen");
    expect(AppRouter.generateRoute(routeSettings), const NavigationScreen());
  });
}
