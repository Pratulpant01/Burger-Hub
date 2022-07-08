import 'package:flutter/material.dart';

class foodTypeWidget extends StatelessWidget {
  String foodtype;
  foodTypeWidget({
    required this.foodtype,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.5,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
        decoration: BoxDecoration(
          border: Border.all(
            color: foodtype == 'Veg' ? Colors.green : Colors.red,
          ),
        ),
        child: Icon(
          Icons.circle,
          color:
              foodtype == 'Veg' ? Color.fromARGB(255, 31, 177, 36) : Colors.red,
        ),
      ),
    );
  }
}
