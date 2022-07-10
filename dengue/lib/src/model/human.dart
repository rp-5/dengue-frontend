import 'dart:convert';

class Human{
  final int id;
  final String name;
  final int age;
  final String address;
  final String? complement;
  final String symptom;
  final String gravity;
  final String status;
  

  const Human({
    required this.id,
    required this.name,
    required this.age,
    required this.address,
    this.complement,
    required this.symptom,
    required this.gravity,
    required this.status
});

factory Human.fromJson(Map<String, dynamic> json) {
    return Human(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      address: json['adress'],
      complement: json['complement'],
      symptom: json['symptom'],
      gravity: json['gravity'],
      status: json['status'],
    );
  }

  static List<Human> fromArray(List<dynamic> list) => list.map((e) => Human.fromJson(e)).toList();

  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "name": name,
      "age": age,
      "adress": address,
      "complement": complement,
      "symptom": symptom,
      "gravity": gravity,
      "status": status
    };
  }

  String toJson() => json.encode(toMap());
}