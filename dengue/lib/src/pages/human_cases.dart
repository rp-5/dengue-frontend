import 'package:dengue/components/human_tile.dart';
import 'package:dengue/src/data/humandata.dart';
import 'package:dengue/src/pages/human_register.dart';
import 'package:dengue/src/routes/app_routes.dart';
import 'package:flutter/material.dart';

class HumanCases extends StatefulWidget {
  @override
  _HumanCases createState() => _HumanCases();
}

// class _HumanCases extends State<HumanCases> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           child: Text('Humanos'),
//         ),
//       ),
//     );
//   }
// }

class _HumanCases extends State<HumanCases> {
  @override
  Widget build(BuildContext context) {
    const human ={...humandata};
    return Scaffold(
      appBar: AppBar(
        title: Text("List de Pessoas"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.HUMANREGISTER);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: human.length,
        itemBuilder:(context, index) => HumanTile(human.values.elementAt(index)))
    );
  }
}
