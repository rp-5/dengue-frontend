import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HumanRegister extends StatelessWidget {
  const HumanRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Caso em Humano'),
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
              ),
            ],
          ),
        ),
        ),
      );
  }
}
