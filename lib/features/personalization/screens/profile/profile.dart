import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Iconsax.edit,
              color: isDark ? Colors.white : Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundColor: isDark ? Colors.grey[800] : Colors.grey[200],
                child: Icon(
                  Iconsax.user,
                  size: 50,
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwItems),
              Text(
                'John Doe',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                'john.doe@example.com',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey[500],
                ),
              ),
              const SizedBox(height: RSizes.spaceBtwSections),
              _buildProfileOption(
                context,
                icon: Iconsax.user,
                title: 'My Account',
                subtitle: 'Make changes to your account',
                isDark: isDark,
              ),
              _buildProfileOption(
                context,
                icon: Iconsax.shopping_bag,
                title: 'My Orders',
                subtitle: 'In-progress and Completed Orders',
                isDark: isDark,
              ),
              _buildProfileOption(
                context,
                icon: Iconsax.bank,
                title: 'Bank Account',
                subtitle: 'Withdraw balance to registered bank account',
                isDark: isDark,
              ),
              _buildProfileOption(
                context,
                icon: Iconsax.discount_shape,
                title: 'My Coupons',
                subtitle: 'List of all the discounted coupons',
                isDark: isDark,
              ),
              _buildProfileOption(
                context,
                icon: Iconsax.notification,
                title: 'Notifications',
                subtitle: 'Set any kind of notification message',
                isDark: isDark,
              ),
              _buildProfileOption(
                context,
                icon: Iconsax.security_card,
                title: 'Account Privacy',
                subtitle: 'Manage data usage and connected accounts',
                isDark: isDark,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required bool isDark,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? Colors.grey[800] : Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Iconsax.arrow_right_3,
            color: Colors.grey[500],
            size: 16,
          ),
        ],
      ),
    );
  }
}