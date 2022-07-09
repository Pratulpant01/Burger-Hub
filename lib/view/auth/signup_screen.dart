// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/view/auth/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:burgerhub/constants/constant.dart';

import '../../widgets/button/secondary_button.dart';
import '../../widgets/input widgets/textForm_widget.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    top: 15,
                  ),
                  child: Center(
                    child: Hero(
                      tag: 2,
                      child: Image.asset(
                        'assets/burgerhub.png',
                        height: screenSize.height / 6,
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
                  height: screenSize.height / 1.6,
                  child: Column(
                    children: [
                      textFormWidget(
                        keyboardType: TextInputType.name,
                        name: 'Name',
                        textEditingController: nameController,
                        hintText: 'Enter your Name',
                        isPass: false,
                      ),
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
                      textFormWidget(
                        keyboardType: TextInputType.text,
                        name: 'Address',
                        textEditingController: addressController,
                        hintText: 'Home / Apartment No. / Address',
                        isPass: false,
                      ),
                      textFormWidget(
                        keyboardType: TextInputType.phone,
                        name: 'Phone Number',
                        textEditingController: phoneNumberController,
                        hintText: 'Enter your phone number',
                        isPass: false,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenSize.height * .01,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Already Have an account? Login',
                    style: productTitleStyle.copyWith(
                      color: Colors.black,
                    ),
                  ),
                ),
                BlocBuilder<AuthBloc, AuthState>(
                  builder: (context, state) {
                    return secondaryButton(
                      buttonName: 'Register Now!',
                      isLoading: state is AuthBlocLoading ? true : false,
                      onTap: () async {
                        context.read<AuthBloc>().add(
                              registerUserEvent(
                                emailId: emailController.text,
                                name: nameController.text,
                                password: passwordController.text,
                                address: addressController.text,
                                phoneNumber: phoneNumberController.text,
                              ),
                            );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
