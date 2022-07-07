import 'package:dengue/src/data/option_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import '../src/model/human.dart';

class HumanTile extends StatelessWidget {
  final Human human;

  const HumanTile(this.human, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(human.name),
      subtitle: Text(human.email),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(FeatherIcons.edit),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => optionList[1]['page'],
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
                      TextButton(onPressed: () {}, child: const Text('Sim')),
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
