import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter/cupertino.dart';

class HumanRegister extends StatefulWidget {
  @override
  HumanRegisterState createState() => HumanRegisterState();
  const HumanRegister({Key? key}) : super(key: key);
}

class HumanRegisterState extends State<HumanRegister> {
  final HumanRegisterController _humanRegisterController =
      HumanRegisterController();

  final formKey = GlobalKey<FormState>();

  List<String> sintomas = <String>['Tosse', 'Febre'];
  String dropdownSintoma = 'Tosse';

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
    _humanRegisterController.setGravity("Baixa");
    _humanRegisterController.setStatus("Sem Suspeita");
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
                          initialDateTime: selectedDate,
                          mode: CupertinoDatePickerMode.date,
                          onDateTimeChanged: (selectedDate) {
                            setState(() => {
                                  this.selectedDate = selectedDate,
                                  dateControl.text =
                                      '${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}'
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
        title: const Text('Registro de Caso em Humano'),
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
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
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Idade*',
                  ),
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
                  decoration: const InputDecoration(labelText: 'Complemento'),
                  onChanged: (value) =>
                      _humanRegisterController.setComplement(value),
                ),
                const SizedBox(
                  height: 20,
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
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: febre,
                      onChanged: (bool? value) {
                        setState(() {
                          febre = value!;
                          _humanRegisterController.setFebre(febre);
                        });
                      },
                    ),
                    const Text("Febre Alta"),
                    const SizedBox(
                      width: 26,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: manchas,
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
                      value: dorCab,
                      onChanged: (bool? value) {
                        setState(() {
                          dorCab = value!;
                          _humanRegisterController.setdorCabeca(dorCab);
                        });
                      },
                    ),
                    const Text("Dor de cabeça"),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: nausea,
                      onChanged: (bool? value) {
                        setState(() {
                          nausea = value!;
                          _humanRegisterController.setNausea(nausea);
                        });
                      },
                    ),
                    const Text("Náusea"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: dorOlhos,
                      onChanged: (bool? value) {
                        setState(() {
                          dorOlhos = value!;
                          _humanRegisterController.setDorOlhos(dorOlhos);
                        });
                      },
                    ),
                    const Text("Dor atrás dos\n olhos"),
                    const SizedBox(
                      width: 7,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: dorCorpo,
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
                      value: cansaco,
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
                    const Text(
                      'Status:',
                      style: TextStyle(fontSize: 16),
                    ),
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
                const SizedBox(
                  height: 10,
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
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _humanRegisterController.createHumanCases(context);
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
                          Text("Registrar"),
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
