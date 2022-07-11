import 'dart:convert';

class Region{
  final int id;
  final String address;
  final String district;
  final String city;
  final String mosquito_larva;
  final String santading_water;
  


  const Region({
    required this.id,
    required this.address,
    required this.district,
    required this.city,
    required this.mosquito_larva,
    required this.santading_water,
    
  });

  factory Region.fromJson(Map<String, dynamic> json){
    return Region(
      id: json['id'],
      address: json['address'],
      district: json['district'],
      city: json['city'],
      mosquito_larva: json['mosquito_larva'],
      santading_water: json['santading_water'],
    );
  }

  static List<Region> fromArray(List<dynamic> list) => list.map((e) => Region.fromJson(e)).toList();

  Map<String, dynamic> toMap(){
    return{
      "id": id,
      "address": address,
      "district": district,
      "city": city,
      "mosquito_larva": mosquito_larva,
      "santading_water": santading_water,
    };
  }

  String toJson() => json.encode(toMap());
}