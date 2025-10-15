import 'package:e_commerce/features/personalization/screens/settings/options/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/action_card.dart';
import '../../../../utils/constants/sizes.dart';
import '../settings/options/account_privacy.dart';
import '../settings/options/bank_account.dart';
import '../settings/options/my_account.dart';
import '../settings/options/my_coupons.dart';
import '../settings/options/my_orders.dart';
import '../settings/options/notifications.dart';

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
          RActionCard(
            icon: Iconsax.user,
            title: 'My Account',
            subtitle: 'Make changes to your account',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyAccountScreen())),
          ),
          RActionCard(
            icon: Iconsax.shopping_bag,
            title: 'My Orders',
            subtitle: 'In-progress and Completed Orders',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyOrdersScreen())),
          ),
          RActionCard(
            icon: Iconsax.bank,
            title: 'Bank Account',
            subtitle: 'Withdraw balance to registered bank account',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const BankAccountScreen())),
          ),
          RActionCard(
            icon: Iconsax.discount_shape,
            title: 'My Coupons',
            subtitle: 'List of all the discounted coupons',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const MyCouponsScreen())),
          ),
          RActionCard(
            icon: Iconsax.activity,
            title: 'App Settings',
            subtitle: 'Manage how the app functions',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AppSettingsScreen())),
          ),
          RActionCard(
            icon: Iconsax.notification,
            title: 'Notifications',
            subtitle: 'Set any kind of notification message',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsScreen())),
          ),
          RActionCard(
            icon: Iconsax.security_card,
            title: 'Account Privacy',
            subtitle: 'Manage data usage and connected accounts',
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const AccountPrivacyScreen())),
          ),
        ],
      ),
    );
  }
}
