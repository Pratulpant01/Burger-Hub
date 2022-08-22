import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/category_model.dart';
import 'package:burgerhub/services/category_services.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:burgerhub/widgets/button/secondary_button.dart';
import 'package:burgerhub/widgets/input%20widgets/primary_heading_widget.dart';
import 'package:burgerhub/widgets/input%20widgets/textForm_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddCategories extends StatelessWidget {
  TextEditingController categoryNameController = TextEditingController();
  TextEditingController categoryIdController = TextEditingController();

  AddCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
        isEnable: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Center(
              child: primaryHeadingWidget(title: 'Add Categories'),
            ),
            giveMargin,
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade400,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              height: screenSize.height,
              child: Column(
                children: [
                  textFormWidget(
                    name: 'Enter Category Name',
                    hintText: 'Category Name',
                    textEditingController: categoryNameController,
                    isPass: false,
                    keyboardType: TextInputType.text,
                  ),
                  textFormWidget(
                    name: 'Enter Category ID',
                    hintText: 'Category ID',
                    textEditingController: categoryIdController,
                    isPass: false,
                    keyboardType: TextInputType.number,
                  ),
                  secondaryButton(
                    buttonName: 'Publish Category',
                    isLoading: false,
                    onTap: () {
                      CategoryServices().uploadCategoryToDataBase(
                        categoryNameController.text,
                        categoryIdController.text,
                      );
                    },
                  ),
                  giveMargin,
                  primaryHeadingWidget(title: 'Added Categories'),
                  Container(
                    height: screenSize.height / 2,
                    width: screenSize.width,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('categories')
                            .snapshots(),
                        builder: (context,
                            AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                                snap) {
                          if (snap.connectionState == ConnectionState.waiting) {
                            return Center(
                              child: CircularProgressIndicator(
                                  color: primaryColor),
                            );
                          }
                          return ListView.builder(
                              itemCount: snap.data!.docs.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                CategoryModel category = CategoryModel.fromJson(
                                    snap.data!.docs[index].data());
                                return ListTile(
                                  leading: Text(category.categoryId),
                                  title: Text(category.name),
                                  trailing: IconButton(
                                    icon: Icon(Icons.close),
                                    onPressed: () {},
                                  ),
                                );
                              });
                        }),
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
