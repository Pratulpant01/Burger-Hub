// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:burgerhub/services/category_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:burgerhub/constants/constant.dart';

class categoryShowcase extends StatefulWidget {
  int selectedIndex;

  categoryShowcase({
    Key? key,
    this.selectedIndex = -1,
  }) : super(key: key);

  @override
  State<categoryShowcase> createState() => _categoryShowcaseState();
}

class _categoryShowcaseState extends State<categoryShowcase> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenSize.height * .05,
      child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('categories').snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: primaryColor),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FittedBox(
                    child: GestureDetector(
                      onTap: () {
                        setState(
                          () {
                            widget.selectedIndex = index;
                          },
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        height: screenSize.height * .06,
                        decoration: BoxDecoration(
                            color: widget.selectedIndex == index
                                ? Colors.red
                                : Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey.shade400)),
                        child: Center(
                          child: Text(
                            snapshot.data!.docs[index].data()['name'],
                            style: categoryTitleStyle.copyWith(
                              color: widget.selectedIndex == index
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                });
          }),
    );
  }
}
