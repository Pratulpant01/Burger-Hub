// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  String productName;
  String description;
  int price;
  String productId;
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
      imageUrl: json['imgUrl'],
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
      'imgUrl': imageUrl,
    };
  }

  @override
  String toString() {
    return 'ProductModel(productName: $productName, description: $description, price: $price, productId: $productId, rating: $rating, time: $time, category: $category, imageUrl: $imageUrl, type: $type)';
  }

  @override
  List<Object> get props {
    return [
      productName,
      description,
      price,
      productId,
      rating,
      time,
      category,
      imageUrl,
      type,
    ];
  }
}



//  List addon;
// quantity

