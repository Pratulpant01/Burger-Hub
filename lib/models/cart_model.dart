// ignore_for_file: public_member_api_docs, sort_constructors_first
class CartModel {
  String productName;
  String description;
  int price;
  String productId;
  int rating;
  String time;
  List category;
  String imageUrl;
  String type;
  int quantity;
  int totalPrice;
  List addonList;
  CartModel({
    required this.productName,
    required this.description,
    required this.price,
    required this.productId,
    required this.rating,
    required this.time,
    required this.category,
    required this.imageUrl,
    required this.type,
    required this.quantity,
    required this.totalPrice,
    required this.addonList,
  });

   

  Map<String, dynamic> getJson() {
    return {
      'productName': productName,
      'description': description,
      'price': price,
      'productId': productId,
      'rating': rating,
      'time': time,
      'category': category,
      'imgUrl': imageUrl,
      'type': type,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'addonList': addonList,
    };
  }
}
