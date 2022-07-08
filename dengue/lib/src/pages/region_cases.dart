import 'package:dengue/src/components/region_tile.dart';
import 'package:dengue/src/data/option_list.dart';
import 'package:dengue/src/data/regionData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegionCases extends StatefulWidget {
  const RegionCases({Key? key}) : super(key: key);

  @override
  RegionCasesState createState() => RegionCasesState();
}

class RegionCasesState extends State<RegionCases> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

Widget getBody() {
    const region = {...regiondata};
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: const Text(
            "Casos por Região",
            style: TextStyle(color: Colors.white),
          ),
          leading: IconButton(
            icon: const Icon(FeatherIcons.plus),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => optionList[2]['page'],
                  ));
            },
          ),
        ),
        body: ListView.builder(
            itemCount: region.length,
            itemBuilder: (context, index) =>
                RegionTile(region.values.elementAt(index))));
  }
}
//   Widget getBody(){
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
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
