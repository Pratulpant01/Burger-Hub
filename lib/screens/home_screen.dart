import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/category_showcase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/banner_widget.dart';

class HomeScreen extends StatelessWidget {
  int selectedBanner = 0;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          bannerWidget(selectedBanner: selectedBanner),
          Container(
            height: screenSize.height * .05,
            child: ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return categoryShowcase();
                }),
          )
        ],
      ),
    );
  }
}
