import 'package:flutter/material.dart';

import '../../../../common/widgets/cart_menu_icon.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helper_functions.dart';
import 'widgets/featured_brands_section.dart';
import 'widgets/store_search_bar.dart';
// remove old StoreTabContent import if you will replace it with the example below
import 'widgets/store_tab_content.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          actions: [
            RCartCounterIcon(iconColor: isDark ? RColors.white : Colors.black),
          ],
        ),
        body: NestedScrollView(
          key: const PageStorageKey('StoreNestedScroll'),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // Use SliverOverlapAbsorber so tabs' scroll views can inject overlap
            return <Widget>[
              SliverOverlapAbsorber(
                // This handle must be the same one used by SliverOverlapInjector inside each tab
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true, // pin TabBar so it's always visible when collapsed
                  floating: false,
                  snap: false,
                  forceElevated: innerBoxIsScrolled,
                  backgroundColor: isDark ? RColors.backgroundDark : RColors.backgroundLight,
                  expandedHeight: 440,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
                      // Avoid nested scrollables here. Use Column (fixed content).
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          StoreSearchBar(),
                          SizedBox(height: RSizes.spaceBtwSections),
                          FeaturedBrandsSection(),
                          // add spacing to match the expandedHeight if needed
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(48),
                    child: Container(
                      color: isDark ? RColors.backgroundDark : RColors.backgroundLight,
                      child: TabBar(
                        isScrollable: true,
                        indicatorColor: RColors.primaryLight,
                        labelColor: isDark ? RColors.white : RColors.onPrimaryLight,
                        unselectedLabelColor: isDark ? RColors.onMutedDark : RColors.onMutedLight,
                        tabs: const [
                          Tab(child: Text('Sports')),
                          Tab(child: Text('Furniture')),
                          Tab(child: Text('Electronics')),
                          Tab(child: Text('Clothes')),
                          Tab(child: Text('Cosmetics')),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // IMPORTANT: each child must be a scrollable that uses a SliverOverlapInjector
            children: const [
              CategoryTabContent(tabKey: 'sports'),
              CategoryTabContent(tabKey: 'furniture'),
              CategoryTabContent(tabKey: 'electronics'),
              CategoryTabContent(tabKey: 'clothes'),
              CategoryTabContent(tabKey: 'cosmetics'),
            ],
          ),
        ),
      ),
    );
  }
}