import 'dart:ffi';

class Data {
  int id;
  String name;
  String phone;
  String image;
  double rating;
  Data({
    required this.id,
    required this.name,
    required this.phone,
    required this.image,
    this.rating = 0.0,
  });
}
