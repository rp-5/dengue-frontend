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
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Colors.black;
    }

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
              Row(
                children: [
                  const Text('Água parada '),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isSelectedAgua,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelectedAgua = value!;
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Larva de Mosquito da Dengue '),
                  Checkbox(
                    fillColor: MaterialStateProperty.resolveWith(getColor),
                    value: isSelectedLarva,
                    onChanged: (bool? value) {
                      setState(() {
                        isSelectedLarva = value!;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
