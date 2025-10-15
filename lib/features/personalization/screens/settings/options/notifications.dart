import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool pushNotifications = true;
  bool emailNotifications = false;
  bool orderUpdates = true;
  bool promotions = false;
  bool newArrivals = true;
  bool priceDrops = true;

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('General', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.notification,
              title: 'Push Notifications',
              subtitle: 'Receive push notifications',
              value: pushNotifications,
              onChanged: (val) => setState(() => pushNotifications = val),
            ),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.sms,
              title: 'Email Notifications',
              subtitle: 'Receive email notifications',
              value: emailNotifications,
              onChanged: (val) => setState(() => emailNotifications = val),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            Text('Order Updates', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.box,
              title: 'Order Status',
              subtitle: 'Get updates on your orders',
              value: orderUpdates,
              onChanged: (val) => setState(() => orderUpdates = val),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            Text('Marketing', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.discount_shape,
              title: 'Promotions',
              subtitle: 'Receive promotional offers',
              value: promotions,
              onChanged: (val) => setState(() => promotions = val),
            ),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.tag,
              title: 'New Arrivals',
              subtitle: 'Get notified about new products',
              value: newArrivals,
              onChanged: (val) => setState(() => newArrivals = val),
            ),
            _buildSwitchTile(
              context,
              isDark,
              icon: Iconsax.arrow_down,
              title: 'Price Drops',
              subtitle: 'Alert on price reductions',
              value: priceDrops,
              onChanged: (val) => setState(() => priceDrops = val),
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
}
