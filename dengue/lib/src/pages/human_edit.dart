import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HumanEdit extends StatelessWidget {
  const HumanEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Caso em Humano'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () {},
          ),
        ],
      ),
      body: const Padding(padding: EdgeInsets.all(10)),
    );
  }
}
