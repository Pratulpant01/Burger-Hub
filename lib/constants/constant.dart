import 'package:burgerhub/models/addon_model.dart';
import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:burgerhub/view/account_screen.dart';
import 'package:burgerhub/view/cart_screen.dart';
import 'package:burgerhub/view/home_screen.dart';
import 'package:burgerhub/view/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Size & Other Utills

Size screenSize =
    MediaQueryData.fromWindow(WidgetsBinding.instance.window).size;

// Colors
Color primaryColor = Color(0xffE25100);
Color secondaryColor = Color(0xffEE4D2A);
Color darkTextColor = Color(0xff482A2A);
Color descriptionTextColor = Color(0xff38393F);

Color bgSecondaryColor = Color(0xFFF7F3F3);

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

List<ProductModel> products = [
  ProductModel(
    productName: 'Veg Cheese Burger',
    description:
        'Delicious Cheese Burger with Extra Toppings. Grab now with 50% off',
    price: 150,
    productId: 'A',
    quantity: 0,
    rating: 5,
    time: '20 min',
    category: ['Weekly Crisp'],
    imageUrl:
        'https://media.istockphoto.com/photos/cheeseburger-with-tomato-and-lettuce-on-wooden-board-picture-id1309352410?b=1&k=20&m=1309352410&s=170667a&w=0&h=YduYl7Us5MSrw1EFSCxR9zDRLnEFa_O608NdqhHlSyM=',
    type: 'Veg',
    addon: [],
  ),
  ProductModel(
    productName: 'McAloo Tikki Burger',
    description:
        'A tikki delight: Potato and peas patty topped with veg sauce, ketchup, tomatoes and onions with toasted buns',
    price: 86,
    productId: 'B',
    quantity: 0,
    rating: 5,
    time: '25 min',
    category: ['Weekly Crisp', 'Veg'],
    imageUrl:
        'https://images.unsplash.com/photo-1571091655789-405eb7a3a3a8?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGJ1cmdlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
    type: 'Veg',
    addon: [],
  ),
  ProductModel(
    productName: 'Pizza McPuff',
    description:
        'Our signature Whopper with 7 layers between the buns. Flame Grilled chicken Patty, fresh onion, crispy lettuce, juicy tomatoes(seasonal), tangy gherkins, creamy and smoky sauces with xxl buns. Its Not A Burger, its a Whopper.',
    price: 49,
    productId: 'C',
    quantity: 0,
    rating: 5,
    time: '10 min',
    category: ['Weekly Crisp', 'Recommended'],
    imageUrl:
        'https://media.istockphoto.com/photos/delicious-homemade-hamburger-and-french-fries-picture-id1254672762?b=1&k=20&m=1254672762&s=170667a&w=0&h=nKrG40G2jj9O8wzJ8wDD2zmUKNp00mcdVWK_f_zixug=',
    type: 'Veg',
    addon: [],
  ),
  ProductModel(
    productName: 'Heavy Weight Burger',
    description:
        'Large brown bun - Spinach corn patty - Cheese slice - Grilled paneer - Lettuce - Spicy sauce',
    price: 249,
    productId: 'D',
    quantity: 0,
    rating: 5,
    time: '35 min',
    category: ['Weekly Crisp', 'Veg'],
    imageUrl:
        'https://media.istockphoto.com/photos/cheese-burger-with-bacon-on-black-dark-background-picture-id1295796202?b=1&k=20&m=1295796202&s=170667a&w=0&h=jqUTXzROq4_Sw4V61-xtn0VDQtpZOXzKUgPLlZx3qs4=',
    type: 'Veg',
    addon: [],
  ),
  ProductModel(
    productName: 'Chicken Steak Burger',
    description:
        'Large brown bun - Spinach corn patty - Cheese slice - Grilled paneer - Lettuce - Spicy sauce',
    price: 199,
    productId: 'E',
    quantity: 0,
    rating: 5,
    time: '40 min',
    category: ['Weekly Crisp', 'Non Veg'],
    imageUrl:
        'https://images.unsplash.com/photo-1565299507177-b0ac66763828?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8YnVyZ2VyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
    type: 'Non Veg',
    addon: [],
  ),
  ProductModel(
    productName: 'Cheese Chicken Quarter Pounder Burger',
    description:
        'Large brown bun - Spinach corn patty - Cheese slice - Grilled paneer - Lettuce - Spicy sauce',
    price: 329,
    productId: 'E',
    quantity: 0,
    rating: 5,
    time: '40 min',
    category: ['Weekly Crisp', 'Non Veg'],
    imageUrl:
        'https://media.istockphoto.com/photos/closeup-of-a-veggie-burger-with-copy-space-picture-id1331109186?b=1&k=20&m=1331109186&s=170667a&w=0&h=CWqc2DNV-frmE_aqiQu4Q-SfCUmqJIp362drb4cSMZU=',
    type: 'Non Veg',
    addon: [],
  ),
];

List bannerImages = [
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220314120852690150_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220221051506134895_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220314120852690150_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20210427105418426638_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20220330141241822628_1440x300jpg',
  'https://burgerking-image.s3.amazonaws.com/products/Home/web/1x_web_20211006080239254637_1440x300jpg',
];

List<AddOnModel> addonList = [
  AddOnModel(
    addonName: 'Paneer',
    price: 50,
    isSelected: false,
  ),
  AddOnModel(
    addonName: 'Cheese Slice',
    price: 30,
    isSelected: false,
  ),
  AddOnModel(
    addonName: 'Corn',
    price: 30,
    isSelected: false,
  ),
  AddOnModel(
    addonName: 'Sauce',
    price: 2,
    isSelected: false,
  ),
  AddOnModel(
    addonName: 'Extra Tikki',
    price: 50,
    isSelected: false,
  ),
];

// TextStyle Constants

TextStyle optionStyle = GoogleFonts.abel(
  fontSize: 15,
);
TextStyle categoryTitleStyle = GoogleFonts.akshar(
  fontSize: 20,
  color: Colors.white,
);

TextStyle productTitleStyle = GoogleFonts.aldrich(
  fontSize: 13,
  fontWeight: FontWeight.bold,
);
TextStyle productDescriptionStyle = GoogleFonts.akshar(
  fontSize: 12,
);
TextStyle productPricingStyle = GoogleFonts.aclonica(
  fontSize: 15,
);
TextStyle labelTitleStyle = GoogleFonts.anybody(
  fontSize: 13,
  fontWeight: FontWeight.w500,
);

TextStyle secondaryTitleStyle = GoogleFonts.asul(
  fontSize: 13,
  fontWeight: FontWeight.w500,
);
TextStyle headingStyle = GoogleFonts.alike(
  fontSize: 18,
  fontWeight: FontWeight.w400,
);
