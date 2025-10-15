import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';
import '../widgets/settings__header.dart';
import '../widgets/settings_content.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return SingleChildScrollView(
      child: Column(
        children: [
          SettingsHeader(isDark: isDark),

          SettingsContent(),
        ],
      ),
    );
  }
}
