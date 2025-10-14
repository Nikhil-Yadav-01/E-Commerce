import 'package:flutter/material.dart';

import '../../utils/constants/sizes.dart';

class GridLayoutWidget extends StatelessWidget {
  const GridLayoutWidget({
    super.key, required this.itemCount, required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: RSizes.gridViewSpacing,
        mainAxisSpacing: RSizes.gridViewSpacing,
        mainAxisExtent: 288,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
