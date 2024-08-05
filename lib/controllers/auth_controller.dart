// lib/controllers/auth_controller.dart
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthController extends GetxController {
  var name = ''.obs;
  var username = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var user = Rxn<User>();

  Future<void> signIn() async {
    final response = await http.post(
      Uri.parse('https://example.com/login'),  // Ganti dengan URL API login Anda
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': username.value,
        'password': password.value,
      }),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      user.value = User.fromJson(data);
      print('Login berhasil: ${user.value!.token}');
    } else {
      print('Login gagal: ${response.body}');
    }
  }

  Future<void> signUp() async {
    final response = await http.post(
      Uri.parse('https://example.com/register'),  // Ganti dengan URL API pendaftaran Anda
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name.value,
        'username': username.value,
        'email': email.value,
        'password': password.value,
      }),
    );

    if (response.statusCode == 201) {
      print('Pendaftaran berhasil');
      Get.offAllNamed('/signin'); // Mengarahkan pengguna kembali ke halaman login setelah pendaftaran
    } else {
      print('Pendaftaran gagal: ${response.body}');
    }
  }
}

class User {
  final String username;
  final String token;

  User({required this.username, required this.token});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json['username'],
      token: json['token'],
    );
  }
}
