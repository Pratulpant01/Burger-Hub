import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/button/add_quantity_widget.dart';
import 'package:burgerhub/widgets/food%20widgets/food_type_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  ProductModel? product;
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: screenSize.height / 4,
          width: screenSize.width,
          decoration: BoxDecoration(
            color: Colors.white30,
            border: Border.all(
              color: Colors.grey.shade300,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: screenSize.width / 3.5,
                          width: screenSize.width / 3.5,
                          child: Image.network(
                            'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1599&q=80',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      giveMargin,
                      FittedBox(
                        child: addQuantityWidget(),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Cheese Chicken Quarter Pounder Burger',
                        style: productTitleStyle.copyWith(fontSize: 15),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        '- Addons -',
                        style: productDescriptionStyle.copyWith(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                      Container(
                        height: 30,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('•'),
                                  Text(
                                    'Extra Cheese',
                                    style: productDescriptionStyle,
                                  ),
                                ],
                              );
                            }),
                      ),
                      Container(
                        height: screenSize.width * .05,
                        width: screenSize.width * .06,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
