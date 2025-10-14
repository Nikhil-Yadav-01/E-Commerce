import 'package:e_commerce/common/widgets/app_bar.dart';
import 'package:e_commerce/common/widgets/primary_container.dart';
import 'package:e_commerce/common/widgets/rounded_image.dart';
import 'package:e_commerce/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
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
