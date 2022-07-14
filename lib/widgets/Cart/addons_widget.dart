import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class addonsWidget extends StatelessWidget {
  const addonsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * .09,
      width: screenSize.width / 4,
      child: Column(
        children: [
          Text(
            '- Addons -',
            style: productDescriptionStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
          Container(
            height: 50,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('•'),
                      Text(
                        'Extra Cheese',
                        style: productDescriptionStyle,
                      ),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
