import 'package:flutter/material.dart';
import 'package:task_app/features/splash_screen/services/try_auto_login_service.dart';

class SplashScreenService {
  splashScreenService(context) {
    Future.delayed(const Duration(seconds: 2), () async {
      ///As for now i have commented this once we are live we can uncomment this theme
      // final forTheme = Provider.of<ThemeProvider>(context, listen: false);
      final _userId = await TryAutoLogin().tryAutoLogin();

      // final themeMode =
      //     await ThemeModeService().themeModeServiceTryToGetThemeMode();
      // print(themeMode);
      // if (themeMode != null) {
      //   forTheme.setThemeModeFromRemote(themeMode);
      //   await ThemeModeService().themeModeServiceWrite(themeMode);
      // }
      if (_userId == null) {
        Navigator.pushReplacementNamed(
          context,
          "/login_screen",
        );
      } else {
        Navigator.pushReplacementNamed(context, "/home_screen",
            arguments: _userId);
      }
    });
  }
}
