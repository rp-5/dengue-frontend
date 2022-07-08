import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegionEdit extends StatefulWidget {
  @override
  RegionEditState createState() => RegionEditState();
  const RegionEdit({Key? key}) : super(key: key);
}

class RegionEditState extends State<RegionEdit> {
  bool isSelectedAgua = false;
  bool isSelectedLarva = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Infestação na Região'),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () {},
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Endereço*'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Bairro*'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Cidade*'),
              ),
              ChoiceChip(
                label: const Text('Água parada?'),
                selected: isSelectedAgua,
                selectedColor: const Color.fromARGB(255, 55, 192, 59),
                backgroundColor: const Color.fromARGB(255, 179, 73, 65),
                avatar: const Icon(FeatherIcons.checkCircle),
                onSelected: (newBoolValue) {
                  setState(() {
                    isSelectedAgua = newBoolValue;
                  });
                },
              ),
              ChoiceChip(
                label: const Text('Larvas do mosquito da dengue?'),
                selected: isSelectedLarva,
                selectedColor: const Color.fromARGB(255, 55, 192, 59),
                backgroundColor: const Color.fromARGB(255, 179, 73, 65),
                avatar: const Icon(FeatherIcons.checkCircle),
                onSelected: (newBoolValue) {
                  setState(() {
                    isSelectedLarva = newBoolValue;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
