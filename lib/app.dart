import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/sign_in/sign_in.dart';
import 'utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce App',
      themeMode: ThemeMode.system,
      theme: RAppTheme.lightTheme,
      darkTheme: RAppTheme.darkTheme,
      home: const SignInScreen(),
    );
  }
}

