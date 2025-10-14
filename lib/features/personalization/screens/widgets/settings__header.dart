import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/app_bar.dart';
import '../../../../common/widgets/primary_container.dart';
import '../../../../common/widgets/rounded_image.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/images.dart';
import '../../../../utils/constants/sizes.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return RPrimaryContainer(
      child: Column(
        children: [
          RAppBar(
            title: Text(
              "Settings",
              style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: isDark
                    ? RColors.onBackgroundDark
                    : RColors.onBackgroundLight,
              ),
            ),
          ),

          // User Profile Card
          ListTile(
            leading: RoundedImage(
              imageUrl: RImages.user,
              width: 50,
              height: 50,
              padding: EdgeInsets.zero,
            ),
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: isDark
                    ? RColors.onBackgroundDark
                    : RColors.onBackgroundLight,
              ),
            ),
            subtitle: Text(
              "john.doe@gmail.com",
              style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: isDark
                    ? RColors.onBackgroundDark
                    : RColors.onBackgroundLight,
              ),
            ),
            trailing: IconButton(
              onPressed: () {},
              icon: Icon(
                Iconsax.edit,
                color: isDark
                    ? RColors.onBackgroundDark
                    : RColors.onBackgroundLight,
              ),
            ),
          ),
          const SizedBox(height: RSizes.spaceBtwSections),
        ],
      ),
    );
  }
}
