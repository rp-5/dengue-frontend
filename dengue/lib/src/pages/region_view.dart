import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/region_register_controller.dart';
import 'package:dengue/src/model/region.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

class RegionView extends StatefulWidget {
  @override
  RegionViewState createState() => RegionViewState();
  const RegionView({Key? key, required this.region}) : super(key: key);

  final Region region;
}

class RegionViewState extends State<RegionView> {
  final RegionRegisterController _regionRegisterController =
      RegionRegisterController();

  final formKey = GlobalKey<FormState>();

  List<String> santadingWater = <String>['Sim', 'Nao'];
  String dropdownWater = 'Nao';

  List<String> mosquitoLarva = <String>['Sim', 'Nao'];
  String dropdownMosquito = 'Nao';

  bool isSelectedAgua = false;
  bool isSelectedLarva = false;

  @override
  void initState() {
    _regionRegisterController.setAddress(widget.region.address);
    _regionRegisterController.setDistrict(widget.region.district);
    _regionRegisterController.setCity(widget.region.city);
    _regionRegisterController.setSantandingWater(widget.region.santadingWater);
    _regionRegisterController.setMosquitoLarva(widget.region.mosquitoLarva);
    _regionRegisterController.setDate(DateTime.parse(widget.region.date));
    super.initState();
  }

   DateTime selectedDate = DateTime.now();

  TextEditingController dateControl =
      TextEditingController(text: "Data");

  Future<void> _pickDate(BuildContext context) async {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: getBody());
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visualização da infestação'),
        backgroundColor: AppColors.secondary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10),
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(labelText: 'Endereço*'),
                  initialValue: widget.region.address,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(labelText: 'Bairro*'),
                  initialValue: widget.region.district,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  enabled: false,
                  decoration: const InputDecoration(labelText: 'Cidade*'),
                  initialValue: widget.region.city,
                ),
                Row(
                  children: [
                    const Text('Água parada?'),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton(
                      value: _regionRegisterController.getSantandingWater(),
                      items: santadingWater.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: null,
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
                      value: _regionRegisterController.getMosquitoLarva(),
                      items: mosquitoLarva.map<DropdownMenuItem<String>>(
                        (String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        },
                      ).toList(),
                      onChanged: null,
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
      ),
    );
  }
}
