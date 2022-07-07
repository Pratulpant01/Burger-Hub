import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class roundButton extends StatelessWidget {
  Icon icon;
  VoidCallback onPressed;
  roundButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 0.7,
      child: CircleAvatar(
        backgroundColor: primaryColor,
        child: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}
