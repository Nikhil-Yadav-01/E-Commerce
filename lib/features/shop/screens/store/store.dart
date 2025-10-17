import 'package:e_commerce/features/shop/screens/home/widgets/animated_section.dart';
import 'package:e_commerce/utils/constants/colors.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../common/widgets/search_bar.dart';
import 'widgets/animated_tab_bar.dart';
import 'widgets/brand_showcase.dart';
import 'widgets/store_app_bar.dart';
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

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: isDark
            ? RColors.backgroundDark
            : RColors.backgroundLight,
        appBar: const StoreAppBar(),
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
                      child: TabBarContainer(isDark: isDark),
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
}

class TabBarContainer extends StatelessWidget {
  const TabBarContainer({
    super.key,
    required this.isDark,
  });

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF2A2A2A)
            : Colors.white,
        boxShadow: [
          BoxShadow(
            color: isDark
                ? Colors.black.withValues(alpha: 0.2)
                : Colors.grey.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: AnimatedSection(
        delay: const Duration(milliseconds: 400),
        child: const AnimatedTabBar(),
      ),
    );
  }
}
