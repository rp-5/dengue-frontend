import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HumanRegister extends StatelessWidget {
  const HumanRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Caso em Humano'),
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
