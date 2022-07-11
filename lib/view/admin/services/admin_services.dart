import 'dart:typed_data';

import 'package:burgerhub/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class AdminServices {
  FirebaseStorage storage = FirebaseStorage.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> uploadImageToStorage(
      Uint8List image, String productUid) async {
    Reference storageRef =
        await storage.ref().child('products').child(productUid);
    UploadTask uploadFile = storageRef.putData(image);
    TaskSnapshot taskSnapshot = await uploadFile;
    Future<String> imageUrl = taskSnapshot.ref.getDownloadURL();

    return imageUrl;
  }

  Future<String> uploadProductToDatabase({
    required String productName,
    required String description,
    required int price,
    required String time,
    required List category,
    required String type,
    required Uint8List image,
  }) async {
    String result = 'Something went wrong';

    if (productName != '' &&
        description != '' &&
        price != null &&
        time != '' &&
        category != '' &&
        type != '' &&
        image.isNotEmpty) {
      String productId = Uuid().v1();
      String imgUrl =
          await AdminServices().uploadImageToStorage(image, productId);

      ProductModel product = ProductModel(
        productName: productName,
        description: description,
        price: price,
        productId: productId,
        rating: 5,
        time: time,
        category: category,
        imageUrl: imgUrl,
        type: type,
      );

      await firestore
          .collection('products')
          .doc(productId)
          .set(product.getJson());
      result = 'Product Uploaded Sucessfully';
    } else {
      result = 'Please enter all the required fields';
    }
    return result;
  }
}
