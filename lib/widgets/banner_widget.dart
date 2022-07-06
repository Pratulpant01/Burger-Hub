import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class bannerWidget extends StatefulWidget {
  bannerWidget({
    Key? key,
    required this.selectedBanner,
  }) : super(key: key);

  int selectedBanner;

  @override
  State<bannerWidget> createState() => _bannerWidgetState();
}

class _bannerWidgetState extends State<bannerWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (index) {
        if (widget.selectedBanner == bannerImages.length - 1) {
          widget.selectedBanner = -1;
        }
        setState(() {
          widget.selectedBanner++;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        height: screenSize.height / 8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: bgSecondaryColor,
            width: 1,
          ),
          image: DecorationImage(
            image: NetworkImage(
              bannerImages[widget.selectedBanner],
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
