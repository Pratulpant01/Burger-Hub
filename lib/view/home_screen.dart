import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/bloc/Product%20Bloc/product_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/widgets/category_showcase.dart';
import 'package:burgerhub/widgets/input%20widgets/primary_heading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/AppBar/app_bar_widget.dart';
import '../widgets/banner_widget.dart';
import '../widgets/input widgets/heading_widget.dart';
import '../widgets/product_card_widget.dart';
import '../widgets/product_list_case_widget.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedBanner = 0;

  @override
  Widget build(BuildContext context) {
    final userData = BlocProvider.of<AuthBloc>(context).state.userData;
    return Scaffold(
      backgroundColor: bgSecondaryColor,
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            bannerWidget(selectedBanner: selectedBanner),
            categoryShowcase(),
            giveMargin,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: primaryHeadingWidget(title: 'Recently Added 🍔')),
            ),
            BlocBuilder<ProductBloc, ProductState>(
              builder: (context, state) {
                if (state is ProductLoading) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: primaryColor,
                    ),
                  );
                } else if (state is ProductLoaded) {
                  return Container(
                    height: screenSize.height * .31,
                    child: ListView.builder(
                        itemCount: state.products.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return productCard(
                            product: state.products[index],
                          );
                        }),
                  );
                } else {
                  return Container();
                }
              },
            ),
            Divider(),
            headingWidget(
              title: 'All Time Favorite ❤️',
              isMore: true,
            ),
            Container(
              width: screenSize.width,
              child: StreamBuilder(
                  stream:
                      CategoryServices().getProductsByCategories('Recommended'),
                  builder: (context,
                      AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                          snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      );
                    }
                    return ListView.builder(
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return ProductListCase(
                            product: ProductModel.fromJson(
                                snapshot.data!.docs[index].data()),
                          );
                        });
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
