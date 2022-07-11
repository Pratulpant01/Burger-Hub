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
  ProductModel({
    required this.productName,
    required this.description,
    required this.price,
    required this.productId,
    this.quantity = 1,
    required this.rating,
    required this.time,
    required this.category,
    required this.imageUrl,
    required this.type,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productName: json['productName'],
      description: json['description'],
      price: json['price'],
      productId: json['productId'],
      rating: json['rating'],
      time: json['time'],
      category: json['category'],
      imageUrl: json['imageUrl'],
      type: json['type'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'productName': productName,
      'description': description,
      'price': price,
      'productId': productId,
      'rating': rating,
      'time': time,
      'category': category,
      'type': type,
    };
  }
}



//  List addon;
// quantity

