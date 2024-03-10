import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:task_app/utilities/show_error.dart';

class AuthLocalService {
  Future<bool> setUserData(String username) async {
    const _secureStorge = FlutterSecureStorage();
    try {
      ///Save user data to secure Data
      _secureStorge.write(
          key: "taskUserData",
          value: json.encode({"username": username, "status": true}));

      ///if there is no error then return true
      return true;
    } catch (e) {
      ///if we get any error then we return false to frontend

      ShowError().showError("No enough Space Please try again later");
      return false;
    }
  }
}
