import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HumanEdit extends StatefulWidget {
  @override
  HumanEditState createState() => HumanEditState();
  const HumanEdit({Key? key}) : super(key: key);
}

class HumanEditState extends State<HumanEdit> {
  List<String> sintomas = <String>['Tosse', 'Febre'];
  String dropdownSintoma = 'Tosse';

  List<String> gravidade = <String>['Baixa', 'Média', 'Alta'];
  String dropdownGravidade = 'Baixa';

  List<String> status = <String>[
    'Sem Suspeita',
    'Suspeito',
    'Confirmado',
    'Descartado'
  ];
  String dropdownStatus = 'Sem Suspeita';

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição do Registro de Caso em Humano'),
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
                decoration: const InputDecoration(labelText: 'Nome*'),
              ),
              const TextField(
                  decoration: InputDecoration(labelText: 'Idade*'),
                  keyboardType: TextInputType.number),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Endereço*'),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Complemento'),
              ),
              DropdownButton(
                value: dropdownSintoma,
                items: sintomas.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownSintoma = newValue!;
                  });
                },
              ),
              DropdownButton(
                value: dropdownGravidade,
                items: gravidade.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownGravidade = newValue!;
                  });
                },
              ),
              DropdownButton(
                value: dropdownStatus,
                items: status.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  },
                ).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownStatus = newValue!;
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
