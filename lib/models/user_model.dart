// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String name;
  String address;
  String phoneNumber;
  String role;
  UserModel({
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      address: json['address'],
      phoneNumber: json['phoneNumber'],
      role: json['role'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'name': name,
      'address': address,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }

  @override
  String toString() {
    return 'UserModel(name: $name, address: $address, phoneNumber: $phoneNumber, role: $role)';
  }
}
