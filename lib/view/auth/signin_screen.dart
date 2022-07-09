import 'package:burgerhub/view/auth/services/auth_services.dart';
import 'package:burgerhub/view/auth/signup_screen.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constant.dart';
import '../../widgets/button/secondary_button.dart';
import '../../widgets/input widgets/textForm_widget.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SizedBox(
          height: screenSize.height,
          width: screenSize.width,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/bg.png',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Center(
                    child: Hero(
                      tag: 2,
                      child: Image.asset(
                        'assets/burgerhub.png',
                        height: screenSize.height / 5,
                      ),
                    ),
                  ),
                ),
                Text(
                  'It\'s Burger \'o clock....',
                  style: GoogleFonts.atma(
                    color: darkTextColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Container(
                  height: screenSize.height / 4,
                  width: screenSize.width,
                  child: Column(
                    children: [
                      textFormWidget(
                        keyboardType: TextInputType.emailAddress,
                        name: 'Email',
                        textEditingController: emailController,
                        hintText: 'Enter your email id',
                        isPass: false,
                      ),
                      textFormWidget(
                        keyboardType: TextInputType.text,
                        name: 'Password',
                        textEditingController: passwordController,
                        hintText: 'Enter your password',
                        isPass: true,
                      ),
                    ],
                  ),
                ),
                secondaryButton(
                  buttonName: 'Login Now!',
                  onTap: () async {
                    String result = await AuthServices().signInUser(
                      emailController.text,
                      passwordController.text,
                    );
                    if (result == 'Login Sucessfully') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenLayout(),
                        ),
                      );
                    } else {
                      print(result);
                    }
                  },
                ),
                SizedBox(
                  height: screenSize.height * .02,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignUpScreen(),
                      ),
                    );
                  },
                  child: Text(
                    'New to BurgerHub? Register Now',
                    style: productTitleStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
