import 'package:flutter/material.dart';
import 'package:task_app/utilities/show_error.dart';

class SignupTextFieldWidget extends StatefulWidget {
  const SignupTextFieldWidget({super.key});

  @override
  State<SignupTextFieldWidget> createState() => _SignupTextFieldWidgetState();
}

class _SignupTextFieldWidgetState extends State<SignupTextFieldWidget> {
  final _userNameController = TextEditingController();

  final _passwordController = TextEditingController();
  final _phNumberController = TextEditingController();

  final _passeordFocusNode = FocusNode();
  final _phNumberFocusNode = FocusNode();

  @override
  void dispose() {
    _passeordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: [
          TextField(
            controller: _userNameController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(22.0),
              ),
              hintText: 'Enter User Name',
              labelText: 'User Name',
            ),
            onSubmitted: (value) {
              FocusScope.of(context).requestFocus(_passeordFocusNode);
            },
          ),
          TextField(
            controller: _passwordController,
            focusNode: _passeordFocusNode,
            textInputAction: TextInputAction.next,
            onSubmitted: (value) {
              FocusScope.of(context).requestFocus(_phNumberFocusNode);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(22.0),
              ),
              hintText: 'Enter Password',
              labelText: 'Password',
            ),
          ),
          TextField(
            controller: _phNumberController,
            focusNode: _phNumberFocusNode,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black),
                borderRadius: BorderRadius.circular(22.0),
              ),
              hintText: 'Enter Phone Number',
              labelText: 'Phone Number',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (_passwordController.text.isEmpty &&
                    _phNumberController.text.isEmpty &&
                    _userNameController.text.isEmpty &&
                    _phNumberController.text.length != 10) {
                  ShowError().showError("Enter all values");
                } else {
                  ///uncomment this once there is valid API in Auth Services File
                  ///that is present in lib\features\auth\services\auth_services.dart
                  // AuthServices().loginService(
                  //     _userNameController.text, _passwordController.text);

                  ///for time being
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: (_passwordController.text.isEmpty &&
                          _userNameController.text.isEmpty)
                      ? Colors.red.shade400
                      : Colors.red.shade800),
              child: const Text(
                "Login",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }
}
