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
      margin: EdgeInsets.symmetric(horizontal: 10),
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
          Container(
            height: screenSize.width * .08,
            width: screenSize.width * .08,
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
