// ignore_for_file: public_member_api_docs, sort_constructors_first
class AddOnModel {
  String addonName;
  int price;
  bool isSelected;
  AddOnModel({
    required this.addonName,
    required this.price,
    required this.isSelected,
  });

  @override
  String toString() => 'AddOnModel(addonName: $addonName, price: $price, isSelected: $isSelected)';
}
