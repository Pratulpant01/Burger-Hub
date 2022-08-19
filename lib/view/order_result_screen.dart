// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/home_screen.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:burgerhub/widgets/button/main_button.dart';
import 'package:flutter/material.dart';

class OrderResultScreen extends StatelessWidget {
  String result;
  bool isPayment;

  OrderResultScreen({
    Key? key,
    required this.result,
    required this.isPayment,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isPayment
              ? Text(
                  'Thank you for choosing \n BurgerHub',
                  style: labelTitleStyle.copyWith(
                    color: primaryColor,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                )
              : Text(
                  'Payment Failed',
                  style: labelTitleStyle.copyWith(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
          Container(
            alignment: Alignment.center,
            height: isPayment ? screenSize.height / 2.5 : screenSize.height / 3,
            child: isPayment
                ? Image.asset('assets/order_placed.png')
                : Image.asset('assets/order_failed.png'),
          ),
          isPayment
              ? Text(
                  'Your food is being prepared',
                  style: labelTitleStyle.copyWith(
                    color: Color.fromARGB(255, 34, 182, 39),
                    fontSize: 20,
                  ),
                )
              : Text(
                  'Please try again',
                  style: headingStyle.copyWith(
                    color: Colors.red,
                    fontSize: 20,
                  ),
                ),
          SizedBox(
            height: screenSize.height * .1,
          ),
          Transform.scale(
            scale: 0.8,
            child: MainButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenLayout()),
                  );
                },
                buttonName: 'Back to Home'),
          )
        ],
      )),
    );
  }
}
