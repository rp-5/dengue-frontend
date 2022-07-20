import 'dart:developer';

import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:dengue/src/model/human.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter/foundation.dart';

class HumanEdit extends StatefulWidget {
  @override
  HumanEditState createState() => HumanEditState();
  const HumanEdit({Key? key, required this.human}) : super(key: key);

  final Human human;
}

class HumanEditState extends State<HumanEdit> {
  final HumanRegisterController _humanRegisterController =
      HumanRegisterController();

  final formKey = GlobalKey<FormState>();
  // List<String> sintomas = <String>['Tosse', 'Febre'];
  // String dropdownSintoma = 'Tosse';

  List<String> gravidade = <String>['Baixa', 'Media', 'Alta'];
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
    _humanRegisterController.setName(widget.human.name);
    _humanRegisterController.setAge(widget.human.age.toString());
    _humanRegisterController.setAddress(widget.human.address);
    _humanRegisterController.setComplement(widget.human.complement ?? '');
    // _humanRegisterController.setSymptom(widget.human.symptom);
    _humanRegisterController.setGravity(widget.human.gravity);
    _humanRegisterController.setStatus(widget.human.status);
    _humanRegisterController.setFebre(widget.human.febre);
    _humanRegisterController.setManchas(widget.human.manchas);
    _humanRegisterController.setdorCabeca(widget.human.dorCabeca);
    _humanRegisterController.setNausea(widget.human.nausea);
    _humanRegisterController.setDorOlhos(widget.human.dorOlhos);
    _humanRegisterController.setDorCorpo(widget.human.dorCorpo);
    _humanRegisterController.setCansaco(widget.human.cansaco);
    super.initState();
  }
 

  bool febre = false;
  bool manchas = false;
  bool dorCab = false;
  bool nausea = false;
  bool dorOlhos = false;
  bool dorCorpo = false;
  bool cansaco = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edição do Registro de Caso em Humano'),
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () async {
              if(formKey.currentState!.validate()){
              await _humanRegisterController.editHumanCase(
                  widget.human.id, context);
              }
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child:SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 5),
              TextFormField(
                initialValue: widget.human.name,
                decoration: InputDecoration(labelText: 'Nome completo*'),
                onChanged: (value) => _humanRegisterController.setName(value),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "Escreva o nome corretamente.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10),
              TextFormField(   
                initialValue: widget.human.age.toString(),
                decoration: InputDecoration(labelText: 'Idade*'),
                onChanged: (value) => _humanRegisterController.setAge(value),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[0-9]+$').hasMatch(value)) {
                    return "Informe a idade correta.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                initialValue: widget.human.address,
                decoration: const InputDecoration(labelText: 'Endereço*'),
                onChanged: (value) =>
                    _humanRegisterController.setAddress(value),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "O Endereço não pode estar vazio.";
                  } else {
                    return null;
                  }
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                initialValue: widget.human.complement,
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
                  Text("Febre Alta"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getFebre(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.febre = value!;
                        _humanRegisterController.setFebre(febre);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Manchas Vermelhas"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getManchas(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.manchas = value!;
                        _humanRegisterController.setManchas(manchas);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Dor de cabeça"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getDorCabeca(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.dorCab = value!;
                        _humanRegisterController.setdorCabeca(dorCab);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Nausea"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getNausea(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.nausea = value!;
                        _humanRegisterController.setNausea(nausea);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Dor atrás dos olhos"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getDorOlhos(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.dorOlhos = value!;
                        _humanRegisterController.setDorOlhos(dorOlhos);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Dor no corpo"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getDorCorpo(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.dorCorpo = value!;
                        _humanRegisterController.setDorCorpo(dorCorpo);
                      });
                    },
                  ),
                ],
              ),
              Row(
                children: [
                  Text("Cansaço extremo"),
                  Checkbox(
                    checkColor: Colors.black,
                    activeColor: Colors.green,
                    value: _humanRegisterController.getCansaco(),
                    onChanged: (bool? value) {
                      setState(() {
                        this.cansaco = value!;
                        _humanRegisterController.setCansaco(cansaco);
                      });
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
                    value: _humanRegisterController.getGravity(),
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
                        _humanRegisterController.setGravity(newValue);
                      });
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
                    value: _humanRegisterController.getStatus(),
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
                        _humanRegisterController.setStatus(newValue);
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        ),
      ),
    );
  }
}
