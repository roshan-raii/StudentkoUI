import 'dart:async';
import 'dart:convert';

import 'package:student_application/constant/server.dart';
import 'package:student_application/data/models/login_models.dart';
import 'package:http/http.dart' as http;

class AuthenticationApi {
  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {
    try {
      var response = await http
          .post(
            Uri.parse("http://192.168.1.72:8000/student/login/"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode({
              'email': email,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 15));
      if (response.statusCode == 200) {
        print(response.body);
        return LoginModel.fromMap(jsonDecode(response.body));
      } else {
        // print('Request failed with status: ${response.statusCode}');
        return LoginModel.initError("Invalid Email or Password");
      }
    } on TimeoutException {
      return LoginModel.initError("Please Check you wifi");
    } catch (err) {
      print(err);
      return LoginModel.initError("Connection Issue");
    }
  }
}
