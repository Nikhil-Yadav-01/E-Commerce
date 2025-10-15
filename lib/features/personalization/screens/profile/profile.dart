import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'edit_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfileScreen())),
            icon: const Icon(Iconsax.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            Center(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RColors.primaryGradient,
                      boxShadow: [
                        BoxShadow(
                          color: RColors.primaryLight.withValues(alpha: 0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.transparent,
                      child: Icon(Iconsax.user, size: 60, color: Colors.white),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(RSizes.xs),
                      decoration: BoxDecoration(
                        color: RColors.primaryLight,
                        shape: BoxShape.circle,
                        border: Border.all(color: isDark ? RColors.backgroundDark : RColors.backgroundLight, width: 3),
                      ),
                      child: const Icon(Iconsax.camera, size: 20, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            Text('John Doe', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
            Text('john.doe@example.com', style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
            const SizedBox(height: RSizes.spaceBtwSections),
            _buildInfoCard(context, isDark, 'Personal Information', [
              _buildInfoRowWithCopy(context, isDark, Iconsax.card, 'User ID', 'USR-2024-001'),
              _buildInfoRow(context, isDark, Iconsax.user, 'Full Name', 'John Doe'),
              _buildInfoRow(context, isDark, Iconsax.call, 'Phone', '+1 234 567 8900'),
              _buildInfoRow(context, isDark, Iconsax.calendar, 'Date of Birth', 'Jan 15, 1990'),
              _buildInfoRow(context, isDark, Iconsax.man, 'Gender', 'Male'),
            ]),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildInfoCard(context, isDark, 'Contact Information', [
              _buildInfoRow(context, isDark, Iconsax.sms, 'Email', 'john.doe@example.com'),
              _buildInfoRow(context, isDark, Iconsax.location, 'Address', '123 Main St, New York, NY'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, bool isDark, String title, List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(RSizes.lg),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
        border: Border.all(color: isDark ? RColors.borderDark : RColors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: RSizes.spaceBtwItems),
          ...children,
        ],
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, bool isDark, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: RSizes.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(RSizes.sm),
            decoration: BoxDecoration(
              color: RColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(RSizes.radiusSmall),
            ),
            child: Icon(icon, size: 20, color: RColors.primaryLight),
          ),
          const SizedBox(width: RSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
                Text(value, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRowWithCopy(BuildContext context, bool isDark, IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: RSizes.md),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(RSizes.sm),
            decoration: BoxDecoration(
              color: RColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(RSizes.radiusSmall),
            ),
            child: Icon(icon, size: 20, color: RColors.primaryLight),
          ),
          const SizedBox(width: RSizes.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: isDark ? RColors.onMutedDark : RColors.onMutedLight)),
                Text(value, style: Theme.of(context).textTheme.bodyLarge),
              ],
            ),
          ),
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: value));
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('$label copied to clipboard'), duration: const Duration(seconds: 1)),
              );
            },
            icon: Icon(Iconsax.copy, size: 20, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
          ),
        ],
      ),
    );
  }
}