part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class uploadProductEvent extends AdminEvent {
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
