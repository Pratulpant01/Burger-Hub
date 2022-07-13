// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:burgerhub/constants/constant.dart';

import '../../view/screen_layout.dart';

class SimpleAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  bool hasBackButton;
  bool isEnable;
  SimpleAppBarWidget({
    Key? key,
    this.hasBackButton = false,
    this.isEnable = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: bgSecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            hasBackButton
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: primaryColor,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ScreenLayout(selectedIndex: 1),
                      //   ),
                      // );
                    },
                    icon: Icon(
                      Icons.add,
                      color: bgSecondaryColor,
                    ),
                  ),
            Image.asset(
              'assets/burgerhub.png',
              height: screenSize.height * .5,
              fit: BoxFit.cover,
            ),
            isEnable
                ? IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenLayout(
                            selectedIndex: 0,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.home_outlined,
                      color: primaryColor,
                    ),
                  )
                : IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenLayout(
                            selectedIndex: 2,
                          ),
                        ),
                      );
                    },
                    icon: SvgPicture.asset(
                      'assets/bag.svg',
                      color: primaryColor,
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(70);
}
