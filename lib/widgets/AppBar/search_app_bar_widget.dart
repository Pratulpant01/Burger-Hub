import 'package:burgerhub/bloc/Search%20Bloc/search_bloc.dart';
import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/view/screen_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SearchAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  TextEditingController searchController = TextEditingController();
  SearchAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: screenSize.width,
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) {
            return TextField(
              controller: searchController,
              cursorColor: primaryColor,
              decoration: InputDecoration(
                icon: Icon(
                  Icons.search,
                  color: primaryColor,
                ),
                hintText: 'Search for your favourite',
                border: InputBorder.none,
              ),
              onSubmitted: (value) {
                context
                    .read<SearchBloc>()
                    .add(SearchProductEvent(searchQuery: value));
              },
            );
          },
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
