import 'package:flutter/material.dart';
import 'package:task_app/features/auth/login/presentation/widgets/login_textfield_widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _heightMediaQuery = MediaQuery.of(context).size.height;
    final _widthMediaQuery = MediaQuery.of(context).size.width;

    return Scaffold(
        body: _widthMediaQuery < 1700
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///Space for Logo
                  SizedBox(height: _heightMediaQuery * 0.2),
                  const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Text("Welcome Again"),
                  ),
                  const LoginTextFieldWidget()
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      ///Space for Logo
                      SizedBox(height: _heightMediaQuery * 0.2),
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Text("Welcome Again"),
                      ),
                    ],
                  ),
                  const LoginTextFieldWidget()
                ],
              ));
  }
}
