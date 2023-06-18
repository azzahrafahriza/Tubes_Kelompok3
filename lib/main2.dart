import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:tubes/pusatBantuan.dart';
import 'package:tubes/faq.dart';
import 'package:tubes/sk.dart';
import 'package:tubes/notifikasi.dart';
import 'promo.dart';
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
import 'artikel.dart';
import 'detailPromo.dart';
import 'detailArtikel.dart';

// class MainRouting extends StatefulWidget {
//   const MainRouting({Key? key}) : super(key: key);
//   @override
//   MainRoutingState createState() {
//     return MainRoutingState();
//   }
// }

class Message {
  final String content;

  Message(this.content);
}

class MainRouting extends StatefulWidget {
  final int selectedIndex;

  const MainRouting({super.key, required this.selectedIndex});

  @override
  MainRoutingState createState() => MainRoutingState();
}

class MainRoutingState extends State<MainRouting> {
  int _currentIndex = 0;

  static List<Center> halaman = [
    const Center(child: Home()),
    const Center(child: Promo()),
    const Center(child: Kalkulator()),
    const Center(child: Profile()),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  void onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FUNDFLEX",
      routes: {
        "/pusatBantuan": (context) => const PusatBantuan(),
        "/home": (context) => const MainRouting(
              selectedIndex: 0,
            ),
        "/faq": (context) => const Faq(),
        "/sk": (context) => const Sk(),
        "/notifikasi": (context) => const Notifikasi(),
        "/promo": (context) => (const Promo()),
        "/pengajuan": (context) => (const Pengajuan()),
        "/statusPerpanjangan": (context) => (const StatusPerpanjangan()),
        "/bayar": (context) => (const Bayar()),
        //"/topup": (context) => (const Topup()),
        "/enterpin": (context) => (const PinEntryApp()),
        "/sukses": (context) => (const Sukses()),
        "/virtualAkunBayar": (context) => (const VirtualAkunBayar()),
        //"/virtualAkunTopup": (context) => (const VirtualAkunTopup()),
        "/pilihTopup": (context) => (const PilihTopup()),
        "/profile": (context) => (const Profile()),
        "/editprofile": (context) => (const EditProfile()),
        "/editdetailprofile": (context) => (const EditDetailProfile()),
        "/tarikTunai": (context) => (const TarikTunai()),
        "/artikel": (context) => (const Artikel()),
        //"/detailArtikel": (context) => (const DetailArtikel()),
      },
      home: Scaffold(
        bottomNavigationBar: Container(
          color: const Color(0xffE5E5E5).withOpacity(0.6),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              selectedIndex: _currentIndex,
              backgroundColor: const Color(0xffE5E5E5).withOpacity(0.6),
              color: const Color(0xff14213D),
              activeColor: const Color(0xff14213D),
              tabBackgroundColor: const Color(0xffFCA311),
              gap: 8,
              padding: const EdgeInsets.all(16),
              onTabChange: (index) {
                onTabChange(index);
              },
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.discount_outlined,
                  text: "Promo",
                ),
                GButton(
                  icon: Icons.calculate_outlined,
                  text: "Calculate",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                ),
              ],
            ),
          ),
        ),
        body: halaman[_currentIndex],
      ),
    );
  }
}
