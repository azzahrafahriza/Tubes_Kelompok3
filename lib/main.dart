import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'main2.dart';
// import 'notifikasiKanan.dart';
// import 'notifikasiKiri.dart';



void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PINJEMYUK",
      routes: {
        "/login":(context)=> Login(),
        "/register":(context)=> Register(),
        "/home": (context) => MainRouting(),
        // "/login":(context)=> Login(),
      },
      initialRoute: "/login",
    )
    
    ;
  }
}
