import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/region_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter/cupertino.dart';

class RegionRegister extends StatefulWidget {
  @override
  RegionRegisterState createState() => RegionRegisterState();
  const RegionRegister({Key? key}) : super(key: key);
}

class RegionRegisterState extends State<RegionRegister> {
  final RegionRegisterController _regionRegisterController =
      RegionRegisterController();

  final formKey = GlobalKey<FormState>();

  List<String> santadingWater = <String>['Sim', 'Nao'];
  String dropdownWater = 'Nao';

  List<String> mosquitoLarva = <String>['Sim', 'Nao'];
  String dropdownMosquito = 'Nao';

  @override
  void initState() {
    _regionRegisterController.setSantandingWater('Nao');
    _regionRegisterController.setMosquitoLarva('Nao');
    super.initState();
  }

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
        title: const Text('Registro de Infestação no Município'),
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
                  decoration: const InputDecoration(labelText: 'Endereço*'),
                  onChanged: (value) =>
                      _regionRegisterController.setAddress(value),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "O endereço não pode estar vazio.";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Bairro*'),
                  onChanged: (value) =>
                      _regionRegisterController.setDistrict(value),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Escreva bairro corretamente.";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Cidade*'),
                  onChanged: (value) =>
                      _regionRegisterController.setCity(value),
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                      return "Escreva a cidade corretamente.";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Text('Água parada?'),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton(
                      value: dropdownWater,
                      items: santadingWater.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownWater = value!;
                        });
                        _regionRegisterController.setSantandingWater(value!);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Mosquito da Dengue?'),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton(
                      value: dropdownMosquito,
                      items: santadingWater.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropdownMosquito = value!;
                        });
                        _regionRegisterController.setMosquitoLarva(value!);
                      },
                    )
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
                          _regionRegisterController.createRegionCases(context);
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
