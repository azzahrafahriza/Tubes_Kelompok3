// import 'package:flutter/material.dart';



// class Promo extends StatefulWidget {
//   const Promo({super.key});

//   @override
//   State<Promo> createState() => _PromoState();
// }

// class _PromoState extends State<Promo> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Scaffold(
//             appBar: PreferredSize(
//               preferredSize: const Size.fromHeight(70.0), // Ukuran preferensi AppBar
//               child: Container(
//                 decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(
//                         20.0), // Radius melengkung pada sudut kiri bawah
//                     bottomRight: Radius.circular(
//                         20.0), // Radius melengkung pada sudut kanan bawah
//                   ),
//                   color: Color.fromARGB(
//                       255, 232, 231, 231), // Warna latar belakang AppBar
//                 ),
//                 child: AppBar(
//                   backgroundColor: Colors
//                       .transparent, // Atur latar belakang AppBar menjadi transparan
//                   elevation: 0, // Hilangkan efek bayangan pada AppBar
//                   title: const Padding(
//                     padding: EdgeInsets.only(top: 15.0),
//                     child: Text(
//                       'Promo',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           letterSpacing: 1.0,
//                           fontSize: 24.0),
//                     ),
//                   ),
//                   centerTitle: true,
//                 ),
//               ),
//             ),
//             body: const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   PromoCard(),
//                 ],
//               ),
//             )));
//   }
// }

// class Rowrowrowtheboat extends StatelessWidget {
//   const Rowrowrowtheboat({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: double.infinity,
//         margin: const EdgeInsets.only(top: 20, bottom: 20),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Container(
//               child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20), // <-- Radius
//                   )),
//                   child: const Padding(
//                     padding: EdgeInsets.only(
//                       top: 30,
//                       bottom: 30,
//                       left: 10,
//                       right: 10,
//                     ),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Icon(Icons.numbers),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Test #1"),
//                         ]),
//                   )),
//             ),
//             Container(
//               child: ElevatedButton(
//                   onPressed: () {},
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20), // <-- Radius
//                   )),
//                   child: const Padding(
//                     padding: EdgeInsets.only(
//                       top: 30,
//                       bottom: 30,
//                       left: 10,
//                       right: 10,
//                     ),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Icon(Icons.alarm_off),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Test #2"),
//                         ]),
//                   )),
//             ),
//             Container(
//               child: ElevatedButton(
//                   onPressed: () => tampilkanDialog(context),
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20), // <-- Radius
//                     ),
//                   ),
//                   child: const Padding(
//                     padding: EdgeInsets.only(
//                       top: 30,
//                       bottom: 30,
//                       left: 10,
//                       right: 10,
//                     ),
//                     child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           Icon(Icons.propane_outlined),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Text("Test #3"),
//                         ]),
//                   )),
//             ),
//           ],
//         ));
//   }
// }

// void tampilkanDialog(BuildContext context) {
//   showDialog<String>(
//     context: context,
//     builder: (BuildContext context) => AlertDialog(
//       title: const Text('Konfirmasi'),
//       content: const Text('Anda yakin membatalkan?'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.pop(context, 'Cancel'),
//           child: const Text('Batal'),
//         ),
//         TextButton(
//           onPressed: () => Navigator.pop(context, 'OK'),
//           child: const Text('OK'),
//         ),
//       ],
//     ),
//   );
// }

// class PromoCard extends StatelessWidget {
//   const PromoCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(20),
//       width: double.infinity,
//       height: 200,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         color: const Color.fromARGB(255, 19, 15, 60),
//         boxShadow: [
//           BoxShadow(
//             color: const Color.fromARGB(255, 245, 185, 73).withOpacity(0.5),
//             spreadRadius: 5,
//             blurRadius: 10,
//             offset: const Offset(5, 5), // changes position of shadow
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           Expanded(
//               child: Container(
//             decoration: const BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20),
//                   bottomLeft: Radius.circular(20)),
//               // image: const DecorationImage(
//               //   image: AssetImage('images/pexels-photo-4498792.jpeg'),
//               //   fit: BoxFit.fill,
//               // ),
//             ),
//             child: Container(
//               decoration: BoxDecoration(
//                 // borderRadius: BorderRadius.circular(20),
//                 gradient: LinearGradient(
//                   begin: Alignment.centerRight,
//                   end: Alignment.center,
//                   colors: [
//                     const Color.fromARGB(255, 241, 170, 5).withOpacity(1),
//                     const Color.fromARGB(255, 241, 170, 5).withOpacity(.3),
//                   ],
//                 ),
//                 borderRadius: const BorderRadius.only(
//                     topLeft: Radius.circular(20),
//                     bottomLeft: Radius.circular(20)),
//               ),
//             ),
//           )),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(20),
//                       bottomRight: Radius.circular(20)),
//                   color: Color.fromARGB(255, 241, 170, 5)),
//               child: const Column(
//                 children: [
//                   SizedBox(
//                     height: 75,
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: EdgeInsets.only(left: 20),
//                         child: Text(
//                           'Promo Lebaran',
//                           style: TextStyle(
//                               fontSize: 25,
//                               color: Colors.white,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: EdgeInsets.only(left: 20, right: 20),
//                       child: Text(
//                         'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed a, at asperiores labore mo di quae. Asperiores, animi dolor ',
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: Colors.white,
//                           fontWeight: FontWeight.w800,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
