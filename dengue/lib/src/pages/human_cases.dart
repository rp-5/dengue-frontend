import 'package:flutter/material.dart';

class HumanCases extends StatefulWidget {
  const HumanCases({Key? key}) : super(key: key);

  @override
  HumanCasesState createState() => HumanCasesState();
}

class HumanCasesState extends State<HumanCases> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Humanos'),
      ),
    );
  }
}
