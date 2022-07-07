import 'package:dengue/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: Colors.white,
    fontFamily: 'Proxima',
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
      labelStyle: const TextStyle(color: AppColors.black),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(
          vertical: (18 / 896.0) * 960, horizontal: (16 / 896.0) * 960),
      iconColor: AppColors.black,
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: AppColors.black.withOpacity(0.2), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.red, width: 1.4)),
      errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.red, width: 1.4),
          borderRadius: BorderRadius.circular(10)),
      hintStyle: TextStyle(color: AppColors.black.withOpacity(0.6)),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.black, width: 1.5),
        borderRadius: BorderRadius.circular(12),
      ),
      errorStyle: const TextStyle(
        color: Color.fromRGBO(255, 71, 98, 1),
      ));
}

TextTheme textTheme() {
  return const TextTheme(
    bodyText1: TextStyle(color: AppColors.black),
    bodyText2: TextStyle(color: AppColors.black),
  );
}
