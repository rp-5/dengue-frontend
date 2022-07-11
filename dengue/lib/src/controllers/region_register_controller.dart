import 'dart:convert';

import 'package:dengue/src/model/region.dart';
import 'package:dengue/src/pages/region_cases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegionRegisterController{
  String _address = '';
  String _city = '';
  String _district = '';
  String _mosquito_larva = '';
  String _santading_water = '';

  void setAddress(String address) => _address = address;
  void setCity(String city) => _city = city;
  void setDistrict(String district) => _district = district;
  void setMosquitoLarva(String mosquito_larva) => _mosquito_larva = mosquito_larva;
  void setSantandingWater(String santading_water) => _santading_water = santading_water;
  
  String getAddress() => _address;
  String getCity() => _city;
  String getDistrict() => _district;
  String getMosquitoLarva() => _mosquito_larva;
  String getSantandingWater() => _santading_water;

  //List region registers
  Future<List<Region>> fetchRegionList() async{

    final response = await http.get(Uri.parse('http://192.168.1.11:8080/list/region'));
    if(response.statusCode == 200){
      List regionResponse = jsonDecode(response.body);

      return regionResponse.map((region) => Region.fromJson(region)).toList();
    }else{
      throw Exception('Failed to load Region');
    }
  }

  // Create Region Register
  Future createRegionCases(context) async{
    try{
      var response = await http.post(
      Uri.parse('http://192.168.1.11:8080/form/region/save'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        "Accept": "application/json",
        "Access-Control_Allow_Origin": "*"
      },
      body: jsonEncode(<String, dynamic>{
        'address': _address,
        'city': _city,
        'district': _district,
        'mosquito_larva': _mosquito_larva,
        'santading_water': _santading_water,
      }),
      
      );
      print(response.body);
      if(response.statusCode == 200){
        // Navigator.pop(context);
      }
    }catch(e){
      print(e);
    }
  }

  // Navigator.push

  // context,
  //         MaterialPageRoute(
  //           builder: (context) => const RegionCases(),
  //         ),

  //Edit de Regions

  Future editRegionCase(regionIdToEdit, context) async {
    try {
      var response = await http.put(
        Uri.parse('http://192.168.1.11:8080/edit/region/$regionIdToEdit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': regionIdToEdit,
          'address': _address,
          'district': _district,
          'city': _city,
          'mosquito_larva': _mosquito_larva,
          'santading_water': _santading_water
        }),
      );

      print(response.body);

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegionCases(),
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

//Delete Region

Future deleteRegionCase(regionIdToDelete, context) async {
    final response = await http.delete(
        Uri.parse('http://192.168.1.11:8080/delete/region/$regionIdToDelete'));

    if (response.statusCode == 200) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RegionCases(),
        ),
      );
    } else {
      throw Exception('Failed to load Region');
    }
  }
}