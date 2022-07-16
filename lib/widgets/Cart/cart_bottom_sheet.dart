import 'package:burgerhub/constants/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class cartBottomSheet extends StatelessWidget {
  const cartBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      decoration: BoxDecoration(
          border: Border.all(
        color: Colors.grey.shade400,
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: Container(
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
                      .doc('24abe880-0154-11ed-a92b-791984e8f678')
                      .snapshots(),
                  builder: (context,
                      AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    String price =
                        snapshot.data!.data()!['totalPrice'].toString();
                    return Center(
                      child: Text(
                        'Proceed To Checkout ₹${price}',
                        style: productDescriptionStyle.copyWith(
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
