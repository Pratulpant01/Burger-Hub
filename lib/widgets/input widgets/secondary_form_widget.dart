import 'package:burgerhub/widgets/input%20widgets/primary_heading_widget.dart';
import 'package:flutter/material.dart';

class secondaryFormWidget extends StatelessWidget {
  String heading;
  TextInputType keyboardType;
  TextEditingController controller;
  secondaryFormWidget({
    Key? key,
    required this.heading,
    required this.keyboardType,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          primaryHeadingWidget(title: heading),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
