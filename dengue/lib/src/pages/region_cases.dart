import 'package:flutter/material.dart';

class RegionCases extends StatefulWidget {
  const RegionCases({Key? key}) : super(key: key);

  @override
  RegionCasesState createState() => RegionCasesState();
}

class RegionCasesState extends State<RegionCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Casos por Região",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
