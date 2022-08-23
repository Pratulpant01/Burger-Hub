// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/Product/product_card_widget.dart';

class OrderInfo extends StatefulWidget {
  String orderId;
  OrderInfo({
    Key? key,
    required this.orderId,
  }) : super(key: key);

  @override
  State<OrderInfo> createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {
  String orderStatus = '';
  String paymentStatus = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(hasBackButton: true),
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('orders')
                .where('orderNumber', isEqualTo: widget.orderId)
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }
              return StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('orders')
                      .doc(widget.orderId)
                      .collection('products')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot1) {
                    if (snapshot1.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(color: primaryColor),
                      );
                    }
                    orderStatus = snapshot.data!.docs[0].data()['orderStatus'];
                    paymentStatus =
                        snapshot.data!.docs[0].data()['paymentStatus'];
                    return Column(
                      children: [
                        SizedBox(
                          height: screenSize.height * .02,
                        ),
                        Center(
                          child: Text(
                            'Ordered Products',
                            style: labelTitleStyle.copyWith(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: screenSize.width,
                          height: screenSize.height * .31,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: snapshot1.data!.docs.length,
                              itemBuilder: (context, index1) {
                                return productCard(
                                  product: ProductModel.fromJson(
                                      snapshot1.data!.docs[index1].data()),
                                );
                              }),
                        ),
                        Center(
                          child: Text(
                            'Order Details',
                            style: labelTitleStyle.copyWith(
                              fontSize: 18,
                              color: primaryColor,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: screenSize.height * .02,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            OrderDetailWidget(
                              label: 'Order Number - ',
                              value:
                                  snapshot.data!.docs[0].data()['orderNumber'],
                              valueColor: primaryColor,
                            ),
                            OrderDetailWidget(
                              label: 'Order Status - ',
                              value: orderStatus,
                              valueColor: orderStatus == 'Preparing'
                                  ? Colors.green
                                  : alertColor,
                            ),
                            OrderDetailWidget(
                              label: 'Payment Status - ',
                              value: paymentStatus,
                              valueColor: paymentStatus == 'Completed'
                                  ? Colors.green
                                  : alertColor,
                            ),
                            OrderDetailWidget(
                              label: 'Delivery Address - ',
                              value: snapshot.data!.docs[0]
                                  .data()['shippingAddress'],
                              valueColor: primaryColor,
                            ),
                          ],
                        ),
                      ],
                    );
                  });
            }),
      ),
    );
  }
}

class OrderDetailWidget extends StatelessWidget {
  String label;
  Color valueColor;
  String value;
  OrderDetailWidget({
    Key? key,
    required this.label,
    required this.valueColor,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenSize.width,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            label,
            style: labelTitleStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          ),
          Flexible(
            child: Text(
              value,
              style: productTitleStyle.copyWith(
                fontSize: 12,
                color: valueColor,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
