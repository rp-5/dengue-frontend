import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:dengue/src/model/human.dart';
import 'package:dengue/src/pages/human_edit.dart';
import 'package:dengue/src/pages/human_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

// ignore: must_be_immutable
class HumanTile extends StatelessWidget {
  final HumanRegisterController _humanRegisterController =
      HumanRegisterController();

  final Human human;

  HumanTile(this.human, {Key? key}) : super(key: key);

  late Future<List<Human>> listHuman;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(human.name),
      subtitle: Text(human.status),
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
                      builder: (context) => HumanView(human: human),
                    )).then((value) {
                  listHuman = _humanRegisterController.fetchHumanList();
                });
              },
            ),
            IconButton(
              icon: const Icon(FeatherIcons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HumanEdit(human: human),
                    )).then((value) {
                  listHuman = _humanRegisterController.fetchHumanList();
                });
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
                      TextButton(
                          onPressed: () async {
                            await _humanRegisterController.deleteHumanCase(
                                human.id, context);
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
