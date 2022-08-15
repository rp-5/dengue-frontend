import 'dart:convert';

import 'package:dengue/src/model/region.dart';
import 'package:dengue/src/pages/region_cases.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegionRegisterController {
  String _address = '';
  String _city = '';
  String _district = '';
  String _mosquitoLarva = '';
  String _santadingWater = '';
  DateTime _date = DateTime.now();

  void setAddress(String address) => _address = address;
  void setCity(String city) => _city = city;
  void setDistrict(String district) => _district = district;
  void setMosquitoLarva(String mosquitoLarva) => _mosquitoLarva = mosquitoLarva;
  void setSantandingWater(String santadingWater) =>
      _santadingWater = santadingWater;
  void setDate(DateTime date) => _date = date;

  String getAddress() => _address;
  String getCity() => _city;
  String getDistrict() => _district;
  String getMosquitoLarva() => _mosquitoLarva;
  String getSantandingWater() => _santadingWater;
  DateTime getDate() => _date;

  static const addr = 'http://192.168.1.10:8081';

  //List region registers
  Future<List<Region>> fetchRegionList() async {
    final response = await http.get(Uri.parse('$addr/list/region'));
    if (response.statusCode == 200) {
      List regionResponse = jsonDecode(response.body);

      return regionResponse.map((region) => Region.fromJson(region)).toList();
    } else {
      throw Exception('Failed to load Region');
    }
  }

  // Create Region Register
  Future createRegionCases(context) async {
    print(_date);
    try {
      var response = await http.post(
        Uri.parse('$addr/form/region/save'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: jsonEncode(<String, dynamic>{
          'address': _address,
          'city': _city,
          'district': _district,
          'mosquito_larva': _mosquitoLarva,
          'santading_water': _santadingWater,
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

  //Edit de Regions
  Future editRegionCase(regionIdToEdit, context) async {
    try {
      var response = await http.put(
        Uri.parse('$addr/edit/region/$regionIdToEdit'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'id': regionIdToEdit,
          'address': _address,
          'district': _district,
          'city': _city,
          'mosquito_larva': _mosquitoLarva,
          'santading_water': _santadingWater,
          'date': _date.toIso8601String()
        }),
      );

      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RegionCases(),
          ),
        );
      }
    } catch (e) {
      const AlertDialog();
    }
  }

//Delete Region
  Future deleteRegionCase(regionIdToDelete, context) async {
    final response =
        await http.delete(Uri.parse('$addr/delete/region/$regionIdToDelete'));

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
