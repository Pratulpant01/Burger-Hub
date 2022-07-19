import 'package:burgerhub/constants/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../../view/cart/cart_screen.dart';

class cartBottomSheet extends StatelessWidget {
  cartBottomSheet({
    Key? key,
  }) : super(key: key);

  int totalPrice = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade400,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PriceOverviewWidget(),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: 10,
            ),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            height: screenSize.width * .14,
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
                  print(totalPrice.toString());
                  return Center(
                    child: Text(
                      'Proceed To Checkout ₹' + totalPrice.toString(),
                      style: productDescriptionStyle.copyWith(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
