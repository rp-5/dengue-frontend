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

  Future<void> _pickDate(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (context) {
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
          return CupertinoDatePicker(
              minimumYear: 2015,
              maximumYear: DateTime.now().year,
              initialDateTime: selectedDate,
              mode: CupertinoDatePickerMode.date,
              onDateTimeChanged: (selectedDate) {
                setState(() => this.selectedDate = selectedDate);
              });
        });
      },
    );
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
                SizedBox(
                  height: 5,
                ),
                TextFormField(
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  decoration: InputDecoration(
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
                SizedBox(
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
                SizedBox(
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
                  children: [
                    const Text(
                      'Sintomas:',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.febre,
                      onChanged: (bool? value) {
                        setState(() {
                          this.febre = value!;
                          _humanRegisterController.setFebre(febre);
                        });
                      },
                    ),
                    Text("Febre Alta"),
                    SizedBox(
                      width: 26,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.manchas,
                      onChanged: (bool? value) {
                        setState(() {
                          this.manchas = value!;
                          _humanRegisterController.setManchas(manchas);
                        });
                      },
                    ),
                    Text("Manchas Vermelhas"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.dorCab,
                      onChanged: (bool? value) {
                        setState(() {
                          this.dorCab = value!;
                          _humanRegisterController.setdorCabeca(dorCab);
                        });
                      },
                    ),
                    Text("Dor de cabeça"),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.nausea,
                      onChanged: (bool? value) {
                        setState(() {
                          this.nausea = value!;
                          _humanRegisterController.setNausea(nausea);
                        });
                      },
                    ),
                    Text("Náusea"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.dorOlhos,
                      onChanged: (bool? value) {
                        setState(() {
                          this.dorOlhos = value!;
                          _humanRegisterController.setDorOlhos(dorOlhos);
                        });
                      },
                    ),
                    Text("Dor atrás dos\n olhos"),
                    SizedBox(
                      width: 7,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.dorCorpo,
                      onChanged: (bool? value) {
                        setState(() {
                          this.dorCorpo = value!;
                          _humanRegisterController.setDorCorpo(dorCorpo);
                        });
                      },
                    ),
                    Text("Dor no corpo"),
                  ],
                ),
                Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: this.cansaco,
                      onChanged: (bool? value) {
                        setState(() {
                          this.cansaco = value!;
                          _humanRegisterController.setCansaco(cansaco);
                        });
                      },
                    ),
                    Text("Cansaço extremo"),
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: TextField(
                        readOnly: true,
                        onTap: () => _pickDate(context),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "${selectedDate.toLocal()}".split(' ')[0],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Registrar"),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(FeatherIcons.arrowRight),
                        ],
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          _humanRegisterController.createHumanCases(context);
                        }
                      },
                      style: TextButton.styleFrom(
                          minimumSize: Size(95, 43),
                          primary: AppColors.white,
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          textStyle: TextStyle(fontSize: 18)),
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
