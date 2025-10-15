import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(title: const Text('My Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            _buildCard(context, isDark, Iconsax.user_edit, 'Edit Profile', 'Update your personal information'),
            _buildCard(context, isDark, Iconsax.lock, 'Change Password', 'Update your password'),
            _buildCard(context, isDark, Iconsax.location, 'Addresses', 'Manage your delivery addresses'),
            _buildCard(context, isDark, Iconsax.card, 'Payment Methods', 'Manage your payment options'),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, bool isDark, IconData icon, String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        border: Border.all(color: isDark ? RColors.borderNeutralDark : RColors.borderNeutralLight),
      ),
      child: ListTile(
        leading: Container(
          padding: const EdgeInsets.all(RSizes.sm),
          decoration: BoxDecoration(
            color: RColors.primaryLight.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(RSizes.radiusSmall),
          ),
          child: Icon(icon, color: RColors.primaryLight),
        ),
        title: Text(title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: Text(subtitle, style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
        trailing: Icon(Iconsax.arrow_right_3, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
      ),
    );
  }
}
