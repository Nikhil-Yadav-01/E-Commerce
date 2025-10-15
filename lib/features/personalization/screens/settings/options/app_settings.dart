import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/action_card.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AppSettingsScreen extends StatelessWidget {
  const AppSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final isLiquid = false;

    return Scaffold(
      appBar: AppBar(
        title: const Text('App Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              value: isDark,
              onChanged: (value) {},
              title: const Text('App Mode'),
              subtitle: Text(isDark ? 'Dark' : 'Light'),
            ),
            SwitchListTile(
              value: isLiquid,
              onChanged: (value) {},
              title: const Text('Liquid Mode'),
              subtitle: Text(isLiquid ? 'Liquid' : 'Normal'),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),

            RActionCard(icon: Iconsax.document_upload, title: 'Load Data', subtitle: 'Upload Data to your Cloud Firestore'),
            RActionCard(icon: Iconsax.location, title: 'Location', subtitle: 'Allow access to your location'),
            RActionCard(icon: Iconsax.lock, title: 'Security', subtitle: 'Manage your app security'),
            RActionCard(icon: Iconsax.security_user, title: 'Privacy', subtitle: 'Learn how we manage your data'),
          ]
        ),
      ),
    );
  }
}
