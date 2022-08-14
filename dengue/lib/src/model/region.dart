import 'dart:convert';

class Region {
  final int id;
  final String address;
  final String district;
  final String city;
  final String mosquitoLarva;
  final String santadingWater;
  final String date;

  const Region({
    required this.id,
    required this.address,
    required this.district,
    required this.city,
    required this.mosquitoLarva,
    required this.santadingWater,
    required this.date
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      address: json['address'],
      district: json['district'],
      city: json['city'],
      mosquitoLarva: json['mosquito_larva'],
      santadingWater: json['santading_water'],
      date: json['date']
    );
  }

  static List<Region> fromArray(List<dynamic> list) =>
      list.map((e) => Region.fromJson(e)).toList();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "address": address,
      "district": district,
      "city": city,
      "mosquito_larva": mosquitoLarva,
      "santading_water": santadingWater,
      "date": date
    };
  }

  String toJson() => json.encode(toMap());
}
