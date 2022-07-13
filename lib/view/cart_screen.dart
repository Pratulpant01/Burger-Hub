import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(),
      body: Text('Cart Screen'),
    );
  }
}
