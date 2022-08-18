// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// class DemoScreen extends StatelessWidget {
//   const DemoScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           border: const Border(
//               top: BorderSide(color: Color(0xFF7FCCDC), width: 3),
//               bottom: BorderSide(color: Color(0xFF7FCCDC), width: 3),
//               left: BorderSide(color: Color(0xFF7FCCDC), width: 3),
//               right: BorderSide(color: Color(0xFF7FCCDC), width: 3)),
//           borderRadius: BorderRadius.circular(20)),
//       child: Column(
//         children: [
//           const SizedBox(height: 15),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Sign in with socials',
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: const Color(0xFF6B6FAB).withOpacity(0.75),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 5),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       color: const Color(0xFF7157A0),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: IconButton(
//                     onPressed: () {
//                       if (kDebugMode) {
//                         print('otp');
//                       }
//                       showBarModalBottomSheet(
//                           context: context,
//                           builder: (context) => const PhoneAuthScreen());
//                     },
//                     icon: FaIcon(FontAwesomeIcons.solidMessage,
//                         color: const Color(0xFFFCFBF4).withOpacity(0.75)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       color: const Color(0xFF7157A0),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: IconButton(
//                     onPressed: () {
//                       if (kDebugMode) {
//                         print('apple');
//                       }
//                       print('AppleAuth.signInWithApple()');
//                     },
//                     icon: FaIcon(FontAwesomeIcons.apple,
//                         color: const Color(0xFFFCFBF4).withOpacity(0.75)),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 8),
//                 child: Container(
//                   height: 60,
//                   width: 60,
//                   decoration: BoxDecoration(
//                       color: const Color(0xFF7157A0),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: IconButton(
//                     onPressed: () {
//                       if (kDebugMode) {
//                         print('google');
//                       }
//                       print('Working..');
//                     },
//                     icon: FaIcon(FontAwesomeIcons.google,
//                         color: const Color(0xFFFCFBF4).withOpacity(0.75)),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 15),
//         ],
//       ),
//     );
//   }
// }
