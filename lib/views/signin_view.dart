import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'signup_view.dart';
import 'home_view.dart'; // Pastikan impor home_view.dart


class SignInView extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  final RxBool _isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Column(
                children: <Widget>[
                  const SizedBox(height: 60.0),
                  const Text(
                    "Welcome Back",
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Sign in to continue!',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                    ),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline, color: Color(0xFF898A8D)),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        color: Color(0xFF898A8D),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onChanged: (value) => controller.username.value = value,
                  ),
                  const SizedBox(height: 16),
                  Obx(() => TextField(
                    obscureText: !_isPasswordVisible.value,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock, color: Color(0xFF898A8D)),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color(0xFF898A8D),
                        ),
                        onPressed: () {
                          _isPasswordVisible.value = !_isPasswordVisible.value;
                        },
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        color: Color(0xFF898A8D),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.symmetric(vertical: 15),
                    ),
                    onChanged: (value) => controller.password.value = value,
                  )),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () async {
                      await controller.signIn();
                      if (controller.user.value != null) {
                        Get.toNamed('/home');
                      }
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        color: Color(0xFF9C3FC4),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFF4B6FC),
                      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Forgot Password or ID?",
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed('/signup');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
