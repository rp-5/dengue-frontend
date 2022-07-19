import 'package:dengue/src/components/human_tile.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:dengue/src/data/human_data.dart';
import 'package:dengue/src/data/pages_list.dart';
import 'package:dengue/src/model/human.dart';
import 'package:dengue/src/pages/human_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:dengue/core/theme/app_colors.dart';

class HumanCases extends StatefulWidget {
  const HumanCases({Key? key}) : super(key: key);

  @override
  HumanCasesState createState() => HumanCasesState();
}

class HumanCasesState extends State<HumanCases> {
  final HumanRegisterController _humanRegisterController =
      HumanRegisterController();

  late Future<List<Human>> listHuman;

  @override
  void initState() {
    super.initState();
    listHuman = _humanRegisterController.fetchHumanList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    // const human = {...humandata};
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.secondary,
            elevation: 0,
            title: const Text(
              "Casos em Humanos",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(FeatherIcons.plus),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => optionList[0]['page'],
                      )).then((value){
                         setState(() {
                          listHuman = _humanRegisterController.fetchHumanList();
                         });
                      });
                },
              ),
              const SizedBox(
                width: 10,
              )
            ]),
        body: FutureBuilder<List<Human>>(
          future: listHuman,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Human>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HumanTile(data![index]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));

    //  HumanTile(human.values.elementAt(index))));
  }
}
