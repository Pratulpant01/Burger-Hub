import 'package:burgerhub/models/addon_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class ProductServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<List> getAddons() async {
    List addonList = [];
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('addons').get();

    snapshot.docs.forEach((snap) {
      AddOnModel addon = AddOnModel.fromJson(snap.data());
      addonList.add(addon);
    });
    return addonList;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() async* {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        firestore.collection('products').snapshots();

    yield* snapshot;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> searchItem(
      String searchText) async* {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = firestore
        .collection('products')
        .where('productName', isGreaterThanOrEqualTo: searchText)
        .snapshots();

    yield* snapshot;
  }
}
