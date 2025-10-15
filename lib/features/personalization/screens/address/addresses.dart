import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_bar.dart';
import '../../../../common/widgets/single_address.dart';
import '../../../../utils/constants/sizes.dart';
import '../widgets/add_new_address.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: RAppBar(
        title: Text('Addresses', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddNewAddressScreen()),
        backgroundColor: isDark ? RColors.primaryDark : RColors.primaryLight,
        child: Icon(Iconsax.add, color: isDark ? RColors.onBackgroundDark : RColors.onBackgroundLight,),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(RSizes.defaultSpace),
          child: Column(
            children: [
              SingleAddress(),
              SingleAddress(selectedAddress: true,),
              SingleAddress(),
              SingleAddress(),
              SingleAddress(),
            ],
          ),
        ),
      ),
    );
  }
}
