// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:burgerhub/bloc/Admin%20Bloc/admin_bloc.dart';
import 'package:burgerhub/bloc/Product%20Bloc/product_bloc.dart';
import 'package:burgerhub/view/admin/services/admin_services.dart';
import 'package:burgerhub/widgets/button/primary_button.dart';
import 'package:burgerhub/widgets/button/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/constants/utils.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/heading_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/primary_heading_widget.dart';

import '../../../widgets/categoryWidgets/show_selected_category_widget.dart';
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
  TextEditingController timeController = TextEditingController();
  List<String> selectedCategories = [];
  String categoryValue = 'Recommended';
  String foodTypeValue = 'Veg';

  Uint8List? selectedImage;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productNameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    timeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
        isEnable: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: screenSize.height * 1.2,
          width: screenSize.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                controller: timeController,
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
                  if (!selectedCategories.contains(index)) {
                    setState(() {
                      selectedCategories.add(index!);
                    });
                  } else {
                    Utils().showSnackBar(
                        context: context, message: 'Already added');
                  }
                },
              ),
              giveMargin,
              selectedCategories == null
                  ? Container()
                  : Container(
                      height: screenSize.width / 10,
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
                  }),
              BlocBuilder<AdminBloc, AdminState>(
                builder: (context, state) {
                  if (state is ProductUploading) {
                    return secondaryButton(
                      isLoading: true,
                      buttonName: 'Uploading..',
                      onTap: () {},
                    );
                  }

                  return secondaryButton(
                    buttonName: 'Upload Product',
                    onTap: () {
                      context.read<AdminBloc>().add(
                            uploadProductEvent(
                              productName: productNameController.text,
                              description: descriptionController.text,
                              price: priceController.text.isEmpty
                                  ? 0
                                  : int.parse(priceController.text),
                              time: timeController.text,
                              category: selectedCategories,
                              type: foodTypeValue,
                              image: selectedImage!,
                              context: context,
                            ),
                          );
                      if (state is ProductUploaded) {
                        setState(() {
                          productNameController.clear();
                          priceController.clear();
                          timeController.clear();
                          descriptionController.clear();
                          selectedCategories.clear();
                        });
                      }
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
