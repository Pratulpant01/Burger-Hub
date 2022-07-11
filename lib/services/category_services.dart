import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryServices {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> uploadCategoryToDataBase(
      String categoryName, String categoryId) async {
    String result = 'Something went wrong';

    try {
      if (categoryName.isNotEmpty && categoryId.isNotEmpty) {
        CategoryModel category = CategoryModel(
          name: categoryName,
          categoryId: categoryId,
        );

        await firestore
            .collection('categories')
            .doc(categoryId)
            .set(category.getJson());
        result = "Category added sucessfully";
      } else {
        result = 'Please fill all the required fields';
      }
    } on FirebaseException catch (e) {
      result = e.message.toString();
    }
    return result;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductsFromDatabase() {
    // List<ProductModel> productList = [];
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot =
        firestore.collection('products').snapshots();

    return snapshot;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductsByCategories(
      String categoryName) {
    Stream<QuerySnapshot<Map<String, dynamic>>> snapshot = firestore
        .collection('products')
        .where('category', arrayContains: categoryName)
        .snapshots();

    return snapshot;
  }
}
