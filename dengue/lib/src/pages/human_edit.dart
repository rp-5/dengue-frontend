import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:dengue/src/model/human.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

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

  DateTime selectedDate = DateTime.now();

  TextEditingController dateControl =
      TextEditingController(text: 'Pressione para escolher a data!');

  Future<void> _pickDate(BuildContext context) async {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 320,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50)),
                  color: AppColors.white),
              child: Column(
                children: [
                  SizedBox(
                      height: 250,
                      child: CupertinoDatePicker(
                          dateOrder: DatePickerDateOrder.dmy,
                          minimumYear: 2015,
                          maximumYear: DateTime.now().year,
                          initialDateTime: _humanRegisterController.getDate(),
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (selectedDate) {
                            setState(() => {
                                  this.selectedDate = selectedDate,
                                  dateControl.text =
                                      '${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}',
                                    _humanRegisterController.setDate(selectedDate)
                                });
                            
                          })),
                  // Close the modal
                  CupertinoButton(
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        FeatherIcons.arrowRight,
                        size: 30,
                        color: AppColors.green,
                      ),
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ));
  }

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
              if (formKey.currentState!.validate()) {
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
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 5),
                TextFormField(
                  initialValue: widget.human.name,
                  decoration:
                      const InputDecoration(labelText: 'Nome completo*'),
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
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.human.age.toString(),
                  decoration: const InputDecoration(labelText: 'Idade*'),
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
                const SizedBox(
                  height: 10,
                ),
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.human.complement,
                  decoration: const InputDecoration(labelText: 'Complemento'),
                  onChanged: (value) =>
                      _humanRegisterController.setComplement(value),
                ),
                Row(
                  children: const [
                    Text(
                      'Sintomas:',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getFebre(),
                      onChanged: (bool? value) {
                        setState(() {
                          febre = value!;
                          _humanRegisterController.setFebre(febre);
                        });
                      },
                    ),
                    const Text("Febre Alta"),
                    const SizedBox(
                      width: 62,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getManchas(),
                      onChanged: (bool? value) {
                        setState(() {
                          manchas = value!;
                          _humanRegisterController.setManchas(manchas);
                        });
                      },
                    ),
                    const Text("Manchas Vermelhas"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getDorCabeca(),
                      onChanged: (bool? value) {
                        setState(() {
                          dorCab = value!;
                          _humanRegisterController.setdorCabeca(dorCab);
                        });
                      },
                    ),
                    const Text("Dor de cabeça"),
                    const SizedBox(
                      width: 36.5,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getNausea(),
                      onChanged: (bool? value) {
                        setState(() {
                          nausea = value!;
                          _humanRegisterController.setNausea(nausea);
                        });
                      },
                    ),
                    const Text("Nausea"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getDorOlhos(),
                      onChanged: (bool? value) {
                        setState(() {
                          dorOlhos = value!;
                          _humanRegisterController.setDorOlhos(dorOlhos);
                        });
                      },
                    ),
                    const Text("Dor atrás dos olhos"),
                    const SizedBox(
                      width: 5,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getDorCorpo(),
                      onChanged: (bool? value) {
                        setState(() {
                          dorCorpo = value!;
                          _humanRegisterController.setDorCorpo(dorCorpo);
                        });
                      },
                    ),
                    const Text("Dor no corpo"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: _humanRegisterController.getCansaco(),
                      onChanged: (bool? value) {
                        setState(() {
                          cansaco = value!;
                          _humanRegisterController.setCansaco(cansaco);
                        });
                      },
                    ),
                    const Text("Cansaço extremo"),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      'Gravidade:',
                      style: TextStyle(fontSize: 16),
                    ),
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
                    const Text(
                      'Status:',
                      style: TextStyle(fontSize: 16),
                    ),
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
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        controller: dateControl,
                        readOnly: true,
                        onTap: () => _pickDate(context),
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Data ( dd/mm/aaaa )"),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          await _humanRegisterController.editHumanCase(
                              widget.human.id, context);
                        }
                      },
                      style: TextButton.styleFrom(
                          minimumSize: const Size(95, 43),
                          primary: AppColors.white,
                          backgroundColor: AppColors.green,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          textStyle: const TextStyle(fontSize: 18)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Text("Salvar"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(FeatherIcons.arrowRight),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
