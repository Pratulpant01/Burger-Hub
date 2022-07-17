import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/demo.dart';
import 'package:burgerhub/view/admin/admin_view/add_addons.dart';
import 'package:burgerhub/view/admin/admin_view/add_categories.dart';
import 'package:burgerhub/view/admin/admin_view/add_products.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:burgerhub/widgets/Product/listile_widget.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        isEnable: true,
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Hello Admin',
                  style: headingStyle.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * .03,
              ),
              Text(
                "Analytics",
                style: labelTitleStyle.copyWith(
                  fontSize: 25,
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                height: screenSize.width / 3,
                width: screenSize.width,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AnalyticsProductCard(),
                    AnalyticsCardWidget(),
                  ],
                ),
              ),
              SizedBox(
                height: screenSize.height * .02,
              ),
              headingWidget(title: 'More..', isMore: false),
              SizedBox(
                height: screenSize.height / 2,
                width: screenSize.width,
                child: ListView(
                  children: [
                    ListTileWidget(
                      name: 'Check Orders',
                      icon: Icons.room_service,
                      onTap: () {},
                    ),
                    ListTileWidget(
                      name: 'Add Product',
                      icon: Icons.add,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddProductScreen(),
                          ),
                        );
                      },
                    ),
                    ListTileWidget(
                      name: 'Remove Product',
                      icon: Icons.remove,
                      onTap: () {},
                    ),
                    ListTileWidget(
                      name: 'Update Order Status',
                      icon: Icons.food_bank_outlined,
                      onTap: () {},
                    ),
                    ListTileWidget(
                      name: 'Add Catergories',
                      icon: Icons.category_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddCategories(),
                          ),
                        );
                      },
                    ),
                    ListTileWidget(
                      name: 'Add Banners',
                      icon: Icons.branding_watermark,
                      onTap: () {},
                    ),
                    ListTileWidget(
                      name: 'Add Addons',
                      icon: Icons.fastfood_outlined,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddAddons(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AnalyticsProductCard extends StatelessWidget {
  const AnalyticsProductCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'Total Products',
                style: headingStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '10+ Products',
              style: productDescriptionStyle.copyWith(
                fontSize: 18,
                color: primaryColor,
              ),
            ),
            Text(
              '15+ Categories',
              style: productDescriptionStyle.copyWith(
                fontSize: 18,
                color: Colors.red,
              ),
            ),
            Text(
              '10+ Addons',
              style: productDescriptionStyle.copyWith(
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnalyticsCardWidget extends StatelessWidget {
  const AnalyticsCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Text(
                'Orders',
                style: headingStyle.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                '20+',
                style: productPricingStyle.copyWith(
                  fontSize: screenSize.width * 0.1,
                  color: secondaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
