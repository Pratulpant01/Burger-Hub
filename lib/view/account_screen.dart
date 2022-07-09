import 'package:burgerhub/widgets/button/secondary_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: secondaryButton(
          buttonName: 'Log out',
          onTap: () {
            FirebaseAuth.instance.signOut();
          },
        ),
      ),
    );
  }
}
