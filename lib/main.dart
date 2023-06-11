import 'package:flutter/material.dart';
import 'login.dart';
import 'register.dart';
import 'main2.dart';



void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FUNDFLEX",
      // debugShowCheckedModeBanner: false,
      routes: {
        "/login":(context)=> const Login(),
        "/register":(context)=> const Register(),
        "/home": (context) => const MainRouting(selectedIndex: 0,),
        // "/login":(context)=> Login(),
      },
      initialRoute: "/login",
    );
  }
}




