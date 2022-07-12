import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class HumanRegister extends StatefulWidget {
  @override
  HumanRegisterState createState() => HumanRegisterState();
  const HumanRegister({Key? key}) : super(key: key);
}

class HumanRegisterState extends State<HumanRegister> {
  final HumanRegisterController _humanRegisterController =
      HumanRegisterController();

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
  void initState() {
    _humanRegisterController.setSymptom("Tosse");
    _humanRegisterController.setGravity("Baixa");
    _humanRegisterController.setStatus("Sem suspeita");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Caso em Humano'),
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () {
              _humanRegisterController.createHumanCases(context);
            },
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
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (value) => _humanRegisterController.setName(value),
              ),
              TextField(
                  decoration: InputDecoration(labelText: 'Idade'),
                  onChanged: (value) => _humanRegisterController.setAge(value),
                  keyboardType: TextInputType.number),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Endereço'),
                onChanged: (value) =>
                    _humanRegisterController.setAddress(value),
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Complemento'),
                onChanged: (value) =>
                    _humanRegisterController.setComplement(value),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Text('Sintomas:'),
                  const SizedBox(
                    width: 10,
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
                    onChanged: (String? value) {
                      setState(() {
                        dropdownSintoma = value!;
                      });
                      _humanRegisterController.setSymptom(value!);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Gravidade:'),
                  const SizedBox(
                    width: 10,
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
                      _humanRegisterController.setGravity(newValue!);
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Status:'),
                  const SizedBox(
                    width: 10,
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
                      _humanRegisterController.setStatus(newValue!);
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
