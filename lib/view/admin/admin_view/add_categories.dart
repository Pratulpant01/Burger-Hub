import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:flutter/material.dart';

class AddCategories extends StatelessWidget {
  const AddCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
        isEnable: true,
      ),
      body: Container(),
    );
  }
}
