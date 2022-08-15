import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:dengue/src/model/human.dart';
import 'package:flutter/material.dart';

class HumanView extends StatefulWidget {
  @override
  HumanViewState createState() => HumanViewState();
  const HumanView({Key? key, required this.human}) : super(key: key);

  final Human human;
}

class HumanViewState extends State<HumanView> {
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
        title: const Text('Visualização de Caso em Humano'),
        backgroundColor: AppColors.secondary,
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
                  enabled: false,
                  initialValue: widget.human.name,
                  decoration:
                      const InputDecoration(labelText: 'Nome completo*'),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  initialValue: widget.human.age.toString(),
                  decoration: const InputDecoration(labelText: 'Idade*'),
                  enabled: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.human.address,
                  decoration: const InputDecoration(labelText: 'Endereço*'),
                  enabled: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  initialValue: widget.human.complement,
                  decoration: const InputDecoration(labelText: 'Complemento'),
                  enabled: false,
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
                      onChanged: null,
                    ),
                    const Text("Febre Alta"),
                    const SizedBox(
                      width: 26,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: manchas,
                      onChanged: null,
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
                      onChanged: null
                    ),
                    const Text("Dor de cabeça"),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: nausea,
                      onChanged: null
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
                      onChanged: null
                    ),
                    const Text("Dor atrás dos\n olhos"),
                    const SizedBox(
                      width: 7,
                    ),
                    Checkbox(
                      checkColor: Colors.black,
                      activeColor: Colors.green,
                      value: dorCorpo,
                      onChanged: null
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
                      onChanged: null
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
                      onChanged: null,
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('Status:', style: TextStyle(fontSize: 16)),
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
                      onChanged: null,
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
