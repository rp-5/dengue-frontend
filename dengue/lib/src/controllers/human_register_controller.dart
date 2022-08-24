import 'dart:convert';

import 'package:dengue/src/model/human.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HumanRegisterController {
  String _name = '';
  String _age = '';
  String _address = '';
  String? _complement = '';
  String _gravity = '';
  String _status = '';
  bool _febre = false;
  bool _manchas = false;
  bool _dorCabeca = false;
  bool _nausea = false;
  bool _dorOlhos = false;
  bool _dorCorpo = false;
  bool _cansaco = false;
  DateTime _date = DateTime.now();

  void setName(String name) => _name = name;
  void setAge(String age) => _age = age;
  void setAddress(String address) => _address = address;
  void setComplement(String complement) => _complement = complement;
  void setGravity(String gravity) => _gravity = gravity;
  void setStatus(String status) => _status = status;
  void setFebre(bool febre) => _febre = febre;
  void setManchas(bool manchas) => _manchas = manchas;
  void setdorCabeca(bool dorCabeca) => _dorCabeca = dorCabeca;
  void setNausea(bool nausea) => _nausea = nausea;
  void setDorOlhos(bool dorOlhos) => _dorOlhos = dorOlhos;
  void setDorCorpo(bool dorCorpo) => _dorCorpo = dorCorpo;
  void setCansaco(bool cansaco) => _cansaco = cansaco;
  void setDate(DateTime date) => _date = date;

  String getName() => _name;
  String getAge() => _age;
  String getAddress() => _address;
  String getComplement() => _complement ?? '';
  String getGravity() => _gravity;
  String getStatus() => _status;
  bool getFebre() => _febre;
  bool getManchas() => _manchas;
  bool getDorCabeca() => _dorCabeca;
  bool getNausea() => _nausea;
  bool getDorOlhos() => _dorOlhos;
  bool getDorCorpo() => _dorCorpo;
  bool getCansaco() => _cansaco;
  DateTime getDate() => _date;
//Seu ip aqui
  static const addr = 'http://:8080';

  // List humans registers
  Future<List<Human>> fetchHumanList() async {
    final response = await http.get(Uri.parse('$addr/list/human'));
    if (response.statusCode == 200) {
      List humanResponse = jsonDecode(response.body);

      return humanResponse.map((human) => Human.fromJson(human)).toList();
    } else {
      throw Exception('Failed to load Human');
    }
  }

  // Create human Registers
  Future createHumanCases(context) async {
    print(_date);
    try {
      var response = await http.post(
        Uri.parse('$addr/form/save'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': _name,
          'age': int.parse(_age),
          'adress': _address,
          'complement': _complement,
          'gravity': _gravity,
          'status': _status,
          'febre': _febre,
          'manchas': _manchas,
          'dorCabeca': _dorCabeca,
          'nausea': _nausea,
          'dorOlhos': _dorOlhos,
          'dorCorpo': _dorCorpo,
          'cansaco': _cansaco,
          'date': _date.toIso8601String()
        }),
      );
      if (response.statusCode == 200) {
        Navigator.pop(context);
      }
    } catch (e) {
      print(e);
      const AlertDialog();
    }
  }

  Future editHumanCase(humanIdToEdit, context) async {
    try {
      var response = await http.put(
        Uri.parse('$addr/edit/human/$humanIdToEdit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': humanIdToEdit,
          'name': _name,
          'age': int.parse(_age),
          'adress': _address,
          'complement': _complement,
          'gravity': _gravity,
          'status': _status,
          'febre': _febre,
          'manchas': _manchas,
          'dorCabeca': _dorCabeca,
          'nausea': _nausea,
          'dorOlhos': _dorOlhos,
          'dorCorpo': _dorCorpo,
          'cansaco': _cansaco,
          'date': _date.toIso8601String()
        }),
      );

      if (response.statusCode == 200) {
        Navigator.pop(context);
      }
    } catch (e) {
      const AlertDialog();
    }
  }

  // Delete human case
  Future deleteHumanCase(humanIdToDelete, context) async {
    final response =
        await http.delete(Uri.parse('$addr/delete/human/$humanIdToDelete'));

    if (response.statusCode == 200) {
      Navigator.pop(context);
    } else {
      throw Exception('Failed to load Human');
    }
  }
}
