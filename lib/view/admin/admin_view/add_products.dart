// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/constants/utils.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/primary_heading_widget.dart';

import '../../../widgets/input widgets/secondary_form_widget.dart';
import '../../../widgets/pick_image_widgets.dart';

class AddProductScreen extends StatefulWidget {
  AddProductScreen({Key? key}) : super(key: key);

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  TextEditingController productNameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<String> selectedCategories = [];
  String categoryValue = 'Recommended';
  String foodTypeValue = 'Veg';

  Uint8List? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
        isEnable: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: screenSize.height,
          width: screenSize.width,
          child: Column(
            children: [
              Text(
                'Add New Product',
                style: GoogleFonts.aleo(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              giveMargin,
              pickImageWidget(
                selectedImage: selectedImage,
                onTap: () async {
                  Uint8List temp = await Utils().pickImage();
                  if (temp != null) {
                    setState(() {
                      selectedImage = temp;
                    });
                  }
                },
              ),
              giveMargin,
              secondaryFormWidget(
                heading: 'Enter Product Name',
                keyboardType: TextInputType.text,
                controller: productNameController,
              ),
              secondaryFormWidget(
                heading: 'Enter Product Description',
                keyboardType: TextInputType.text,
                controller: descriptionController,
              ),
              secondaryFormWidget(
                heading: 'Enter Product Price',
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              secondaryFormWidget(
                heading: 'Time',
                keyboardType: TextInputType.number,
                controller: priceController,
              ),
              giveMargin,
              primaryHeadingWidget(title: 'Enter Category'),
              DropdownButton<String>(
                borderRadius: BorderRadius.circular(10),
                isExpanded: true,
                value: categoryValue,
                items: categoriesList
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e.name),
                        value: e.categoryId,
                      ),
                    )
                    .toList(),
                onChanged: (index) {
                  setState(() {
                    categoryValue = index!;
                  });
                  print(index);
                  if (!selectedCategories.contains(index)) {
                    setState(() {
                      selectedCategories.add(index!);
                    });
                  } else {
                    print('Already added');
                  }
                },
              ),
              giveMargin,
              selectedCategories == null
                  ? Container()
                  : Container(
                      height: screenSize.width / 9,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: selectedCategories.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return showSelectedCategoryWidget(
                              selectedCategories: selectedCategories,
                              index: index,
                              onTap: () {
                                setState(() {
                                  selectedCategories.removeAt(index);
                                });
                              },
                            );
                          }),
                    ),
              selectedCategories.isEmpty ? Container() : giveMargin,
              primaryHeadingWidget(title: 'Enter Food Type'),
              DropdownButton<String>(
                  isExpanded: true,
                  value: foodTypeValue,
                  items: [
                    DropdownMenuItem(
                      child: Text('Veg'),
                      value: 'Veg',
                    ),
                    DropdownMenuItem(
                      child: Text('Non Veg'),
                      value: 'Non Veg',
                    )
                  ],
                  onChanged: (index) {
                    setState(() {
                      foodTypeValue = index!;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}

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
