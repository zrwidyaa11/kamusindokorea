// lib/views/signup_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import 'signin_view.dart';

class SignUpView extends StatelessWidget {
  final AuthController controller = Get.put(AuthController());
  final RxBool _isPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            height: MediaQuery.of(context).size.height - 50,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const SizedBox(height: 60.0),
                    const Text(
                      "Getting started",
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Create account to continue!',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon:
                            Icon(Icons.person, color: Color(0xFF898A8D)),
                        hintText: 'Name',
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
                      onChanged: (value) => controller.name.value = value,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_outline,
                            color: Color(0xFF898A8D)),
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
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Color(0xFF898A8D)),
                        hintText: 'Email',
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
                      onChanged: (value) => controller.email.value = value,
                    ),
                    const SizedBox(height: 16),
                    Obx(() => TextField(
                          obscureText: !_isPasswordVisible.value,
                          decoration: InputDecoration(
                            prefixIcon:
                                Icon(Icons.lock, color: Color(0xFF898A8D)),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Color(0xFF898A8D),
                              ),
                              onPressed: () {
                                _isPasswordVisible.value =
                                    !_isPasswordVisible.value;
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
                          onChanged: (value) =>
                              controller.password.value = value,
                        )),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          color: Color(0xFF9C3FC4),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFF4B6FC),
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 16),
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
                    Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(SignInView());
                      },
                      child: Text(
                        "Sign In",
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
      ),
    );
  }
}