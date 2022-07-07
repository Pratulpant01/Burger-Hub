import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/screens/account_screen.dart';
import 'package:burgerhub/screens/cart_screen.dart';
import 'package:burgerhub/screens/home_screen.dart';
import 'package:burgerhub/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Size & Other Utills

Size screenSize =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

// Colors
Color primaryColor = Color.fromARGB(255, 250, 125, 0);
Color secondaryColor = Color(0xffEE4D2A);

Color bgSecondaryColor = Color.fromARGB(255, 247, 243, 243);

// List for constant values

List<Widget> tabOptions = [
  HomeScreen(),
  SearchScreen(),
  CartScreen(),
  AccountScreen(),
];

List<CategoryModel> categoriesList = [
  CategoryModel(name: 'Recommended', categoryId: '01'),
  CategoryModel(name: 'Veg', categoryId: '02'),
  CategoryModel(name: 'Non Veg', categoryId: '03'),
  CategoryModel(name: 'Weekly Crisp', categoryId: '04'),
  CategoryModel(name: '50% OFF', categoryId: '05'),
  CategoryModel(name: 'Family Meal', categoryId: '06'),
];

List bannerImages = [
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220314120852690150_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220221051506134895_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220314120852690150_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20210427105418426638_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220330141241822628_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20211006080239254637_1440x300jpg',
];

// TextStyle Constants

TextStyle optionStyle = GoogleFonts.abel(
  fontSize: 15,
);
TextStyle categoryTitleStyle = GoogleFonts.akshar(
  fontSize: 20,
  color: Colors.white,
);

TextStyle productTitleStyle = GoogleFonts.aclonica(
  fontSize: 15,
);
TextStyle productDescriptionStyle = GoogleFonts.akshar(
  fontSize: 12,
);
TextStyle productPricingStyle = GoogleFonts.aclonica(
  fontSize: 20,
);
TextStyle labelTitleStyle = GoogleFonts.anybody(
  fontSize: 13,
  fontWeight: FontWeight.w500,
);
