import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(),
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
              "Statistic",
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
                  color: Colors.grey.shade300,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(0.1),
                        border: Border(
                          left: BorderSide(
                            color: primaryColor,
                          ),
                          right: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        border: Border(
                          left: BorderSide(
                            color: primaryColor,
                          ),
                          right: BorderSide(
                            color: primaryColor,
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Orders',
                              style: headingStyle.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                '20+',
                                style: productPricingStyle.copyWith(
                                  fontSize: screenSize.width * 0.1,
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
