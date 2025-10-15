import 'package:e_commerce/common/widgets/action_card.dart';
import 'package:e_commerce/features/personalization/screens/address/addresses.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../utils/constants/sizes.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Account')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(RSizes.defaultSpace),
        child: Column(
          children: [
            RActionCard(icon: Iconsax.user_edit, title: 'Edit Profile', subtitle: 'Update your personal information', onTap: () {}),
            RActionCard(icon: Iconsax.location, title: 'Change Password', subtitle: 'Update your password', onTap: () {}),
            RActionCard(icon: Iconsax.location, title: 'Addresses', subtitle: 'Manage your delivery addresses',
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const UserAddressScreen()))),
            RActionCard(icon: Iconsax.card, title: 'Payment Methods', subtitle: 'Manage your payment options', onTap: () {},),
          ],
        ),
      ),
    );
  }
}
