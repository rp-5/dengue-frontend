import 'package:dengue/src/pages/human_cases.dart';
import 'package:dengue/src/pages/region_cases.dart';
import 'package:dengue/src/pages/over_the_years.dart';
import 'package:dengue/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  RootAppState createState() => RootAppState();
}

class RootAppState extends State<RootApp> {
  int activeCategory = 0;

  int pageIndex = 0;
  List<Widget> pages = [
    const HumanCases(),
    const RegionCases(),
    const OverTheYears()
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      FeatherIcons.users,
      FeatherIcons.globe,
      FeatherIcons.calendar
    ];

    return AnimatedBottomNavigationBar(
      activeColor: AppColors.primary,
      splashColor: AppColors.primary,
      inactiveColor: AppColors.black.withOpacity(0.2),
      icons: iconItems,
      // elevation: 0,
      activeIndex: pageIndex,
      gapLocation: GapLocation.none,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 24,
      rightCornerRadius: 10,
      onTap: (index) {
        HapticFeedback.heavyImpact();
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}
