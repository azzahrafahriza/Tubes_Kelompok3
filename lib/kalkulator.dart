import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class Kalkulator extends StatefulWidget {
  const Kalkulator({super.key});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
          preferredSize: Size.fromHeight(80.0), // Ukuran preferensi AppBar
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0), // Radius melengkung pada sudut kiri bawah
                  bottomRight: Radius.circular(30.0), 
                  // Radius melengkung pada sudut kanan bawah
                ),
                color: Color.fromARGB(255,232,231,231), // Warna latar belakang AppBar
              ),
              child: AppBar(
                backgroundColor: Colors.transparent, // Atur latar belakang AppBar menjadi transparan
                elevation: 0, // Hilangkan efek bayangan pada AppBar
                title: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                    'Kalkulator Pinjaman',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24.0,
                      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: 25),
                    width: MediaQuery.of(context).size.width * 0.93,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width *1.0 ,
                          height: MediaQuery.of(context).size.height * 0.074,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 5,
                                  offset: Offset(2, 3)
                                )
                              ],
                              color: Color(0xFF14213D)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12, 5,0,0),
                              child: Text("Nominal", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 14, color: Colors.white),),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          left: 0,
                          top: 30,
                          bottom: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(17),
                              color: Color(0xFFD9D9D9),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 1,
                                  blurRadius: 10,
                                  offset: Offset(2, 3)
                                )
                              ],
                            ),
                            child: TextField(
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontFamily: GoogleFonts.poppins().fontFamily,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                                letterSpacing: 2
                              ),
                              maxLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Masukkan nominal',
                                hintStyle: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6D6D6D),
                                  letterSpacing: 2
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:25),
                  height: MediaQuery.of(context).size.height * 0.05,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFD9D9D9)
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 2
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'Kode Promo',
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF6D6D6D),
                        letterSpacing: 2
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                // Ini 12 bulan
                Container(
                  margin: EdgeInsets.only(top: 40),
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFF14213D),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        // left: 0,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                            onPressed: (){Navigator.pushNamed(context, '/sk');}, 
                            child: Text("Pinjam Sekarang", style: TextStyle(letterSpacing: 1,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),)
                          ),
                        )
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCA311),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,8,20,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cicilan 12 Bulan", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 16),),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("2.186.640", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("  per bulan", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Text("Total", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Bunga ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("2.60 ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("%", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                          Text("26.239.000 ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  )
                ),
                // Ini 9 Bulan
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFF14213D),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        // left: 0,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                            onPressed: (){Navigator.pushNamed(context, '/sk');},
                            child: Text("Pinjam Sekarang", style: TextStyle(letterSpacing: 1,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),)
                          ),
                        )
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCA311),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,8,20,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cicilan 9 Bulan", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 16),),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("2.280.000", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("  per bulan", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Text("Total", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Bunga ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("2.60 ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("%", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                          Text("20.520.000 ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  )
                ),
                // Ini 6 bulan
                Container(
                  margin: EdgeInsets.only(top: 30),
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFF14213D),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        // left: 0,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                            onPressed: (){Navigator.pushNamed(context, '/sk');},
                            child: Text("Pinjam Sekarang", style: TextStyle(letterSpacing: 1,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),)
                          ),
                        )
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCA311),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,8,20,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cicilan 12 Bulan", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 16),),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("3.853.310", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("  per bulan", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Text("Total", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Bunga ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("2.60 ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("%", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                          Text("23.119.860 ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  )
                ),
                // Ini 3 bulan
                Container(
                  margin: EdgeInsets.only(top: 30, bottom: 30),
                  width: MediaQuery.of(context).size.width * 0.93,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                    color: Color(0xFF14213D),
                    borderRadius: BorderRadius.circular(20)
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        right: 0,
                        // left: 0,
                        child: Container(
                          padding: EdgeInsets.only(bottom: 5),
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: ElevatedButton(
                            style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.transparent)),
                            onPressed: (){Navigator.pushNamed(context, '/sk');},
                            child: Text("Pinjam Sekarang", style: TextStyle(letterSpacing: 1,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),)
                          ),
                        )
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.11,
                          decoration: BoxDecoration(
                            color: Color(0xFFFCA311),
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10,8,20,0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Cicilan 12 Bulan", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 16),),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("6.866.670", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16),),
                                          Text("  per bulan", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Text("Total", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16)),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1.0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text("Bunga ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("2.60 ", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                          Text("%", style: TextStyle(color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily,fontStyle: FontStyle.italic ,fontSize: 12),),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text("Rp. ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                          Text("20.600.010 ", style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily ,fontSize: 16),),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  )
                ),
              ],
            ),
          )
        )
      );
  }
}

