import 'package:e_commerce/common/widgets/action_card.dart';
import 'package:e_commerce/common/widgets/action_switch_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

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
            ActionSwitchCard(
              icon: Iconsax.eye,
              title: 'Profile Visibility',
              subtitle: 'Make your profile visible to others',
              value: profileVisibility,
              onChanged: (val) => setState(() => profileVisibility = val),
            ),
            ActionSwitchCard(
              icon: Iconsax.activity,
              title: 'Activity Status',
              subtitle: 'Show when you\'re active',
              value: activityStatus,
              onChanged: (val) => setState(() => activityStatus = val),
            ),
            ActionSwitchCard(
              icon: Iconsax.share,
              title: 'Data Sharing',
              subtitle: 'Share data with partners',
              value: dataSharing,
              onChanged: (val) => setState(() => dataSharing = val),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),

            Text('Security', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            RActionCard(
              icon: Iconsax.shield_tick,
              title: 'Two-Factor Authentication',
              subtitle: 'Add extra security to your account',
              onTap: () {}
            ),
            ActionSwitchCard(
              icon: Iconsax.shield_tick,
              title: 'Two-Factor Authentication',
              subtitle: 'Add extra security to your account',
              value: twoFactorAuth,
              onChanged: (val) => setState(() => twoFactorAuth = val),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            RActionCard(
              icon: Iconsax.link,
              title: 'Connected Accounts',
              subtitle: 'Manage linked social accounts',
              onTap: () {}
            ),
            RActionCard(
              icon: Iconsax.document_text,
              title: 'Download My Data',
              subtitle: 'Request a copy of your data',
              onTap: () {}
            ),
            RActionCard(
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

}
