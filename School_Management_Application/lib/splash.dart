// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:model_app/main.dart';

// void main() {
//   runApp(MaterialApp(
//     home: splash(),
//     debugShowCheckedModeBanner: false,
//   ));
// }

// class splash extends StatefulWidget {
//   const splash({super.key});

//   @override
//   State<splash> createState() => _splashState();
// }

// class _splashState extends State<splash> {
//   void iniState() {
//     super.initState();
//     Timer(Duration(seconds: 3), () {
//       Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => MyApp(),
//           ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             Image.asset(
//               'images/logonew.jpeg',
//               height: 100,
//               width: 100,
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Text(
//               "Welcome",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 30,
//                 color: Color.fromARGB(255, 77, 0, 57),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
