import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetsUserData {
  static const _storage = FlutterSecureStorage();

  static Future<Map<String, String>?> getsUserData() async {
    ///read the data from secure storage and return null if we do not have any data in storage
    final value = await _storage.read(key: "userData");
    debugPrint("this is read" + value.toString());

    return value == null ? null : Map<String, String>.from(json.decode(value));
  }
}
