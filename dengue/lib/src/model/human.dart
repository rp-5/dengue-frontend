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
}