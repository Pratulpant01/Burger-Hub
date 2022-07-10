import 'dart:typed_data';

import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class pickImageWidget extends StatelessWidget {
  VoidCallback onTap;
  pickImageWidget({
    Key? key,
    required this.onTap,
    required this.selectedImage,
  }) : super(key: key);

  final Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height / 5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: selectedImage == null
                ? Image.asset(
                    'assets/food_default.png',
                    fit: BoxFit.cover,
                  )
                : Image.memory(
                    selectedImage!,
                    fit: BoxFit.cover,
                  ),
          ),
          Positioned(
            bottom: -10,
            right: -6,
            child: IconButton(
              onPressed: onTap,
              icon: Icon(
                Icons.add_a_photo_outlined,
                color: Colors.grey,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
