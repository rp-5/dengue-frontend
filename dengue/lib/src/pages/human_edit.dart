import 'package:dengue/core/theme/app_colors.dart';
import 'package:dengue/src/controllers/human_register_controller.dart';
import 'package:dengue/src/model/human.dart';
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
    _humanRegisterController.setName(widget.human.name);
    _humanRegisterController.setAge(widget.human.age.toString());
    _humanRegisterController.setAddress(widget.human.address);
    _humanRegisterController.setComplement(widget.human.complement ?? '');
    // _humanRegisterController.setSymptom(widget.human.symptom);
    _humanRegisterController.setGravity(widget.human.gravity);
    _humanRegisterController.setStatus(widget.human.status);
    _humanRegisterController.setFebre(widget.human.febre);
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
              await _humanRegisterController.editHumanCase(
                  widget.human.id, context);
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
                initialValue: widget.human.name,
                decoration: InputDecoration(labelText: 'Nome'),
                onChanged: (value) => _humanRegisterController.setName(value),
              ),
              TextFormField(
                  initialValue: widget.human.age.toString(),
                  decoration: InputDecoration(labelText: 'Idade'),
                  onChanged: (value) => _humanRegisterController.setAge(value),
                  keyboardType: TextInputType.number),
              TextFormField(
                initialValue: widget.human.address,
                decoration: const InputDecoration(labelText: 'Endereço'),
                onChanged: (value) =>
                    _humanRegisterController.setAddress(value),
              ),
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
                      value: this.febre,  
                      onChanged: (bool? value) {  
                        setState(() {  
                          this.febre = value!;
                          _humanRegisterController.setFebre(febre);  
                        });
                      },  
                  ),
                  Text("Manchas Vermelhas"),
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
                  Text("Dor de cabeça"),
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
                   Text("Nausea"),
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
                ],
              ),
              Row(
                children: [
                   Text("Dor atrás dos olhos"),
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
                   Text("Dor no corpo"),
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
                   Text("Cansaço extremo"),
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
    );
  }
}
