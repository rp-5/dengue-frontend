import 'package:dengue/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OverTheYears extends StatefulWidget {
  const OverTheYears({Key? key}) : super(key: key);

  @override
  OverTheYearsState createState() => OverTheYearsState();
}

class OverTheYearsState extends State<OverTheYears> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        elevation: 0,
        title: const Text(
          "Casos ao Longo dos Anos",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
