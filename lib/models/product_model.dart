// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  String productName;
  String description;
  int price;
  String productId;
  int quantity;
  int rating;
  String time;
  List category;
  String imageUrl;
  String type;
  List addon;
  ProductModel({
    required this.productName,
    required this.description,
    required this.price,
    required this.productId,
    required this.quantity,
    required this.rating,
    required this.time,
    required this.category,
    required this.imageUrl,
    required this.type,
    required this.addon,
  });
}
