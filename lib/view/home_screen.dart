import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/widgets/category_showcase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/AppBar/app_bar_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/input widgets/heading_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/product_list_case_widget.dart';

class HomeScreen extends StatelessWidget {
  int selectedBanner = 0;
  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = BlocProvider.of<AuthBloc>(context).state.userData;
    print(userData);
    return Scaffold(
      backgroundColor: bgSecondaryColor,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            bannerWidget(selectedBanner: selectedBanner),
            categoryShowcase(),
            Container(
              height: screenSize.height * .31,
              child: ListView.builder(
                  itemCount: 6,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return productCard(
                      product: products[index],
                    );
                  }),
            ),
            Divider(),
            headingWidget(
              title: 'All Time Favorite ❤️',
            ),
            Container(
              width: screenSize.width,
              child: ListView.builder(
                  primary: false,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ProductListCase(
                      product: products[index],
                    );
                  }),
            ),
            Container(
              height: screenSize.height / 3,
            ),
          ],
        ),
      ),
    );
  }
}