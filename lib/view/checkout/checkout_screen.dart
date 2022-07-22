// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/view/order_result_screen.dart';
import 'package:burgerhub/widgets/button/main_button.dart';
import 'package:burgerhub/widgets/button/primary_button.dart';
import 'package:burgerhub/widgets/button/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedIndex = 0;
  String selectedAddressType = 'Home';
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pincodeController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Razorpay razorpay = Razorpay();

  @override
  void initState() {
    initializeRazorPay();
    super.initState();
  }

  void initializeRazorPay() {
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void launchRazorPay() {
    Map<String, dynamic> orderDetails = {
      "key": "rzp_test_MLEvBrU6shb7vY",
      "entity": "order",
      "amount": 50000,
      "currency": "INR",
    };
    try {
      razorpay.open(orderDetails);
    } catch (e) {}
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //         builder: (context) =>
    //             OrderResultScreen(result: 'Order Sucessfull')));

    print(response.orderId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                OrderResultScreen(result: 'Payment Failed. Please try again')));
    // Do something when payment fails
    print(response.message);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderResultScreen(result: 'Order....')));
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    razorpay.clear();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print(selectedAddressType);
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: screenSize.height * .1,
            width: screenSize.width,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.grey.shade300,
              ),
            ),
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Delivery at Home',
                      style: labelTitleStyle.copyWith(
                          fontSize: 18, color: primaryColor),
                    ),
                    Icon(
                      Icons.location_on,
                      color: primaryColor,
                    )
                  ],
                )),
                Flexible(
                  child: Text(
                    'Delhi near basant kunj, Pratul Pant, 8126416955',
                    style: productDescriptionStyle.copyWith(
                      fontSize: 15,
                      color: Colors.grey.shade500,
                    ),
                    maxLines: 1,
                    softWrap: true,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
          Title(color: Colors.black, child: Text('Or')),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: screenSize.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.white,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter complete address',
                  style: secondaryTitleStyle.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                  ),
                ),
                Divider(),
                Text(
                  'Save address as *',
                  style: productDescriptionStyle.copyWith(
                    color: Colors.grey.shade800,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: screenSize.height * .05,
                  width: screenSize.width,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      primary: false,
                      shrinkWrap: true,
                      itemCount: addressType.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                              selectedAddressType = addressType[selectedIndex];
                            });
                          },
                          child: AddressTypeWidget(
                            selectedIndex: selectedIndex,
                            index: index,
                          ),
                        );
                      }),
                ),
                Form(
                    child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    textformWidget(
                      formTitle: 'Address',
                      controller: addressController,
                    ),
                    textformWidget(
                      formTitle: 'City',
                      controller: cityController,
                    ),
                    textformWidget(
                      formTitle: 'Pincode',
                      controller: pincodeController,
                    ),
                    textformWidget(
                      formTitle: 'Phone Number',
                      controller: phoneController,
                    ),
                  ],
                )),
                MainButton(
                  onTap: launchRazorPay,
                  buttonName: 'Place Order',
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

class textformWidget extends StatelessWidget {
  TextEditingController controller;
  String formTitle;
  textformWidget({
    Key? key,
    required this.controller,
    required this.formTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: Colors.red,
        controller: controller,
        decoration: InputDecoration(
          labelText: formTitle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        autocorrect: false,
      ),
    );
  }
}

class AddressTypeWidget extends StatelessWidget {
  int index;
  AddressTypeWidget({
    Key? key,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Colors.red.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            color: selectedIndex == index ? Colors.red : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            addressType[index],
            style: secondaryTitleStyle.copyWith(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
