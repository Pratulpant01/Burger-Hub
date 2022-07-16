import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/Cart/cart_products_widget.dart';
import 'package:burgerhub/widgets/bottom_sheet_widget.dart';
import 'package:burgerhub/widgets/button/add_quantity_widget.dart';
import 'package:burgerhub/widgets/food%20widgets/food_type_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:burgerhub/widgets/Product/total_rating_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/Cart/addons_widget.dart';
import '../../widgets/Cart/cart_bottom_sheet.dart';
import '../../widgets/Cart/price_widget.dart';
import '../../widgets/Cart/total_savings_widget.dart';
import '../../widgets/button/delete_button.dart';
import '../../widgets/button/primary_button.dart';

class CartScreen extends StatelessWidget {
  ProductModel? product;
  bool addonList = false;
  CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: cartBottomSheet(),
      appBar: SimpleAppBarWidget(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TotalSavingWidget(),
            CartProductsWidget(),
          ],
        ),
      ),
    );
  }
}

/////
///
///
///
///
///
// class cartProductShowcase extends StatelessWidget {
//   const cartProductShowcase({
//     Key? key,
//     required this.addonList,
//   }) : super(key: key);

//   final bool addonList;

//   @override
//   Widget build(BuildContext context) {
//     return FittedBox(
//       child: Container(
//         margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//         padding: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
//         width: screenSize.width,
//         decoration: BoxDecoration(
//           color: Colors.white30,
//           border: Border.all(
//             color: Colors.grey.shade300,
//           ),
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Row(
//               children: [
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                     child: Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             height: screenSize.width / 4,
//                             child: Image.network(
//                               'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1599&q=80',
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   flex: 2,
//                   child: Container(
//                     margin: EdgeInsets.symmetric(horizontal: 5),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Cheese Chicken Quarter Pounder Burger',
//                           style: productTitleStyle.copyWith(fontSize: 12),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         SizedBox(
//                           height: screenSize.height * .01,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             addonList
//                                 ? addonsWidget()
//                                 : Container(
//                                     width: screenSize.width * .5,
//                                     height: 60,
//                                     child: Text(
//                                       'Large brown bun - Spinach corn patty - Cheese slice - Grilled paneer - Lettuce - Spicy sauce',
//                                       style: productDescriptionStyle,
//                                       maxLines: 2,
//                                       overflow: TextOverflow.ellipsis,
//                                     ),
//                                   ),
//                             Column(
//                               children: [
//                                 foodTypeWidget(foodtype: 'Veg'),
//                                 SizedBox(
//                                   height: screenSize.height * .01,
//                                 ),
//                                 totalRatingWidget(size: 10),
//                               ],
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Divider(),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 FittedBox(
//                   child: Transform.scale(
//                     scale: 0.7,
//                     child: addQuantityWidget(
//                       isMargin: true,
//                     ),
//                   ),
//                 ),
//                 priceWidget(isButton: false),
//                 deleteButton(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
