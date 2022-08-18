// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/view/checkout/checkout_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';

import '../../view/cart/cart_screen.dart';
import '../button/main_button.dart';

class cartBottomSheet extends StatelessWidget {
  cartBottomSheet({
    Key? key,
  }) : super(key: key);

  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('cart')
            .snapshots(),
        builder: (context,
            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (totalPrice == 0) {
            snapshot.data!.docs.forEach((snap) {
              int price = snap.data()['totalPrice'];
              totalPrice += price;
            });
          } else {
            totalPrice = 0;
            snapshot.data!.docs.forEach((snap) {
              int price = snap.data()['totalPrice'];
              totalPrice += price;
            });
          }
          return Container(
            height: screenSize.height / 3.5,
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: bgSecondaryColor,
                border: Border.all(
                  color: Colors.grey.shade300,
                )),
            child: Column(
              children: [
                PriceOverviewWidget(
                  totalPrice: totalPrice,
                ),
                MainButton(
                  buttonName: 'Proceed To Checkout',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CheckoutScreen(
                                totalPrice: totalPrice,
                              )),
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}
