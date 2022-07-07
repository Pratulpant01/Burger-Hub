import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/button/round_button.dart';
import 'package:flutter/material.dart';

class addQuantityWidget extends StatefulWidget {
  addQuantityWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<addQuantityWidget> createState() => _addQuantityWidgetState();
}

class _addQuantityWidgetState extends State<addQuantityWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          roundButton(
            icon: Icon(
              Icons.remove,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                value--;
              });
            },
          ),
          Container(
            height: screenSize.width * .08,
            width: screenSize.width * .08,
            decoration: BoxDecoration(
              border: Border.all(
                color: primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                '$value',
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
            ),
          ),
          roundButton(
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                value++;
              });
            },
          ),
        ],
      ),
    );
  }
}
