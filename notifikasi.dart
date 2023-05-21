import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'notifikasiKanan.dart';
import 'notifikasiKiri.dart';

class Notifikasi extends StatefulWidget {
  const Notifikasi({super.key});

  @override
  State<Notifikasi> createState() => _NotifikasiState();
}

class _NotifikasiState extends State<Notifikasi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
            ),
            backgroundColor: Color.fromARGB(255,232,231,231),
            leading: IconButton(
            padding: EdgeInsets.only(top:25.0),
            icon: Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: () {
                Navigator.pushNamed(context, "/pusatBantuan");
              },
              color: Colors.black,
              iconSize: 24.0,
            ),
            title: Padding(
              padding: const EdgeInsets.only(top:25),
              child: Text('Notifikasi', 
                style: TextStyle(
                  fontFamily: GoogleFonts.poppins().fontFamily,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
              ),
            ),
            bottom: TabBar(
              padding: EdgeInsets.only(top:25),
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 100.0),
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0), // Ubah nilai sesuai keinginan
                      color: Color(0xFFE8C9C9)
                    ),
                    child: InkWell(
                      onTap: () {
                      },
                      hoverColor: Colors.transparent,
                      child: Center(child: Text('Promo', 
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      )),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.0), // Ubah nilai sesuai keinginan
                      color: Color(0xFFE8C9C9)
                    ),
                    child: InkWell(
                      onTap: () {
                      },
                      hoverColor: Colors.transparent,
                      child: Center(child: Text('Konfirmasi', 
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black
                        ),
                      )),
                    ),
                  ),
                ),
              ],
            ),
            centerTitle: true,
          ),
          body: TabBarView(
              children: [
                NotifikasiKiri(),
                NotifikasiKanan()
            ],
            )
          )
        )
    );
  }
}