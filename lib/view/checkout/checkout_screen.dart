// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/bloc/Checkout/checkout_bloc.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/view/checkout/services/checkout_services.dart';
import 'package:burgerhub/view/order_result_screen.dart';
import 'package:burgerhub/widgets/button/main_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';

import '../../widgets/Checkout/text_form_widget.dart';

final _addressFormKey = GlobalKey<FormState>();

class CheckoutScreen extends StatefulWidget {
  int totalPrice;
  CheckoutScreen({Key? key, required this.totalPrice}) : super(key: key);

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  int selectedIndex = 0;
  String selectedAddressType = 'Home';
  String selectedAddress = '';
  TextEditingController addressController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController flatnumberController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Razorpay razorpay = Razorpay();

  @override
  void initState() {
    CategoryServices().getProducts();
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
      "amount": widget.totalPrice * 100,
      "currency": "INR",
    };
    try {
      razorpay.open(orderDetails);
    } catch (e) {}
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    CheckoutServices().uploadOrdertoDatabase(
        widget.totalPrice, selectedAddress, 'Success', 'Preparing');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderResultScreen(
                  result: 'Order Sucessfull',
                  isPayment: true,
                )));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    CheckoutServices().uploadOrdertoDatabase(
        widget.totalPrice, selectedAddress, 'Cancelled', 'Failed');
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderResultScreen(
                  result: 'Payment Failed',
                  isPayment: false,
                )));
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => OrderResultScreen(
                  result: 'Payment Failed',
                  isPayment: false,
                )));
    // Do something when an external wallet is selected
  }

  @override
  void dispose() {
    razorpay.clear();
    super.dispose();
  }

  // void addressSelected(String defaultAddress) {
  //   selectedAddress = '';
  //   bool isNewAddress = addressController.text.isNotEmpty &&
  //       flatnumberController.text.isNotEmpty &&
  //       phoneController.text.isNotEmpty;
  //   if (isNewAddress) {
  //     if (_addressFormKey.currentState!.validate()) {
  //       selectedAddress =
  //           '${nameController.text}, ${addressController.text},  ${flatnumberController.text},  ${phoneController.text}- ${selectedAddressType} ';
  //     } else {
  //       print('Please fill all the required fields');
  //     }
  //   } else if (defaultAddress.isNotEmpty) {
  //     selectedAddress = defaultAddress;
  //   } else {
  //     throw Exception('Error');
  //   }
  //   print(selectedAddress);
  // }

  @override
  Widget build(BuildContext context) {
    final userData = BlocProvider.of<AuthBloc>(context).state.userData;
    String defaultAddress =
        '${userData!.name}, ${userData.address}, ${userData.phoneNumber}';
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
                    defaultAddress,
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
                    key: _addressFormKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        textformWidget(
                          formTitle: 'Name',
                          controller: nameController,
                        ),
                        textformWidget(
                          formTitle: 'Address',
                          controller: addressController,
                        ),
                        textformWidget(
                          formTitle: 'Flat / House Number',
                          controller: flatnumberController,
                        ),
                        textformWidget(
                          formTitle: 'Phone Number',
                          controller: phoneController,
                        ),
                      ],
                    )),
                BlocConsumer<CheckoutBloc, CheckoutState>(
                  listener: (context, state) {
                    if (state is CheckoutLoaded) {
                      selectedAddress = state.selectedAddress;
                      launchRazorPay();
                      CheckoutServices().getOrderId();
                    }
                  },
                  builder: (context, state) {
                    if (state is CheckoutLoading) {
                      return MainButton(
                        onTap: () {},
                        buttonName: '',
                        isLoading: true,
                      );
                    } else {
                      return MainButton(
                        onTap: () async {
                          context
                              .read<CheckoutBloc>()
                              .add(getSelectedAddressEvent(
                                name: nameController.text,
                                addressFormKey: _addressFormKey,
                                address: addressController.text,
                                addressType: selectedAddressType,
                                flatNumber: flatnumberController.text,
                                phoneNumber: phoneController.text,
                                defaultAddress: defaultAddress,
                              ));
                        },
                        buttonName: 'Place Order',
                      );
                    }
                  },
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}
