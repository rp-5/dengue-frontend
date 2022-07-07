import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/pages/human_cases.dart';
import 'package:dengue/src/pages/region_cases.dart';
import 'package:dengue/src/pages/over_the_years.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

List optionList = [
  {
    'id': 1,
    'icon': FeatherIcons.arrowUp,
    'name': 'HumanCases',
    "color": AppColors.blue,
    "page": const HumanCases()
  },
  {
    'id': 2,
    'icon': FeatherIcons.arrowDown,
    'name': 'RegionCases',
    "color": AppColors.red,
    "page": const RegionCases()
  },
  {
    'id': 3,
    'icon': FeatherIcons.repeat,
    'name': 'OverTheYears',
    "color": AppColors.green,
    "page": const OverTheYears()
  },
];
