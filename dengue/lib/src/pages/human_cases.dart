import 'package:dengue/src/components/human_tile.dart';
import 'package:dengue/src/data/humandata.dart';
import 'package:dengue/src/data/option_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HumanCases extends StatefulWidget {
  const HumanCases({Key? key}) : super(key: key);

  @override
  HumanCasesState createState() => HumanCasesState();
}

class HumanCasesState extends State<HumanCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => optionList[0]['page'],
                  ));
            },
          ),
        ),
        body: ListView.builder(
            itemCount: human.length,
            itemBuilder: (context, index) =>
                HumanTile(human.values.elementAt(index))));
  }
}
