import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/components/region_tile.dart';
import 'package:dengue/src/controllers/region_register_controller.dart';
import 'package:dengue/src/data/pages_list.dart';
import 'package:dengue/src/data/region_data.dart';
import 'package:dengue/src/model/region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegionCases extends StatefulWidget {
  const RegionCases({Key? key}) : super(key: key);

  @override
  RegionCasesState createState() => RegionCasesState();
}

class RegionCasesState extends State<RegionCases> {
  final RegionRegisterController _regionRegisterController =
      RegionRegisterController();
  late Future<List<Region>> listRegion;

  @override
  void initState() {
    super.initState();
    listRegion = _regionRegisterController.fetchRegionList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: AppColors.secondary,
            elevation: 0,
            title: const Text(
              "Casos por Município",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                icon: const Icon(FeatherIcons.plus),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => optionList[1]['page'],
                      ));
                },
              ),
              const SizedBox(
                width: 10,
              )
            ]),
        body: FutureBuilder<List<Region>>(
          future: listRegion,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Region>? data = snapshot.data;
              return ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return RegionTile(data![index]);
                  });
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }
            // By default show a loading spinner.
            return const CircularProgressIndicator();
          },
        ));
  }
}
//   Widget getBody(){
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//       backgroundColor: AppColors.secondary,
//         elevation: 0,
//         title: const Text(
//           "Casos por Região",
//           style: TextStyle(
//             color: Colors.white,
//           ),
//         ),
//       ),
//     );
//   }
// }
