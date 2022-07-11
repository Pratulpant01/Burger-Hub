import 'package:flutter/material.dart';

import '../../constants/constant.dart';

class showSelectedCategoryWidget extends StatelessWidget {
  int index = 0;
  VoidCallback onTap;
  showSelectedCategoryWidget({
    Key? key,
    required this.index,
    required this.onTap,
    required this.selectedCategories,
  }) : super(key: key);

  final List<String> selectedCategories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: FittedBox(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              selectedCategories[index],
              maxLines: 1,
              style: categoryTitleStyle.copyWith(
                color: Colors.black,
                fontSize: 12,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
