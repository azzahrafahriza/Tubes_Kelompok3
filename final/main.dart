import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/pusatBantuan.dart';
import 'package:tubes/faq.dart';
import 'package:tubes/sk.dart';
import 'package:tubes/notifikasi.dart';
import 'package:tubes/promo_dan_berita.dart';
import 'package:tubes/riwayat.dart';
import 'package:tubes/loginpage.dart';
import 'package:tubes/login.dart';
import 'package:tubes/register.dart';
import 'package:tubes/pengajuan.dart';
import 'package:tubes/statusPerpanjangan.dart';
import 'kalkulator.dart';
import 'bayar.dart';
import 'home.dart';
import 'topup.dart';


void main() {
  runApp(MainRouting());
}

class MainRouting extends StatefulWidget {
  const MainRouting({Key? key}) : super(key: key);
  @override
  MainRoutingState createState() {
    return MainRoutingState();
  }
}

class MainRoutingState extends State<MainRouting> {
  int idx = 0;

  static List<Center> halaman = [
    Center(child: Home()),
    Center(child: Promo()),
    Center(child: Kalkulator()),
    Center(child: Riwayat()),
    Center(child: Loginpage()),
  ];

  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "PINJAMYUK",
      routes: {
        "/pusatBantuan": (context) => PusatBantuan(),
        "/home": (context) => MainRouting(),
        "/faq": (context) => Faq(),
        "/sk": (context) => Sk(),
        "/notifikasi": (context) => Notifikasi(),
        "/promo": (context) => (Promo()),
        "/riwayat": (context) => (Riwayat()),
        "/loginpage": (context) => (Loginpage()),
        "/login": (context) => (Login()),
        "/register": (context) => (Register()),
        "/pengajuan": (context) => (Pengajuan()),
        "/statusPerpanjangan": (context) => (StatusPerpanjangan()),
        "/bayar": (context) => (Bayar()),
        "/topup": (context) => (Topup()),
      },
      home: Scaffold(
        body: halaman[idx],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          selectedItemColor: Color(0xffFCA311),
          unselectedItemColor: Color(0xFF14213D),
          onTap: onItemTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.discount), label: "Promo"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined), label: "Kalkulator"),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt), label: "Riwayat"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Akunku"),
          ],
        ),
      ),
    );
  }
}
