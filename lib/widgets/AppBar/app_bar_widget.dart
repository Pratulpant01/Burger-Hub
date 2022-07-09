import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppBarWidget extends StatelessWidget with PreferredSizeWidget {
  bool hasBackButton;
  AppBarWidget({Key? key, this.hasBackButton = false}) : super(key: key);

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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenLayout(selectedIndex: 1),
                        ),
                      );
                    },
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
