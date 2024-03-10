import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:task_app/utilities/show_error.dart';

class AuthServices {
  final dio = Dio();
  //Login service
  Future<bool> loginService(String username, String password) async {
    try {
      final responce = await dio.post("",
          data: json.encode({"username": username, "password": password}),
          options: Options(headers: {"Content-Type": "application/json"}));
      if (responce.data["userStatus"] == "success") {
        return true;
      } else {
        return false;
      }
    } on DioException catch (error) {
      /// Once we know the responce fron Database we can handle the error
      ShowError().showError(error.toString());
      return false;
    }
  }

  Future<bool> signUpService(
      String username, String password, String phNumber) async {
    try {
      final responce = await dio.post("",
          data: json.encode({
            "username": username,
            "password": password,
            "phNumber": phNumber
          }),
          options: Options(headers: {"Content-Type": "application/json"}));
      if (responce.data["userStatus"] == "success") {
        return true;
      } else {
        return false;
      }
    } on DioException catch (error) {
      /// Once we know the responce fron Database we can handle the error
      ShowError().showError(error.toString());
      return false;
    }
  }
}
