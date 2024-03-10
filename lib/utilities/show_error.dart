import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShowError {
  void showError(String msg) {
    ///can change this based on needs
    Fluttertoast.showToast(msg: msg, backgroundColor: Colors.grey.shade600);
  }
}
