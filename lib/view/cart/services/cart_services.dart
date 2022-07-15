import 'package:burgerhub/models/cart_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class CartServices {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  int getTotalPrice(int price, int quantity) {
    int totalPrice = price * quantity;

    return totalPrice;
  }

  Future addProductToCart(
      ProductModel product, int quantity, List addons) async {
    String userId = firebaseAuth.currentUser!.uid;
    int totalPrice = CartServices().getTotalPrice(product.price, quantity);

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
}
