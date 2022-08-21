import 'package:burgerhub/constants/constant.dart';
import 'package:burgerhub/models/order_model.dart';
import 'package:burgerhub/widgets/AppBar/simple_appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class YourOrderScreen extends StatelessWidget {
  const YourOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String currentUser = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      appBar: SimpleAppBarWidget(
        hasBackButton: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Text(
                'Your Orders',
                style: headingStyle.copyWith(
                  color: primaryColor,
                  fontSize: 20,
                ),
              ),
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where('buyerId', isEqualTo: currentUser)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ExpansionTile(
                          textColor: primaryColor,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Order No. ${index}',
                                    style: productTitleStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: screenSize.height * .02,
                                  ),
                                  Text(
                                    DateFormat('dd-MM-yyyy').format(snapshot
                                        .data!.docs[index]
                                        .data()['orderedAt']
                                        .toDate()),
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade600,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                child: CircleAvatar(
                                  radius: screenSize.height * .03,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage:
                                      AssetImage('assets/myorder.png'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                })
          ],
        ),
      ),
    );
  }
}
