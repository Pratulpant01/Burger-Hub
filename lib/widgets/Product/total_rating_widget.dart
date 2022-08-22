// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class totalRatingWidget extends StatelessWidget {
  double size;
  totalRatingWidget({
    Key? key,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Container(
        padding: EdgeInsets.all(size / 2),
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: Row(
          children: [
            Text(
              '3.9',
              style: GoogleFonts.acme(
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.star,
              size: size,
              color: Colors.white,
            )
          ],
        )),
      ),
    );
  }
}
