class Contact {
  int id;
  String name;

  String phone;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
  });

  Contact.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        name = json['name'],
        phone = json['phone'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}
