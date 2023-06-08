import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'main2.dart';



void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FUNDFLEX",
      // debugShowCheckedModeBanner: false,
      routes: {
        "/login":(context)=> Login(),
        "/register":(context)=> Register(),
        "/home": (context) => MainRouting(selectedIndex: 0,),
        // "/login":(context)=> Login(),
      },
      initialRoute: "/login",
    );
  }
}




