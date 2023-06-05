import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tubes/pusatBantuan.dart';
import 'package:tubes/faq.dart';
import 'package:tubes/sk.dart';
import 'package:tubes/notifikasi.dart';
import 'package:tubes/promo_dan_berita.dart';
import 'package:tubes/pengajuan.dart';
import 'package:tubes/statusPerpanjangan.dart';
import 'kalkulator.dart';
import 'bayar.dart';
import 'home.dart';
import 'topup.dart';
import 'enterPIN.dart';
import 'success.dart';
import 'virtualAkunBayar.dart';
import 'virtualAkunTopup.dart';
import 'pilihTopup.dart';
import 'profile.dart';
import 'editprofile.dart';
import 'ubah_akun_detail.dart';
import 'tarikTunai.dart';


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
    Center(child: Profile()),
  ];

  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  void onTabChange(int index) {
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
        "/pengajuan": (context) => (Pengajuan()),
        "/statusPerpanjangan": (context) => (StatusPerpanjangan()),
        "/bayar": (context) => (Bayar()),
        "/topup": (context) => (Topup()),
        "/enterpin": (context) => (PinEntryApp()),
        "/sukses": (context) => (Sukses()),
        "/virtualAkunBayar": (context) => (VirtualAkunBayar()),
        "/virtualAkunTopup": (context) => (VirtualAkunTopup()),
        "/pilihTopup": (context) => (PilihTopup()),
        "/profile": (context) => (Profile()),
        "/editprofile": (context) => (EditProfile()),
        "/editdetailprofile": (context) => (EditDetailProfile()),
        "/tarikTunai": (context) => (TarikTunai()),
      },
      home: Scaffold(
        bottomNavigationBar: Container(
          color: Color(0xffE5E5E5).withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10
            ),
            child: GNav(
              backgroundColor: Color(0xffE5E5E5).withOpacity(0.6),
              color: Color(0xff14213D),
              activeColor: Colors.white,
              tabBackgroundColor: Color(0xffFCA311),
              gap: 8,
              padding: EdgeInsets.all(16),
              onTabChange: (index){
                onTabChange(index);
              },
              tabs: [ 
                GButton(icon: Icons.home, text: "Home",),
                GButton(icon: Icons.discount_outlined, text: "Promo",),
                GButton(icon: Icons.calculate_outlined, text: "Calculate",),
                GButton(icon: Icons.person, text: "Profile",),
              ],
            ),
          ),
        ),
        body: halaman[idx],
      ),
    );
  }
}
