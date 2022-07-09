// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constant.dart';

class textFormWidget extends StatelessWidget {
  String name;
  String hintText;
  TextEditingController textEditingController;
  bool isPass;
  TextInputType keyboardType;
  textFormWidget({
    Key? key,
    required this.name,
    required this.hintText,
    required this.textEditingController,
    required this.isPass,
    required this.keyboardType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                name,
                style: headingStyle.copyWith(
                  color: Colors.black,
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: TextField(
                  keyboardType: keyboardType,
                  obscureText: isPass ? true : false,
                  controller: textEditingController,
                  decoration: InputDecoration(
                    hintText: hintText,
                    hintStyle: productDescriptionStyle.copyWith(
                      fontSize: 15,
                      color: darkTextColor,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
