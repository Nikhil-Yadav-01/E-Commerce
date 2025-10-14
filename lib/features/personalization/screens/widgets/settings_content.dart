import 'package:e_commerce/features/personalization/screens/widgets/settings_option.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../settings/settings.dart';

class SettingsContent extends StatelessWidget {
  const SettingsContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(RSizes.defaultSpace),
      child: Column(
        children: [
          SettingsOption(
            icon: Iconsax.user,
            title: 'My Account',
            subtitle: 'Make changes to your account',
          ),
          SettingsOption(
            icon: Iconsax.shopping_bag,
            title: 'My Orders',
            subtitle: 'In-progress and Completed Orders',
          ),
          SettingsOption(
            icon: Iconsax.bank,
            title: 'Bank Account',
            subtitle: 'Withdraw balance to registered bank account',
          ),
          SettingsOption(
            icon: Iconsax.discount_shape,
            title: 'My Coupons',
            subtitle: 'List of all the discounted coupons',
          ),
          SettingsOption(
            icon: Iconsax.notification,
            title: 'Notifications',
            subtitle: 'Set any kind of notification message',
          ),
          SettingsOption(
            icon: Iconsax.security_card,
            title: 'Account Privacy',
            subtitle: 'Manage data usage and connected accounts',
          ),
        ],
      ),
    );
  }
}
