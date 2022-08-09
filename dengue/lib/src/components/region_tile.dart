import 'package:dengue/src/controllers/region_register_controller.dart';
import 'package:dengue/src/data/pages_list.dart';
import 'package:dengue/src/model/region.dart';
import 'package:dengue/src/pages/region_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../pages/region_view.dart';

class RegionTile extends StatelessWidget {
  final RegionRegisterController _regionRegisterController =
      RegionRegisterController();

  final Region region;

  RegionTile(this.region, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(region.address),
      subtitle: Text(region.city),
      trailing: SizedBox(
        width: 144,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(FeatherIcons.eye),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegionView(region: region),
                    )).then((value) {});
              },
            ),
            IconButton(
              icon: const Icon(FeatherIcons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegionEdit(region: region),
                    ));
              },
              color: Colors.black,
            ),
            IconButton(
              icon: const Icon(FeatherIcons.delete),
              color: const Color.fromARGB(255, 194, 81, 73),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Excluir Registro?'),
                    content: const Text('Tem certeza?'),
                    actions: <Widget>[
                      // TextButton(onPressed: () {}, child: const Text('Sim')),
                      TextButton(
                          onPressed: () async {
                            await _regionRegisterController.deleteRegionCase(
                                region.id, context);
                          },
                          child: const Text('Sim')),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text('Não')),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
