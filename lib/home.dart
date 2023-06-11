import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'main2.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return 
      MaterialApp(
      home: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(70.0),
            child: AppBar(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.black,
                  size: 50,
                ),
              ),
              backgroundColor: const Color(0xffE5E5E5),
              title: Padding(
                padding: const EdgeInsets.only(top:13.0),
                child: Text(
                  'Hi, User',
                  style: TextStyle(
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                  ),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: IconButton(
                    onPressed: () {Navigator.pushNamed(context, "/pusatBantuan");},
                    icon: const Icon(Icons.headset_mic_rounded),
                    color: Colors.black,
                    iconSize: 35,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.04,
                ),
                Padding(
                  padding: const EdgeInsets.only(top:8.0),
                  child: IconButton(
                    onPressed: () {Navigator.pushNamed(context, "/notifikasi");},
                    icon: const Icon(Icons.notifications_active),
                    color: Colors.black,
                    iconSize: 35,
                  ),
                ),
              ],
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30),
              )),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width*0.88,
                  height: MediaQuery.of(context).size.height*0.23,
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.03, left: 23, right: 23),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.53,
                              height: MediaQuery.of(context).size.height*0.11,
                              decoration: const BoxDecoration(
                                color: Color(0xffA76800),
                                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xffA76800),
                                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))
                                    ),
                                    width: MediaQuery.of(context).size.width*0.53,
                                    height: MediaQuery.of(context).size.height*0.04,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)), 
                                        ),
                                        backgroundColor: const Color(0xffA76800)
                                      ),
                                      onPressed: (){Navigator.pushNamed(context, "/pengajuan");},
                                      child: Text("Ajukan Perpanjangan",style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 12, letterSpacing: 1),  ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.35,
                              height: MediaQuery.of(context).size.height*0.11,
                              decoration: const BoxDecoration(
                                color: Color(0xff14213D),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: Color(0xff14213D),
                                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                                    ),
                                    width: MediaQuery.of(context).size.width*0.35,
                                    height: MediaQuery.of(context).size.height*0.04,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)), 
                                        ),
                                        backgroundColor: const Color(0xff14213D)
                                      ),
                                      onPressed: (){Navigator.pushNamed(context, "/bayar");},
                                      child: Text("Bayar",style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 12, letterSpacing: 1),  ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width*1,
                          height: MediaQuery.of(context).size.height*0.19,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xffFCA311)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Pembayaran Pinjaman", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16, color: Colors.white)),
                                Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: [
                                      Text("Rp 2.000.000", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 28, color: Colors.white)),
                                      Text(" / ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 20, color: Colors.white)),
                                      Text("10.000.000", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 18, color: const Color(0xfff9c980))),
                                    ],
                                  ),
                                ),
                                LinearPercentIndicator(
                                  padding: const EdgeInsets.only(top:10, left: 10, right: 10),
                                  lineHeight: 20,
                                  percent: 0.2,
                                  progressColor: const Color(0xffd48300),
                                  backgroundColor: const Color(0xffed970b),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width*1,
                                  margin: const EdgeInsets.only(top: 13, right: 15),
                                  alignment: Alignment.bottomLeft,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("Masa Tenggang : ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 13, color: Colors.white)),
                                      Text("24/04/2023", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 13, color: Colors.white)),
                                    ]
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.06, left: 23, right: 23),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.53,
                        height: MediaQuery.of(context).size.height*0.1,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                          color: Color(0xff339989)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 26),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Saldo", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily, color: Colors.white,fontSize: 16),),
                              Text("Rp. 180.000", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 24, color: Colors.white),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.35,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff2B2C28),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(30))
                              ),
                              height:MediaQuery.of(context).size.height*0.05,
                              width: MediaQuery.of(context).size.width*0.35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(topRight: Radius.circular(30)), 
                                  ),
                                  backgroundColor: const Color(0xff2B2C28)
                                ),
                                onPressed: (){Navigator.pushNamed(context, "/pilihTopup");},
                                child: Text("Topup",style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 12, letterSpacing: 1),  ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xff236D62),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(30))
                              ),
                              height:MediaQuery.of(context).size.height*0.05,
                              width: MediaQuery.of(context).size.width*0.35,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)), 
                                  ),
                                  backgroundColor: const Color(0xff236D62)
                                ),
                                onPressed: (){Navigator.pushNamed(context,"/tarikTunai");},
                                child: Text("Tarik Tunai",style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 12, letterSpacing: 1),  ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.1,
                  width: MediaQuery.of(context).size.width*0.88,
                  margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.06, left: 23, right: 23),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), 
                      ),
                      backgroundColor: const Color(0xfffca311)
                    ),
                    onPressed: (){
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const MainRouting(selectedIndex: 2)),
                        (route) => false,
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.add_circle_outline,
                          color: Color(0xffBF7700),
                          size: 50,
                        ),
                        Text("Lakukan Peminjaman",style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 16, letterSpacing: 1),  ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.2,
                  color: const Color(0xff14213D),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 25,
                          left: 25,
                          bottom: 15
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Promo", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1),),
                            GestureDetector(
                              onTap: (){
                                Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => const MainRouting(selectedIndex: 1)),
                                (route) => false,
                              );
                              },
                              child: Text("Lihat Semua >", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1),)
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, "/detailPromo"),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height*0.13,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network("https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=", 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          height: MediaQuery.of(context).size.height*0.13,
                                          
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:20, bottom:5),
                                            child: Text("Promo Lebaran", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1, decoration: TextDecoration.underline,),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, "/detailPromo"),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height*0.13,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network("https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=", 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          height: MediaQuery.of(context).size.height*0.13,
                                          
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:20, bottom:5),
                                            child: Text("Promo Lebaran", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1, decoration: TextDecoration.underline,),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, "/detailPromo"),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height*0.13,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network("https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=", 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          height: MediaQuery.of(context).size.height*0.13,
                                          
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:20, bottom:5),
                                            child: Text("Promo Lebaran", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1, decoration: TextDecoration.underline,),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
                  width: MediaQuery.of(context).size.width*1,
                  height: MediaQuery.of(context).size.height*0.2,
                  color: const Color(0xff14213D),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 15,
                          right: 25,
                          left: 25,
                          bottom: 15
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Artikel", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1),),
                            GestureDetector(
                              onTap: ()=> Navigator.pushNamed(context, "/artikel"),
                              child: Text("Lihat Semua >", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1),)
                            ),
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.only(left:15.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, "/detailArtikel"),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height*0.13,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network("https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=", 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          height: MediaQuery.of(context).size.height*0.13,
                                          
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:20, bottom:5),
                                            child: Text("Promo Lebaran", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1, decoration: TextDecoration.underline,),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, "/detailArtikel"),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height*0.13,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network("https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=", 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          height: MediaQuery.of(context).size.height*0.13,
                                          
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:20, bottom:5),
                                            child: Text("Promo Lebaran", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1, decoration: TextDecoration.underline,),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.pushNamed(context, "/detailArtikel"),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  width: MediaQuery.of(context).size.width*0.6,
                                  height: MediaQuery.of(context).size.height*0.13,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(30.0),
                                        child: Image.network("https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=", 
                                          fit: BoxFit.cover,
                                          width: MediaQuery.of(context).size.width*0.6,
                                          height: MediaQuery.of(context).size.height*0.13,
                                          
                                        ),
                                      ),
                                      Positioned(
                                        bottom: 0,
                                        child: GestureDetector(
                                          onTap: (){},
                                          child: Padding(
                                            padding: const EdgeInsets.only(left:20, bottom:5),
                                            child: Text("Promo Lebaran", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.white, fontSize: 16, letterSpacing: 1, decoration: TextDecoration.underline,),),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ),
                    ],
                  ),
                )
              ]
            )
          )
      ),
    );
  }
}
