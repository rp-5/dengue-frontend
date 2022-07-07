import 'package:flutter/material.dart';

class OverTheYears extends StatefulWidget {
  const OverTheYears({Key? key}) : super(key: key);

  @override
  OverTheYearsState createState() => OverTheYearsState();
}

class OverTheYearsState extends State<OverTheYears> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Ao Longo Dos Anos'),
      ),
    );
  }
}
