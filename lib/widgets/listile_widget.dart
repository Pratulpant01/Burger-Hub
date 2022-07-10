import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class ListTileWidget extends StatelessWidget {
  String name;
  IconData icon;
  VoidCallback onTap;
  ListTileWidget({
    Key? key,
    required this.name,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: secondaryColor,
            ),
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: secondaryColor,
          ),
          title: Text(
            name,
            style: productDescriptionStyle.copyWith(fontSize: 18),
          ),
          trailing: Image.network(
            'https://static.thenounproject.com/png/1018581-200.png',
            color: secondaryColor,
            height: 20,
          ),
        ),
      ),
    );
  }
}
