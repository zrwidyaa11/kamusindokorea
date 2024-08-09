import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/auth_binding.dart';
import 'views/signup_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      home: SignUpView(),
    );
  }
}