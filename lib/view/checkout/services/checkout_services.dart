import 'package:burgerhub/models/cart_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:uuid/uuid.dart';

class CheckoutServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  Future<List<CartModel>> getOrderedProducts() async {
    List<CartModel> cartProducts = [];
    QuerySnapshot<Map<String, dynamic>> document = await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();
    document.docs.forEach((doc) {
      CartModel cartProduct = CartModel.fromJson(doc.data());
      cartProducts.add(cartProduct);
    });
    return cartProducts;
  }

  Future<String> checkAddressType(
    String name,
    GlobalKey<FormState> addressFormKey,
    String address,
    String addressType,
    String flatNumber,
    String phoneNumber,
    String defaultAddress,
  ) async {
    String selectedAddress = '';
    bool isNewAddress =
        address.isNotEmpty && name.isNotEmpty && phoneNumber.isNotEmpty;
    if (isNewAddress) {
      if (addressFormKey.currentState!.validate()) {
        selectedAddress =
            '${name}, ${address},  ${flatNumber},  ${phoneNumber}- ${addressType} ';
      } else {
        print('Please fill all the required fields');
      }
    } else if (defaultAddress.isNotEmpty) {
      selectedAddress = defaultAddress;
    } else {
      throw Exception('Error');
    }
    return selectedAddress;
  }

  Future<String> uploadAddressinDatabase(String selectedAddress) async {
    String result = 'Something went wrong. Please try again';
    String addressId = Uuid().v1();
    if (selectedAddress != null) {
      await firestore
          .collection('users')
          .doc(userId)
          .collection('address')
          .doc(addressId)
          .set({'address': selectedAddress});
      result = "Address Saved";
    }
    return result;
  }
}
