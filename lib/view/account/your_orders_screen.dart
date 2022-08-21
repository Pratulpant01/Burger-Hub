import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/order_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/food%20widgets/food_type_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YourOrderScreen extends StatelessWidget {
  const YourOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUser = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Text(
                'Your Orders',
                style: headingStyle.copyWith(
                  color: primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where('buyerId', isEqualTo: currentUser)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      String orderStatus =
                          snapshot.data!.docs[index].data()['orderStatus'];
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ExpansionTile(
                            collapsedBackgroundColor: Colors.white70,
                            textColor: primaryColor,
                            title: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Order No. ${index}',
                                      style: productTitleStyle,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: screenSize.height * .02,
                                    ),
                                    Text(
                                      orderStatus,
                                      style: secondaryTitleStyle.copyWith(
                                        color: orderStatus == "Preparing" ||
                                                orderStatus == 'Completed'
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                ),
                                Container(
                                  child: CircleAvatar(
                                    radius: screenSize.height * .03,
                                    backgroundColor: Colors.transparent,
                                    backgroundImage:
                                        AssetImage('assets/myorder.png'),
                                  ),
                                ),
                              ],
                            ),
                            children: [
                              Container(
                                margin: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    StreamBuilder(
                                        stream: FirebaseFirestore.instance
                                            .collection('orders')
                                            .doc(snapshot.data!.docs[index]
                                                .data()['orderNumber'])
                                            .collection('products')
                                            .snapshots(),
                                        builder: (context,
                                            AsyncSnapshot<
                                                    QuerySnapshot<
                                                        Map<String, dynamic>>>
                                                snapshot1) {
                                          if (snapshot1.connectionState ==
                                              ConnectionState.waiting) {
                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          }
                                          return ListView.builder(
                                              physics: ScrollPhysics(),
                                              itemCount:
                                                  snapshot1.data!.docs.length,
                                              shrinkWrap: true,
                                              itemBuilder: (context, index1) {
                                                return Row(
                                                  children: [
                                                    foodTypeWidget(
                                                        foodtype: snapshot1
                                                            .data!.docs[index1]
                                                            .data()['type']),
                                                    Text(
                                                      '${snapshot1.data!.docs[index1].data()['quantity']} ',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    Text(
                                                      'X',
                                                      style: TextStyle(
                                                          color: Colors
                                                              .grey.shade600),
                                                    ),
                                                    Text(
                                                      ' ${snapshot1.data!.docs[index1].data()['productName']} ',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ],
                                                );
                                              });
                                        }),
                                    Divider(
                                      color: Colors.grey,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat('dd-MM-yyyy').format(
                                              snapshot.data!.docs[index]
                                                  .data()['orderedAt']
                                                  .toDate()),
                                          style: labelTitleStyle.copyWith(
                                              color: Colors.grey),
                                        ),
                                        Text(
                                          '₹${snapshot.data!.docs[index].data()['totalPrice']}',
                                          style: productPricingStyle.copyWith(
                                              color: Colors.black),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
