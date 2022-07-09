import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/auth/signin_screen.dart';
import 'package:burgerhub/view/auth/signup_screen.dart';
import 'package:burgerhub/view/product_screen.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Burger Hub',
      theme: ThemeData(
        scaffoldBackgroundColor: bgSecondaryColor,
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, user) {
          if (user.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (user.hasData) {
            return ScreenLayout();
          } else {
            return SignInScreen();
          }
        },
      ),
    );
  }
}
