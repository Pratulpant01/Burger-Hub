import 'package:burgerhub/constants/constant.dart';
import 'package:flutter/material.dart';

class addon_widget extends StatelessWidget {
  AsyncSnapshot snapshot;
  int index;
  addon_widget({
    Key? key,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  contentPadding: EdgeInsets.all(0),
                  content: Container(
                    width: screenSize.width / 3,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView.builder(
                        itemCount: snapshot.data!.docs[index]
                            .data()['addonList']
                            .length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index2) {
                          return ListTile(
                            title: Text(
                              snapshot.data!.docs[index].data()['addonList']
                                  [index2],
                              style: categoryTitleStyle.copyWith(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.close),
                              onPressed: () {},
                            ),
                          );
                        }),
                  ),
                );
              });
        },
        child: Row(
          children: [
            Text(
              'Addons',
              style: productDescriptionStyle.copyWith(
                color: Colors.red.shade700,
              ),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.red.shade700,
            )
          ],
        ));
  }
}
