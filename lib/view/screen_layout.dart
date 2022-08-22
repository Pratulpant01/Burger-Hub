import 'package:burgerhub/bloc/Auth%20Bloc/auth_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/auth/services/auth_services.dart';
import 'package:burgerhub/widgets/AppBar/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenLayout extends StatefulWidget {
  int selectedIndex;

  ScreenLayout({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<ScreenLayout> createState() => _ScreenLayoutState();
}

class _ScreenLayoutState extends State<ScreenLayout> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AuthBloc(RepositoryProvider.of<AuthServices>(context))
            ..add(getUserDataEvent()),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: bgSecondaryColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: primaryColor,
          onTap: (index) {
            setState(() {
              widget.selectedIndex = index;
            });
          },
          currentIndex: widget.selectedIndex,
          items: [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home_outlined,
                color: widget.selectedIndex == 0 ? primaryColor : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Search',
              icon: Icon(
                Icons.search,
                color: widget.selectedIndex == 1 ? primaryColor : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Cart',
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: widget.selectedIndex == 2 ? primaryColor : Colors.grey,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Account',
              icon: Icon(
                color: widget.selectedIndex == 3 ? primaryColor : Colors.grey,
                Icons.account_circle_outlined,
              ),
            ),
          ],
        ),
        body: tabOptions.elementAt(widget.selectedIndex),
      ),
    );
  }
}
