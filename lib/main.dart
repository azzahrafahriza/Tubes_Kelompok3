import 'package:flutter/material.dart';
import 'package:tubes/auth_page.dart';
import 'register.dart';
import 'main2.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const AuthPage(),
      title: "FUNDFLEX",
      // debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => const AuthPage(),
        "/register": (context) => const Register(),
        "/home": (context) => const MainRouting(
              selectedIndex: 0,
            ),
        // "/login":(context)=> Login(),
      },
      initialRoute: "/login",
    );
  }
}
