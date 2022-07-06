import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/pages/human_cases.dart';
import 'package:dengue/src/pages/region_cases.dart';
import 'package:dengue/src/pages/over_the_years.dart';
import 'package:flutter_icons/flutter_icons.dart';

List optionList = [
  {
    'id': 1,
    'icon': Feather.arrow_up,
    'name': 'HumanCases',
    "color": AppColors.blue,
    "page": HumanCases()
  },
  {
    'id': 2,
    'icon': Feather.arrow_down,
    'name': 'RegionCases',
    "color": AppColors.red,
    "page": RegionCases()
  },
  {
    'id': 3,
    'icon': Feather.repeat,
    'name': 'OverTheYears',
    "color": AppColors.green,
    "page": OverTheYears()
  },
];
