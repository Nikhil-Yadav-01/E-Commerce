import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helper_functions.dart';

class BankAccountScreen extends StatelessWidget {
  const BankAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Account'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(RSizes.lg),
              decoration: BoxDecoration(
                gradient: RColors.primaryGradient,
                borderRadius: BorderRadius.circular(RSizes.cardRadiusLg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Available Balance',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white70),
                  ),
                  const SizedBox(height: RSizes.xs),
                  Text(
                    '\$1,234.56',
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: RSizes.spaceBtwSections),
            Text('Linked Accounts', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: RSizes.spaceBtwItems),
            _buildBankCard(
              context,
              isDark,
              bankName: 'Chase Bank',
              accountNumber: '****1234',
              isPrimary: true,
            ),
            _buildBankCard(
              context,
              isDark,
              bankName: 'Bank of America',
              accountNumber: '****5678',
              isPrimary: false,
            ),
            const SizedBox(height: RSizes.spaceBtwItems),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Iconsax.add),
                label: const Text('Add Bank Account'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBankCard(
    BuildContext context,
    bool isDark, {
    required String bankName,
    required String accountNumber,
    required bool isPrimary,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: RSizes.spaceBtwItems),
      padding: const EdgeInsets.all(RSizes.lg),
      decoration: BoxDecoration(
        color: isDark ? RColors.cardDark : RColors.cardLight,
        borderRadius: BorderRadius.circular(RSizes.cardRadiusMd),
        border: Border.all(
          color: isPrimary ? RColors.primaryLight : (isDark ? RColors.borderDark : RColors.borderLight),
          width: isPrimary ? 2 : 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(RSizes.md),
            decoration: BoxDecoration(
              color: RColors.primaryLight.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(RSizes.radiusSmall),
            ),
            child: const Icon(Iconsax.bank, color: RColors.primaryLight),
          ),
          const SizedBox(width: RSizes.lg),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(bankName, style: Theme.of(context).textTheme.titleMedium),
                    if (isPrimary) ...[
                      const SizedBox(width: RSizes.sm),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: RSizes.sm, vertical: 2),
                        decoration: BoxDecoration(
                          color: RColors.success.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(RSizes.radiusMicro),
                        ),
                        child: Text(
                          'Primary',
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(color: RColors.success),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  accountNumber,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: isDark ? RColors.onMutedDark : RColors.onMutedLight,
                      ),
                ),
              ],
            ),
          ),
          Icon(Iconsax.arrow_right_3, color: isDark ? RColors.onMutedDark : RColors.onMutedLight),
        ],
      ),
    );
  }
}
