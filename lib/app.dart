import 'package:e_commerce/features/authentication/screens/onboarding/onboarding.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      // Show Loader meanwhile Authentication Repository is deciding to show relevant screen
      home: const Scaffold(
        backgroundColor: RColors.primaryLight,
        body: Center(
          child: CircularProgressIndicator(
            color: RColors.onPrimaryLight,
          ),
        ),
      ),
    );
  }
}

