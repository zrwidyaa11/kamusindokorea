// lib/main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/auth_binding.dart';
import 'views/signup_view.dart';
import 'views/signin_view.dart';
import 'views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      getPages: [
        GetPage(name: '/', page: () => SignInView()),
        GetPage(name: '/signin', page: () => SignInView()),
        GetPage(name: '/signup', page: () => SignUpView()),
        GetPage(name: '/home', page: () => HomeView()),
      ],
    );
  }
}
