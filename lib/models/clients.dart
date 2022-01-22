class Clients{
  final int? id;
  final String name;
  final String address;
  final String city;
  final String phone;
  final String email;
  final String remarks;

  Clients({
    this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.phone,
    required this.email,
    required this.remarks,
  });

  //convert data to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'phone': phone,
      'email': email,
      'remarks': remarks,
    };
  }

  //convert from map
  factory Clients.fromMap(Map<String, dynamic> map) {
    return Clients(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      address: map['address'] ?? '',
      city: map['city'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      remarks: map['remarks'] ?? '',
    );
  }

  // Implement toString to make it easier to see information about
  // each breed when using the print statement.
  @override
  String toString() => 'Clients(id: $id, name: $name,address:$address, city:$city, phone:$phone, email:$email, remarks:$remarks)';
}
