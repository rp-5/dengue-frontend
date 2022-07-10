import 'dart:convert';

import 'package:dengue/src/model/human.dart';
import 'package:dengue/src/pages/human_cases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HumanRegisterController {
  String _name = '';
  String _age = '';
  String _address = '';
  String? _complement = '';
  String _symptom = '';
  String _gravity = '';
  String _status = '';

  void setName(String name) => _name = name;
  void setAge(String age) => _age = age;
  void setAddress(String address) => _address = address;
  void setComplement(String complement) => _complement = complement;
  void setSymptom(String symptom) => _symptom = symptom;
  void setGravity(String gravity) => _gravity = gravity;
  void setStatus(String status) => _status = status;

  String getName() => _name;
  String getAge() => _age;
  String getAddress() => _address;
  String getComplement() => _complement ?? '';
  String getSymptom() => _symptom;
  String getGravity() => _gravity;
  String getStatus() => _status;

  // List humans registers
  Future<List<Human>> fetchHumanList() async {
    final response =
        await http.get(Uri.parse('http://192.168.1.11:8080/list/human'));
    if (response.statusCode == 200) {
      List humanResponse = jsonDecode(response.body);

      return humanResponse.map((human) => Human.fromJson(human)).toList();
    } else {
      throw Exception('Failed to load Human');
    }
  }

  // Create human Registers
  Future createHumanCases(context) async {
    try {
      var response = await http.post(
        Uri.parse('http://192.168.1.11:8080/form/save'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'name': _name,
          'age': int.parse(_age),
          'adress': _address,
          'complement': _complement,
          'symptom': _symptom,
          'gravity': _gravity,
          'status': _status
        }),
      );
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HumanCases(),
          ),
        );
      }
      // else{
      //   const AlertDialog("Registro inválido");
      // }
    } catch (e) {
      print(e);
    }
  }

  Future editHumanCase(humanIdToEdit, context) async {
    try {
      var response = await http.put(
        Uri.parse('http://192.168.1.11:8080/edit/human/$humanIdToEdit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': humanIdToEdit,
          'name': _name,
          'age': int.parse(_age),
          'adress': _address,
          'complement': _complement,
          'symptom': _symptom,
          'gravity': _gravity,
          'status': _status
        }),
      );

      print(response.body);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const HumanCases(),
          ),
        );
      }
      // else{
      //   const AlertDialog("Registro inválido");
      // }
    } catch (e) {
      print(e);
    }
  }

  // Delete human case
  Future deleteHumanCase(humanIdToDelete, context) async {
    final response = await http.delete(
        Uri.parse('http://192.168.1.11:8080/delete/human/$humanIdToDelete'));

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const HumanCases(),
        ),
      );
    } else {
      throw Exception('Failed to load Human');
    }
  }
}
