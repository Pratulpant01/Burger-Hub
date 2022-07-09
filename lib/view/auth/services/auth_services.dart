import 'package:burgerhub/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<String> registerUser(
    String email,
    String name,
    String password,
    String address,
    String phoneNumber,
  ) async {
    String result = 'Something went wrong';

    if (email != null &&
        password != null &&
        address != null &&
        phoneNumber != null) {
      try {
        UserCredential userData = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        UserModel user = UserModel(
          name: name,
          address: address,
          phoneNumber: phoneNumber,
          role: 'User',
        );

        await firestore
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set(user.getJson());

        result = 'Registered Sucessfully';
      } on FirebaseAuthException catch (e) {
        result = e.message.toString();
      }
    } else {
      result = 'Please fill all the required field';
    }

    return result;
  }

  Future signInUser(String email, String password) async {
    String result = 'Something went wrong';
    if (email != '' && password != '') {
      try {
        await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        result = 'Login Sucessfully';
      } on FirebaseAuthException catch (e) {
        result = e.message.toString();
      }
    } else {
      result = 'Please fill all the required field';
    }
    return result;
  }
}
