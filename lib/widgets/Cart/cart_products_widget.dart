import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/widgets/Cart/cart_quantity_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant.dart';
import '../button/add_quantity_widget.dart';

class CartProductsWidget extends StatefulWidget {
  const CartProductsWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<CartProductsWidget> createState() => _CartProductsWidgetState();
}

class _CartProductsWidgetState extends State<CartProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Order',
            textAlign: TextAlign.start,
            style: labelTitleStyle.copyWith(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            width: screenSize.width,
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('cart')
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
                      primary: false,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // foodTypeWidget(foodtype: 'Veg'),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      child: Image.network(
                                        snapshot.data!.docs[index]
                                            .data()['imageUrl'],
                                        fit: BoxFit.cover,
                                        alignment: Alignment.centerLeft,
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: screenSize.width / 2.5,
                                        child: Text(
                                          snapshot.data!.docs[index]
                                              .data()['productName'],
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: productTitleStyle.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: screenSize.width * .02,
                                      ),
                                      Text(
                                        '₹${snapshot.data!.docs[index].data()['price']}',
                                        style: productPricingStyle.copyWith(
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Transform.scale(
                                    scale: 0.6,
                                    child: addQuantityWidget(
                                      productId: snapshot.data!.docs[index]
                                          .data()['productId'],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                }),
          )
        ],
      ),
    );
  }
}
