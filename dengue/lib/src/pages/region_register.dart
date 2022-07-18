import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/region_register_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegionRegister extends StatefulWidget {
  @override
  RegionRegisterState createState() => RegionRegisterState();
  const RegionRegister({Key? key}) : super(key: key);
}

class RegionRegisterState extends State<RegionRegister> {
  final RegionRegisterController _regionRegisterController =
      RegionRegisterController();

  List<String> santading_water = <String>['Sim', 'Nao'];
  String dropdownWater = 'Nao';

  List<String> mosquito_larva = <String>['Sim', 'Nao'];
  String dropdownMosquito = 'Nao';

@override
void initState() {
    _regionRegisterController.setSantandingWater('Nao');
    _regionRegisterController.setMosquitoLarva('Nao');
    super.initState();
  }
  

  // String isSelectedAgua = 'false';
  // String isSelectedLarva = 'false';

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
        title: const Text('Registro de Infestação no Município'),
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () {
              _regionRegisterController.createRegionCases(context);
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
                decoration: InputDecoration(labelText: 'Endereço*'),
                onChanged: (value) =>
                    _regionRegisterController.setAddress(value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Bairro*'),
                onChanged: (value) =>
                    _regionRegisterController.setDistrict(value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cidade*'),
                onChanged: (value) => _regionRegisterController.setCity(value),
              ),
              // Row(
              //   children: [
              //     const Text('Água parada '),
              //     Checkbox(
              //       checkColor: Colors.white,
              //       fillColor: MaterialStateProperty.resolveWith(getColor),
              //       value: isSelectedAgua,
              //       onChanged: (String? value) {
              //         setState(() {
              //           isSelectedAgua = value!;
              //         });
              //         _regionRegisterController.setSantandingWater(value!);
              //       },
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     const Text('Larva de Mosquito da Dengue '),
              //     Checkbox(
              //       checkColor: Colors.white,
              //       fillColor: MaterialStateProperty.resolveWith(getColor),
              //       value: isSelectedLarva,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           isSelectedLarva = value!;
              //         });
              //         _regionRegisterController.setMosquitoLarva(value!);
              //       },
              //     ),
              //   ],
              // ),
              Row(
                children: [
                  const Text('Água parada?'),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton(
                    value: dropdownWater,
                    items: santading_water.map<DropdownMenuItem<String>>(
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
                    items: santading_water.map<DropdownMenuItem<String>>(
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
            ],
          ),
        ),
      ),
    );
  }
}
