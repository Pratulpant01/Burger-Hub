// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class uploadProductEvent extends ProductEvent {
  BuildContext? context;
  String productName;
  String description;
  int price;
  String time;
  List category;
  String type;
  Uint8List image;
  uploadProductEvent({
    this.context,
    required this.productName,
    required this.description,
    required this.price,
    required this.time,
    required this.category,
    required this.type,
    required this.image,
  });
}
