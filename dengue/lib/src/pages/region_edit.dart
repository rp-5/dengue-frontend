import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/region_register_controller.dart';
import 'package:dengue/src/model/region.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegionEdit extends StatefulWidget {
  @override
  RegionEditState createState() => RegionEditState();
  const RegionEdit({Key? key, required this.region}) : super(key: key);

  final Region region;
}

class RegionEditState extends State<RegionEdit> {
  final RegionRegisterController _regionRegisterController =
      RegionRegisterController();

  List<String> santading_water = <String>['Sim', 'Não'];
  String dropdownWater = 'Não';

  List<String> mosquito_larva = <String>['Sim', 'Não'];
  String dropdownMosquito = 'Não';

  bool isSelectedAgua = false;
  bool isSelectedLarva = false;

  @override
  void initState() {
    _regionRegisterController.setAddress(widget.region.address);
    _regionRegisterController.setDistrict(widget.region.district);
    _regionRegisterController.setCity(widget.region.city);
    _regionRegisterController.setSantandingWater(widget.region.santading_water);
    _regionRegisterController.setMosquitoLarva(widget.region.mosquito_larva);
    super.initState();
  }

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
        backgroundColor: AppColors.secondary,
        actions: [
          IconButton(
            icon: const Icon(FeatherIcons.save),
            onPressed: () async {
              await _regionRegisterController.editRegionCase(
                  widget.region.id, context);
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
                initialValue: widget.region.address,
                onChanged: (value) =>
                    _regionRegisterController.setAddress(value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Bairro*'),
                initialValue: widget.region.district,
                onChanged: (value) =>
                    _regionRegisterController.setDistrict(value),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Cidade*'),
                initialValue: widget.region.city,
                onChanged: (value) => _regionRegisterController.setCity(value),
              ),
              Text('Água parada?'),
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
              Text('Mosquito da Dengue?'),
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
              ),
              // Row(
              //   children: [
              //     const Text('Água parada '),
              //     Checkbox(
              //       fillColor: MaterialStateProperty.resolveWith(getColor),
              //       value: isSelectedAgua,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           _regionRegisterController.setSantandingWater(value!);
              //         });

              //       },
              //     ),
              //   ],
              // ),
              // Row(
              //   children: [
              //     const Text('Larva de Mosquito da Dengue '),
              //     Checkbox(
              //       fillColor: MaterialStateProperty.resolveWith(getColor),
              //       value: isSelectedLarva,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           _regionRegisterController.setMosquitoLarva(value!);
              //         });
              //       },
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
