// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/demo.dart';
import 'package:burgerhub/view/account/your_orders_screen.dart';
import 'package:burgerhub/view/admin/admin_screen.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:burgerhub/widgets/AppBar/search_app_bar_widget.dart';
import 'package:burgerhub/widgets/button/secondary_button.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:burgerhub/widgets/Product/product_card_widget.dart';

import '../../widgets/Product/listile_widget.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = BlocProvider.of<AuthBloc>(context).state.userData;
    return Scaffold(
      appBar: SimpleAppBarWidget(),
      body: SingleChildScrollView(
        child: Container(
            height: screenSize.height,
            width: screenSize.width,
            margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                accountCardWidget(
                  name: userData!.name,
                ),
                Divider(),
                headingWidget(
                  title: 'Your Previous Orders',
                  isMore: true,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => YourOrderScreen()));
                  },
                ),
                userData.role == 'Admin'
                    ? secondaryButton(
                        buttonName: 'Admin Panel',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminScreen(),
                            ),
                          );
                        },
                      )
                    : Container(
                        height: screenSize.height * .31,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 4,
                            primary: false,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return productCard(
                                product: demoProducts[index],
                              );
                            }),
                      ),
                headingWidget(
                  title: 'Settings',
                  isMore: false,
                ),
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.vertical,
                        children: [
                          ListTileWidget(
                            name: 'Check your cart',
                            icon: Icons.fastfood_outlined,
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenLayout(selectedIndex: 2),
                                ),
                              );
                            },
                          ),
                          ListTileWidget(
                            name: 'Send Feedback',
                            icon: Icons.feedback_outlined,
                            onTap: () {
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => MainScreenWidget(),
                              //   ),
                              // );
                            },
                          ),
                          ListTileWidget(
                            name: 'Help',
                            icon: Icons.help_outline,
                            onTap: () {},
                          ),
                          ListTileWidget(
                            name: 'About',
                            icon: Icons.info_outline,
                            onTap: () {},
                          ),
                          ListTileWidget(
                            name: 'Log Out',
                            icon: Icons.logout_outlined,
                            onTap: () {
                              FirebaseAuth.instance.signOut();
                            },
                          ),
                        ],
                      )),
                )
              ],
            )),
      ),
    );
  }
}

class accountCardWidget extends StatelessWidget {
  String name;
  accountCardWidget({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Welcome Back',
                  style: labelTitleStyle.copyWith(
                    fontSize: 20,
                    color: descriptionTextColor,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .01,
                ),
                Text(
                  name,
                  style: secondaryTitleStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: descriptionTextColor,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .01,
                ),
                Text(
                  '100+ Orders',
                  style: productPricingStyle.copyWith(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Special ★',
                  style: productPricingStyle.copyWith(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .01,
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: screenSize.height * .05,
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(
              'https://www.kindpng.com/picc/m/24-248253_user-profile-default-image-png-clipart-png-download.png',
            ),
          )
        ],
      ),
    );
  }
}
