import 'package:flutter/material.dart';

class RegionCases extends StatefulWidget {
  const RegionCases({Key? key}) : super(key: key);

  @override
  RegionCasesState createState() => RegionCasesState();
}

class RegionCasesState extends State<RegionCases> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Região'),
      ),
    );
  }
}
