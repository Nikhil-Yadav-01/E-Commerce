import 'package:e_commerce/common/widgets/cart_menu_icon.dart';
import 'package:e_commerce/features/shop/screens/home/widgets/animated_section.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/app_bar.dart';
import '../../../../common/widgets/search_bar.dart';
import 'widgets/brand_showcase.dart';
import 'widgets/tab_content.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({super.key});

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late Animation<double> _headerAnimation;

  @override
  void initState() {
    super.initState();
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _headerAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _headerController, curve: Curves.easeOut),
    );
    _headerController.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = RHelperFunctions.screenWidth();
    final isSmallScreen = screenWidth < 400;

    final categories = [
      {'name': 'Sports', 'icon': Icons.sports_soccer},
      {'name': 'Furniture', 'icon': Icons.chair},
      {'name': 'Electronics', 'icon': Icons.devices},
      {'name': 'Clothes', 'icon': Icons.checkroom},
      {'name': 'Cosmetics', 'icon': Icons.face_retouching_natural},
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: isDark
            ? RColors.backgroundDark
            : RColors.backgroundLight,
        appBar: const RAppBar(
          title: Text('Store'),
          actions: [RCartCounterIcon()],
        ),
        body: FadeTransition(
          opacity: _headerAnimation,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverOverlapAbsorber(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                    context,
                  ),
                  sliver: SliverAppBar(
                    automaticallyImplyLeading: false,
                    pinned: true,
                    floating: false,
                    snap: false,
                    forceElevated: innerBoxIsScrolled,
                    backgroundColor: isDark
                        ? const Color(0xFF2A2A2A)
                        : Colors.white,
                    expandedHeight: isSmallScreen ? 280 : 320,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: isDark
                                ? [
                                    const Color(0xFF2A2A2A),
                                    const Color(0xFF1E1E1E),
                                  ]
                                : [Colors.white, const Color(0xFFF8F9FA)],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: isSmallScreen ? 12 : 16),

                            // Enhanced Search Bar
                            AnimatedSection(child: const RSearchBar()),

                            SizedBox(height: isSmallScreen ? 16 : 20),

                            // Brand Showcase
                            Expanded(
                              child: AnimatedSection(
                                delay: const Duration(milliseconds: 200),
                                child: const BrandShowcase(),
                              ),
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(48),
                      child: TabBarContainer(
                        tabBar: _getTabBar(isSmallScreen, isDark, categories),
                      ),
                    ),
                  ),
                ),
              ];
            },
            body: const TabBarView(
              children: [
                RTabContent(tabKey: 'sports'),
                RTabContent(tabKey: 'furniture'),
                RTabContent(tabKey: 'electronics'),
                RTabContent(tabKey: 'clothes'),
                RTabContent(tabKey: 'cosmetics'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _getTabBar(
    bool isSmallScreen,
    bool isDark,
    List<Map<String, Object>> categories,
  ) {
    return TabBar(
      isScrollable: true,
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12),
      indicatorColor: isDark
          ? const Color(0xFF4A90E2)
          : const Color(0xFF6C63FF),
      indicatorWeight: 3,
      labelColor: isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF),
      unselectedLabelColor: isDark ? Colors.white70 : Colors.black54,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: isSmallScreen ? 12 : 14,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: isSmallScreen ? 12 : 14,
      ),
      tabs: categories.map((category) {
        return Tab(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 8 : 12,
              vertical: isSmallScreen ? 6 : 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  category['icon'] as IconData,
                  size: isSmallScreen ? 16 : 18,
                ),
                const SizedBox(width: 6),
                Text(category['name'] as String),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

class SS extends StatelessWidget {
  const SS({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = RHelperFunctions.isDarkMode(context);
    final screenWidth = RHelperFunctions.screenWidth();
    final isSmallScreen = screenWidth < 400;

    final categories = [
      {'name': 'Sports', 'icon': Icons.sports_soccer},
      {'name': 'Furniture', 'icon': Icons.chair},
      {'name': 'Electronics', 'icon': Icons.devices},
      {'name': 'Clothes', 'icon': Icons.checkroom},
      {'name': 'Cosmetics', 'icon': Icons.face_retouching_natural},
    ];

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        // 1. The main AppBar is placed here in the Scaffold. It will not scroll.
        appBar: RAppBar(
          title: const Text('Store'),
          actions: [RCartCounterIcon()],
        ),
        // 2. The body is a NestedScrollView to coordinate scrolling.
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // 3. These are the slivers that will scroll under the main AppBar.
            return <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [const BrandShowcase(), const SizedBox(height: 20)],
                ),
              ),

              // 4. This SliverPersistentHeader holds the TabBar and makes it "stick".
              SliverPersistentHeader(
                delegate: _SliverAppBarDelegate(
                  TabBar(
                    isScrollable: true,
                    padding: EdgeInsets.symmetric(
                      horizontal: isSmallScreen ? 8 : 12,
                    ),
                    indicatorColor: isDark
                        ? const Color(0xFF4A90E2)
                        : const Color(0xFF6C63FF),
                    indicatorWeight: 3,
                    labelColor: isDark
                        ? const Color(0xFF4A90E2)
                        : const Color(0xFF6C63FF),
                    unselectedLabelColor: isDark
                        ? Colors.white70
                        : Colors.black54,
                    labelStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                    unselectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: isSmallScreen ? 12 : 14,
                    ),
                    tabs: categories.map((category) {
                      return Tab(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: isSmallScreen ? 8 : 12,
                            vertical: isSmallScreen ? 6 : 8,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                category['icon'] as IconData,
                                size: isSmallScreen ? 16 : 18,
                              ),
                              const SizedBox(width: 6),
                              Text(category['name'] as String),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                pinned: true, // This is crucial to make the TabBar stick.
              ),
            ];
          },
          // 5. The content for each tab.
          body: const TabBarView(
            children: [
              RTabContent(tabKey: 'sports'),
              RTabContent(tabKey: 'furniture'),
              RTabContent(tabKey: 'electronics'),
              RTabContent(tabKey: 'clothes'),
              RTabContent(tabKey: 'cosmetics'),
            ],
          ),
        ),
      ),
    );
  }

  TabBar _getTabBar(
    bool isSmallScreen,
    bool isDark,
    List<Map<String, Object>> categories,
  ) {
    return TabBar(
      isScrollable: true,
      padding: EdgeInsets.symmetric(horizontal: isSmallScreen ? 8 : 12),
      indicatorColor: isDark
          ? const Color(0xFF4A90E2)
          : const Color(0xFF6C63FF),
      indicatorWeight: 3,
      labelColor: isDark ? const Color(0xFF4A90E2) : const Color(0xFF6C63FF),
      unselectedLabelColor: isDark ? Colors.white70 : Colors.black54,
      labelStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: isSmallScreen ? 12 : 14,
      ),
      unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: isSmallScreen ? 12 : 14,
      ),
      tabs: categories.map((category) {
        return Tab(
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 8 : 12,
              vertical: isSmallScreen ? 6 : 8,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  category['icon'] as IconData,
                  size: isSmallScreen ? 16 : 18,
                ),
                const SizedBox(width: 6),
                Text(category['name'] as String),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}

// Helper delegate class to make the TabBar a persistent header.
// This is a standard and reusable Flutter pattern.
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  const _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    // Optional: Could also add a Key here: TabBarContainer(key: const ValueKey('TabBarContainer'), tabBar: _tabBar);
    return TabBarContainer(tabBar: _tabBar);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({super.key, required this.tabBar});

  final TabBar tabBar;

  @override
  Widget build(BuildContext context) {
    // RHelperFunctions.isDarkMode is assumed to be defined.
    final bool isDark = RHelperFunctions.isDarkMode(context);

    return Container(
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF2A2A2A) : Colors.white,
        boxShadow: [
          BoxShadow(
            // withValues is assumed to be a custom extension method
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      // AnimatedSection is assumed to be defined.
      child: AnimatedSection(
        delay: const Duration(milliseconds: 400),
        child: tabBar,
      ),
    );
  }
}
