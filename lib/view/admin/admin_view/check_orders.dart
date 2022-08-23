// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/admin/admin_view/order_info.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';

class CheckOrders extends StatefulWidget {
  const CheckOrders({Key? key}) : super(key: key);

  @override
  State<CheckOrders> createState() => _CheckOrdersState();
}

class _CheckOrdersState extends State<CheckOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Center(
            child: Text(
              'All Orders',
              style: labelTitleStyle.copyWith(
                color: primaryColor,
                fontSize: 20,
              ),
            ),
          ),
          StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('orders').snapshots(),
              builder: (context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(color: primaryColor),
                  );
                }
                return ListView.builder(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return orderTab(
                          orderId:
                              snapshot.data!.docs[index].data()['orderNumber'],
                          orderedAt: DateFormat('dd-MM-yyyy').format(snapshot
                              .data!.docs[index]
                              .data()['orderedAt']
                              .toDate()),
                          foodStatus:
                              snapshot.data!.docs[index].data()['orderStatus'],
                          paymentStatus: snapshot.data!.docs[index]
                              .data()['paymentStatus'],
                          deliveryAddress: snapshot.data!.docs[index]
                              .data()['shippingAddress'],
                          price:
                              snapshot.data!.docs[index].data()['totalPrice']);
                    });
              }),
        ],
      )),
    );
  }
}

class orderTab extends StatelessWidget {
  String orderedAt;
  String orderId;
  String foodStatus;
  String paymentStatus;
  String deliveryAddress;
  int price;
  orderTab({
    Key? key,
    required this.orderedAt,
    required this.orderId,
    required this.foodStatus,
    required this.paymentStatus,
    required this.deliveryAddress,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderInfo(
                      orderId: orderId,
                    )));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        width: screenSize.width,
        height: screenSize.height * .15,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                order_info_widget(
                  heading: 'Ordered At',
                  value: orderedAt,
                  color: primaryColor,
                ),
                order_info_widget(
                  heading: 'Status',
                  value: foodStatus,
                  color: foodStatus == "Preparing" ? Colors.green : alertColor,
                ),
                order_info_widget(
                  heading: 'Payment',
                  value: paymentStatus,
                  color:
                      paymentStatus == 'Completed' ? Colors.green : alertColor,
                ),
              ],
            ),
            SizedBox(
              height: screenSize.height * .01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: screenSize.width / 2,
                  child: Text(
                    deliveryAddress,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: productDescriptionStyle.copyWith(
                        fontSize: 15, color: Colors.black),
                  ),
                ),
                Text(
                  '₹${price}',
                  style: productPricingStyle.copyWith(
                      color: Colors.red, fontSize: 18),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class order_info_widget extends StatelessWidget {
  Color color;
  String heading;
  String value;
  order_info_widget({
    Key? key,
    required this.color,
    required this.heading,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Column(
          children: [
            Text(
              heading,
              style: productPricingStyle,
            ),
            SizedBox(
              height: screenSize.height * .01,
            ),
            Text(
              value,
              style: productDescriptionStyle.copyWith(
                fontSize: 15,
                color: color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
