import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'artikel.dart';



class DetailArtikel extends StatefulWidget {
  const DetailArtikel({super.key});

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Container(
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(70.0), // Ukuran preferensi AppBar
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        20.0), // Radius melengkung pada sudut kiri bawah
                    bottomRight: Radius.circular(
                        20.0), // Radius melengkung pada sudut kanan bawah
                  ),
                  color: Color.fromARGB(
                      255, 232, 231, 231), // Warna latar belakang AppBar
                ),
                child: AppBar(
                  leading: IconButton(
                padding: const EdgeInsets.only(top: 15.0),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Artikel()),
                    (route) => false,
                  );
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
                  backgroundColor: Colors
                      .transparent, // Atur latar belakang AppBar menjadi transparan
                  elevation: 0, // Hilangkan efek bayangan pada AppBar
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Detail Artikel',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        fontSize: 24.0,
                        fontFamily: GoogleFonts.poppins().fontFamily
                      ),
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.3,
                  child: Image.asset('asset/square.png', 
                    width: MediaQuery.of(context).size.width*1,
                    height: MediaQuery.of(context).size.height*0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  margin: const EdgeInsets.fromLTRB(20,10,20,10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Nama Berita", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,fontSize: 18, color: Colors.black),),
                      Text("Ditulis pada 19 Mei 2023", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,fontSize: 10, color: Colors.black),),
                    ],
                  )
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Color(0xff14213D)
                  ),
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.5,
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height*0.4,
                          child: SingleChildScrollView(
                            child: Text(
                              "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?",
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
                                fontSize: 12,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                      
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ),
      )
      
      
      ,)
      
    );
  }
}

