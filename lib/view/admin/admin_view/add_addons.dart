import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/button/secondary_button.dart';
import 'package:burgerhub/widgets/input%20widgets/textForm_widget.dart';
import 'package:flutter/material.dart';

class AddAddons extends StatelessWidget {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _idController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  AddAddons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
        isEnable: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: screenSize.height / 2,
          width: screenSize.width,
          child: Column(
            children: [
              Center(
                child: Text(
                  'Add Addons',
                  style: labelTitleStyle.copyWith(fontSize: 20),
                ),
              ),
              textFormWidget(
                name: 'Addon Name',
                hintText: 'Enter addon name',
                textEditingController: _nameController,
                isPass: false,
                keyboardType: TextInputType.text,
              ),
              textFormWidget(
                name: 'Addon Price',
                hintText: 'Enter addon price',
                textEditingController: _priceController,
                isPass: false,
                keyboardType: TextInputType.number,
              ),
              textFormWidget(
                name: 'Addon Id',
                hintText: 'Enter addon id',
                textEditingController: _idController,
                isPass: false,
                keyboardType: TextInputType.text,
              ),
              secondaryButton(
                buttonName: 'Publish Addons',
                onTap: () => () {},
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
