import 'package:dengue/src/routes/app_routes.dart';
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
                Navigator.of(context).pushNamed(AppRoutes.humanEdit);
              },
              color: Colors.black,
            ),
            IconButton(
              icon: const Icon(FeatherIcons.delete),
              onPressed: () {},
              color: const Color.fromARGB(255, 194, 81, 73),
            ),
          ],
        ),
      ),
    );
  }
}
