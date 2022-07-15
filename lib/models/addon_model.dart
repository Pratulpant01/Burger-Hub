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

  @override
  String toString() =>
      'AddOnModel(addonName: $addonName, price: $price, id: $id)';
}
