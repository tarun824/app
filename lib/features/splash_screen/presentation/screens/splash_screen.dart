import "package:flutter/material.dart";
import "package:task_app/features/splash_screen/services/splash_screen_service.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void checkUser() async {
    SplashScreenService().splashScreenService(context);
  }

  @override
  void initState() {
    super.initState();
    checkUser();
  }

  @override
  Widget build(BuildContext context) {
    final _mediaHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash_screen_image",

              /// have 75% of design and 20% of logo
              height: _mediaHeight * 0.7,
              width: double.infinity,
              fit: BoxFit.fill,
            ),

            ///add image here
            Image.asset(
              "",
              height: _mediaHeight * 0.15,
            ),
          ],
        ),
      ),
    );
  }
}
