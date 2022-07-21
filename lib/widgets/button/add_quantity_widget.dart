// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/models/product_model.dart';
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
  ProductModel product;
  addQuantityWidget({
    Key? key,
    this.isMargin = false,
    required this.product,
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
                      .add(DecrementQuantityEvent(value, widget.product));
                }
              });
            },
            icon: Icon(
              Icons.remove,
              color: secondaryColor,
            ),
          ),
          Builder(builder: (context) {
            return StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('cart')
                    .doc(widget.product.productId)
                    .snapshots(),
                builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Container(
                      height: screenSize.height * .05,
                      child: Center(
                        child: Text(
                          value.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.data!.exists == true) {
                    value = snapshot.data!['quantity'];
                  }
                  return Container(
                    height: screenSize.height * .05,
                    child: Center(
                      child: Text(
                        value.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  );
                });
          }),
          IconButton(
            onPressed: () {
              if (value <= 10) {
                setState(() {
                  value++;
                  context
                      .read<AddQuantityBloc>()
                      .add(IncrementQuantityEvent(value, widget.product));
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
