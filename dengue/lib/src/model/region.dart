class Region{
  final int id;
  final String address;
  final String district;
  final String city;
  final bool standingWater;
  final bool mosquitoLarva;


  const Region({
    required this.id,
    required this.address,
    required this.district,
    required this.city,
    required this.standingWater,
    required this.mosquitoLarva
  });
}