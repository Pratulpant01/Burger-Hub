import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/constant.dart';
import '../button/add_quantity_widget.dart';

class CartProductsWidget extends StatelessWidget {
  const CartProductsWidget({
    Key? key,
  }) : super(key: key);

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
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // foodTypeWidget(foodtype: 'Veg'),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Container(
                                height: 50,
                                width: 50,
                                child: Image.network(
                                    'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1599&q=80'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: screenSize.width / 2.5,
                                  child: Text(
                                    'Max Veg Burger jajnsj asjnasj asjkjsasan jakkjs',
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
                                  'Rs 220',
                                  style: productPricingStyle.copyWith(
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Transform.scale(
                              scale: 0.6,
                              child: BlocProvider(
                                create: (context) => AddQuantityBloc(),
                                child: addQuantityWidget(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
