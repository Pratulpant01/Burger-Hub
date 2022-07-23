import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class textformWidget extends StatelessWidget {
  TextEditingController controller;
  String formTitle;
  textformWidget({
    Key? key,
    required this.controller,
    required this.formTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: Colors.red,
        controller: controller,
        decoration: InputDecoration(
          labelText: formTitle,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
        ),
        autocorrect: false,
      ),
    );
  }
}

class AddressTypeWidget extends StatelessWidget {
  int index;
  AddressTypeWidget({
    Key? key,
    required this.selectedIndex,
    required this.index,
  }) : super(key: key);

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: selectedIndex == index
              ? Colors.red.withOpacity(0.1)
              : Colors.transparent,
          border: Border.all(
            color: selectedIndex == index ? Colors.red : Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            addressType[index],
            style: secondaryTitleStyle.copyWith(
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
