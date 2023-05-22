import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'faq.dart';
import 'sk.dart';
import 'notifikasi.dart';
import 'pusatBantuan.dart';

void main() {
  runApp(MainRouting());
}

class MainRouting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PINJAMDEK",
      routes: {
        "/home": (context) => MyApp(),
      },
      initialRoute: "/home",
    );
  }
}
