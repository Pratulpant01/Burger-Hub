import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/app_bar_widget.dart';
import 'package:burgerhub/widgets/search_app_bar_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/product_card_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgSecondaryColor,
        appBar: SearchAppBarWidget(),
        body: Container(
          child: GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1 / 1.3,
            ),
            children: [],
          ),
        ));
  }
}
