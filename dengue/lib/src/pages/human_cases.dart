import 'package:dengue/components/human_tile.dart';
import 'package:dengue/src/data/humandata.dart';
import 'package:dengue/src/pages/human_register.dart';
import 'package:dengue/src/routes/app_routes.dart';
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
    const human = {...humandata};
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "Casos em Humanos",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(FeatherIcons.plus),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.HUMANREGISTER);
            },
          ),
        ),
        body: ListView.builder(
            itemCount: human.length,
            itemBuilder: (context, index) =>
                HumanTile(human.values.elementAt(index))));
  }
}
