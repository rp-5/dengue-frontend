import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../../core/theme/app_colors.dart';

class HumanCases extends StatefulWidget {
  const HumanCases({Key? key}) : super(key: key);

  @override
  HumanCasesState createState() => HumanCasesState();
}

class HumanCasesState extends State<HumanCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Casos em Humanos",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
