import 'dart:convert';

class Human {
  final int id;
  final String name;
  final int age;
  final String address;
  final String? complement;
  // final String symptom;
  final String gravity;
  final String status;
  final bool febre;
  final bool manchas;
  final bool dorCabeca;
  final bool nausea;
  final bool dorOlhos;
  final bool dorCorpo;
  final bool cansaco;

  const Human(
      {required this.id,
      required this.name,
      required this.age,
      required this.address,
      this.complement,
      // required this.symptom,
      required this.gravity,
      required this.status,
      required this.febre,
      required this.manchas,
      required this.dorCabeca,
      required this.nausea,
      required this.dorOlhos,
      required this.dorCorpo,
      required this.cansaco});

  factory Human.fromJson(Map<String, dynamic> json) {
    return Human(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        address: json['adress'],
        complement: json['complement'],
        // symptom: json['symptom'],
        gravity: json['gravity'],
        status: json['status'],
        febre: json['febre'],
        manchas: json['manchas'],
        dorCabeca: json['dorCabeca'],
        nausea: json['nausea'],
        dorOlhos: json['dorOlhos'],
        dorCorpo: json['dorCorpo'],
        cansaco: json['cansaco']);
  }

  static List<Human> fromArray(List<dynamic> list) =>
      list.map((e) => Human.fromJson(e)).toList();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "age": age,
      "adress": address,
      "complement": complement,
      // "symptom": symptom,
      "gravity": gravity,
      "status": status,
      "febre": febre,
      "manchas": manchas,
      "dorCabeca": dorCabeca,
      "nausea": nausea,
      "dorOlhos": dorOlhos,
      "dorCorpo": dorCorpo,
      "cansaco": cansaco
    };
  }

  String toJson() => json.encode(toMap());
}
