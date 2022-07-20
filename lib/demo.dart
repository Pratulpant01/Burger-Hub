// import 'dart:io';

// import 'package:burgerhub/view/screen_layout.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class Splash extends StatefulWidget {
//   const Splash({Key? key}) : super(key: key);

//   @override
//   State<Splash> createState() => _SplashState();
// }

// class _SplashState extends State<Splash> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Future.delayed(const Duration(seconds: 2), () {
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => const HomePage()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.teal,
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/burgerhub.png',
//               height: 230,
//               width: 230,
//             ),
//             const SizedBox(
//               height: 30,
//             ),
//             if (Platform.isIOS)
//               const CupertinoActivityIndicator(
//                 radius: 15,
//               )
//             else
//               const CircularProgressIndicator(
//                 color: Colors.white,
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.teal,
//         centerTitle: true,
//         title: Text(
//           'Farmacologia Odontológica',
//           style: TextStyle(
//             fontFamily: 'fonts/Quicksand-Light.ttf',
//             fontSize: 22,
//           ),
//         ),
//       ),
//       body: Container(
//         child:
//             Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 10, bottom: 10),
//           ),
//           Text('Classes de Medicamentos',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontFamily: 'fonts/Quicksand-Medium.ttf',
//                 fontSize: 18,
//               )),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ), // issue was here
//             child: Material(
//               child: Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Analgésicos'),
//                   trailing: Column(
//                     children: [
//                       Text(
//                         'Demo Text', // Your text path
//                       ),
//                       Flexible(
//                         child: CircleAvatar(
//                           backgroundColor: Colors.white,
//                           child: Image.asset(
//                             'assets/burgerhub.png', // Your image path
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ),
//             child: Material(
//               child: (Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Anti-inflamatórios'),
//                 ),
//               )),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ),
//             child: Material(
//               child: (Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Antibióticos'),
//                 ),
//               )),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ),
//             child: Material(
//               child: (Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Antifúngicos'),
//                 ),
//               )),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ), // issue was here
//             child: const Material(
//               child: Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Antivirais'),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ), // issue was here
//             child: const Material(
//               child: Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Anti-histamínicos'),
//                 ),
//               ),
//             ),
//           ),
//           GestureDetector(
//             onTap: () => Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => ScreenLayout(),
//               ),
//             ),
//             child: Material(
//               child: (Card(
//                 elevation: 12,
//                 child: ListTile(
//                   title: const Text('Ansiolíticos'),
//                 ),
//               )),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
// }
