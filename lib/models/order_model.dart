// ignore_for_file: public_member_api_docs, sort_constructors_first
class OrderModel {
  int totalPrice;
  String orderNumber;
  String shippingAddress;
  String buyerId;
  String orderStatus;
  DateTime orderedAt;
  String paymentStatus;

  OrderModel({
    required this.totalPrice,
    required this.orderNumber,
    required this.shippingAddress,
    required this.buyerId,
    required this.orderStatus,
    required this.orderedAt,
    required this.paymentStatus,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      totalPrice: json['totalPrice'],
      orderNumber: json['orderNumber'],
      shippingAddress: json['shippingAddress'],
      buyerId: json['buyerId'],
      orderStatus: json['orderStatus'],
      orderedAt: json['orderedAt'],
      paymentStatus: json['paymentStatus'],
    );
  }

  Map<String, dynamic> getJson() {
    return {
      'totalPrice': totalPrice,
      'orderNumber': orderNumber,
      'shippingAddress': shippingAddress,
      'buyerId': buyerId,
      'orderStatus': orderStatus,
      'orderedAt': orderedAt,
      'paymentStatus': paymentStatus,
    };
  }
}
