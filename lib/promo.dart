import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'detailPromo.dart';



class Promo extends StatefulWidget {
  const Promo({super.key});

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {// Rute beranda Promo
        '/detailPromo': (context) => const DetailPromo(), // Rute detailPromo
      },
      home: Container(
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
                  backgroundColor: Colors
                      .transparent, // Atur latar belakang AppBar menjadi transparan
                  elevation: 0, // Hilangkan efek bayangan pada AppBar
                  title: const Padding(
                    padding: EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Promo',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 24.0),
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ),
          body: ListView.builder(
            itemCount: 2,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/detailPromo');
                },
                child: const PromoCard()
              );
            },
          ),
        ),
      )
    );
  }
}

class PromoCard extends StatelessWidget {
  const PromoCard({super.key});
  static const warnaBiru = Color(0xff14213D);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 19, 15, 60),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 245, 185, 73).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.center,
                    colors: [
                      const Color.fromARGB(255, 241, 170, 5).withOpacity(1),
                      const Color.fromARGB(255, 241, 170, 5).withOpacity(.3),
                    ],
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                  ),
                ),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20), // Melengkungkan sisi kiri atas
                    bottomLeft: Radius.circular(20), // Melengkungkan sisi kiri bawah
                  ),
                  child: Image.asset(
                    '../asset/square.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 241, 170, 5)),
              child: Column(
                children:[
                  SizedBox(
                    height: 75,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          'Promo Lebaran',
                          style: TextStyle(
                              fontSize: 22,
                              color: warnaBiru,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily
                          ),
                              
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Sed a, at ',
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 12,
                          color: warnaBiru,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins().fontFamily
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top:20, left: 20, right: 20),
                      child: GestureDetector(
                        onTap: (){},
                        child: Text(
                          'Lihat Selengkapnya >', 
                          style: TextStyle(
                            fontSize: 10,
                            color: warnaBiru,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.poppins().fontFamily
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
