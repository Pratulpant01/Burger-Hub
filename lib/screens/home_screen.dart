import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/widgets/category_showcase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/banner_widget.dart';
import '../widgets/heading_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/product_list_case_widget.dart';

class HomeScreen extends StatelessWidget {
  int selectedBanner = 0;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          bannerWidget(selectedBanner: selectedBanner),
          categoryShowcase(),
          Container(
            height: screenSize.height * .3,
            child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return productCard();
                }),
          ),
          Divider(),
          headingWidget(),
          Container(
            height: screenSize.height * .5,
            child: ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: 5,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return ProductListCase();
                }),
          ),
          Container(
            height: screenSize.height / 3,
          ),
        ],
      ),
    );
  }
}
