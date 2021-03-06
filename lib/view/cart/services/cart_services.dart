import 'dart:async';

import 'package:burgerhub/bloc/Add%20Quantity%20Bloc/add_quantity_bloc.dart';
import 'package:burgerhub/models/addon_model.dart';
import 'package:burgerhub/models/cart_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class CartServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String userId = FirebaseAuth.instance.currentUser!.uid;

  int getTotalPrice(int price, int quantity, int totalAddonPrice) {
    int totalPrice = (price * quantity) + totalAddonPrice;

    return totalPrice;
  }

// Problem yaha pe hai

  Future<int> getAddonPrice(List selectedAddons) async {
    int totalAddonPrice = 0;

    for (String addon in selectedAddons) {
      QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
          .collection('addons')
          .where('addonName', isEqualTo: addon)
          .get();

      snapshot.docs.forEach((snap) async {
        AddOnModel addon = AddOnModel.fromJson(snap.data());
        int price = addon.price;
        totalAddonPrice = totalAddonPrice + price;
      });
    }

    return totalAddonPrice;
  }

  Future addProductToCart(
      ProductModel product, int quantity, List addons, int totalPrice) async {
    String userId = firebaseAuth.currentUser!.uid;

    CartModel cartProduct = CartModel(
      productName: product.productName,
      description: product.description,
      price: product.price,
      productId: product.productId,
      rating: product.rating,
      time: product.time,
      category: product.category,
      imageUrl: product.imageUrl,
      type: product.type,
      quantity: quantity,
      totalPrice: totalPrice,
      addonList: addons,
    );

    await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(product.productId)
        .set(cartProduct.getJson());
  }

  Future<int> updateQuantity(int quantity, String productId) async {
    await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(productId)
        .update({
      'quantity': quantity,
    });

    return quantity;
  }

  Future<bool> checkProductinCart(String productId) async {
    bool isProductinCart = false;
    QuerySnapshot<Map<String, dynamic>> snapshot = await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .where('productId', isEqualTo: productId)
        .get();
    if (snapshot.docs.isNotEmpty) {
      isProductinCart = true;
    }
    print(isProductinCart);
    return isProductinCart;
  }

  Future updatePriceinCart(int price, String productId, int quantity) async {
    int totalPrice = price * quantity;
    await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(productId)
        .update({
      'totalPrice': totalPrice,
    });
  }

  Future updateCartProduct(int quantity, ProductModel product) async {
    await CartServices().updateQuantity(quantity, product.productId);
    await CartServices().updatePriceinCart(
      product.price,
      product.productId,
      quantity,
    );
  }

  Future<String> deleteProductFromCart(String productId) async {
    String result = 'Something went wrong';
    await firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(productId)
        .delete();
    result = 'Product removed from cart';

    return result;
  }
}
