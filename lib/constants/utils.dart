import 'dart:typed_data';

import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Utils {
  Future<Uint8List> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: ImageSource.gallery);
    return file!.readAsBytes();
  }

  showSnackBar({required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.white,
        content: Text(
          message,
          style: productDescriptionStyle.copyWith(color: primaryColor),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
