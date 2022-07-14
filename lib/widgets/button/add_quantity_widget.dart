// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/button/round_button.dart';

class addQuantityWidget extends StatefulWidget {
  bool isMargin;
  addQuantityWidget({
    Key? key,
    this.isMargin = false,
  }) : super(key: key);

  @override
  State<addQuantityWidget> createState() => _addQuantityWidgetState();
}

class _addQuantityWidgetState extends State<addQuantityWidget> {
  int value = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.isMargin ? null : EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.red.withOpacity(0.1),
          border: Border.all(
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              setState(() {
                value--;
              });
            },
            icon: Icon(
              Icons.remove,
              color: secondaryColor,
            ),
          ),
          FittedBox(
            child: Container(
              child: Center(
                child: Text(
                  '$value',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              setState(() {
                value++;
              });
            },
            icon: Icon(
              Icons.add,
              color: secondaryColor,
            ),
          )
        ],
      ),
    );
  }
}
