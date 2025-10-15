import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class AccountPrivacyScreen extends StatefulWidget {
  const AccountPrivacyScreen({super.key});

  @override
  State<AccountPrivacyScreen> createState() => _AccountPrivacyScreenState();
}

class _AccountPrivacyScreenState extends State<AccountPrivacyScreen> {
  bool profileVisibility = true;
  bool activityStatus = false;
  bool dataSharing = false;
  bool twoFactorAuth = true;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Privacy'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Privacy Settings', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.eye,
              title: 'Profile Visibility',
              subtitle: 'Make your profile visible to others',
              value: profileVisibility,
              onChanged: (val) => setState(() => profileVisibility = val),
            ),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.activity,
              title: 'Activity Status',
              subtitle: 'Show when you\'re active',
              value: activityStatus,
              onChanged: (val) => setState(() => activityStatus = val),
            ),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.share,
              title: 'Data Sharing',
              subtitle: 'Share data with partners',
              value: dataSharing,
              onChanged: (val) => setState(() => dataSharing = val),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            Text('Security', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.shield_tick,
              title: 'Two-Factor Authentication',
              subtitle: 'Add extra security to your account',
              value: twoFactorAuth,
              onChanged: (val) => setState(() => twoFactorAuth = val),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildActionCard(
              context,
              isDark,
              icon: Iconsax.link,
              title: 'Connected Accounts',
              subtitle: 'Manage linked social accounts',
              onTap: () {},
            ),
            _buildActionCard(
              context,
              isDark,
              icon: Iconsax.document_text,
              title: 'Download My Data',
              subtitle: 'Request a copy of your data',
              onTap: () {},
            ),
            _buildActionCard(
              context,
              isDark,
              icon: Iconsax.trash,
              title: 'Delete Account',
              subtitle: 'Permanently delete your account',
              onTap: () {},
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSwitchTile(
    BuildContext context,
    bool isDark, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      padding: const EdgeInsets.all(RSizes.lg),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        border: Border.all(
          color: isDark ? RColors.borderNeutralDark : RColors.borderNeutralLight,
        ),
      ),
      child: Row(
        children: [
          Icon(icon, color: RColors.primaryLight, size: 24),
          const SizedBox(width: RSizes.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: Theme.of(context).textTheme.titleMedium),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
                      ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: RColors.primaryLight,
          ),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context,
    bool isDark, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        border: Border.all(
          color: isDestructive ? RColors.error : (isDark ? RColors.borderNeutralDark : RColors.borderNeutralLight),
        ),
      ),
      child: ListTile(
        onTap: onTap,
        leading: Icon(icon, color: isDestructive ? RColors.error : RColors.primaryLight),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: isDestructive ? RColors.error : null,
              ),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
              ),
        ),
        trailing: Icon(
          Iconsax.arrow_right_3,
          color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
        ),
      ),
    );
  }
}
