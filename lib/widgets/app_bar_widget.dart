import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/screens/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        color: bgSecondaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/search.svg',
                height: screenSize.height * .025,
                color: primaryColor,
              ),
            ),
            Image.asset(
              'assets/burgerhub.png',
              height: screenSize.height * .5,
              fit: BoxFit.cover,
            ),
            IconButton(
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
