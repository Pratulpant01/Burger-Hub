// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddOnModel {
  String addonName;
  int price;
  String id;
  AddOnModel({
    required this.addonName,
    required this.price,
    required this.id,
  });

  factory AddOnModel.fromJson(Map<String, dynamic> json) {
    return AddOnModel(
      addonName: json['addonName'],
      price: json['price'],
      id: json['id'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'addonName': addonName,
      'price': price,
      'id': id,
    };
  }

  @override
  String toString() =>
      'AddOnModel(addonName: $addonName, price: $price, id: $id)';
}
