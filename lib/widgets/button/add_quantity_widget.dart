// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/view/cart/services/cart_services.dart';
import 'package:burgerhub/view/product/product_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/button/round_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class addQuantityWidget extends StatefulWidget {
  bool isMargin;
  String productId;
  addQuantityWidget({
    Key? key,
    this.isMargin = false,
    required this.productId,
  }) : super(key: key);

  @override
  State<addQuantityWidget> createState() => _addQuantityWidgetState();
}

class _addQuantityWidgetState extends State<addQuantityWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isMargin ? null : EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                if (value >= 1) {
                  value--;

                  context
                      .read<AddQuantityBloc>()
                      .add(DecrementQuantityEvent(value, widget.productId));
                }
              });
            },
            icon: Icon(
              Icons.remove,
              color: secondaryColor,
            ),
          ),
          Builder(builder: (context) {
            return FittedBox(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('cart')
                      .doc(widget.productId)
                      .snapshots(),
                  builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: Container(),
                      );
                    }
                    if (snapshot.data!.exists == true) {
                      value = snapshot.data!['quantity'];
                    }
                    return Container(
                      child: Center(
                        child: Text(
                          value.toString(),
                          style: TextStyle(
                            color: secondaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }),
            );
          }),
          IconButton(
            onPressed: () {
              if (value <= 10) {
                setState(() {
                  value++;
                  context
                      .read<AddQuantityBloc>()
                      .add(IncrementQuantityEvent(value, widget.productId));
                });
              }
            },
            icon: Icon(
              Icons.add,
              color: secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
