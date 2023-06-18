import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/virtualAkunTopup.dart';
import 'pilihTopup.dart';

class FotoAndText {
  final String fotoDanText;

  FotoAndText(this.fotoDanText);
}

class Topup extends StatefulWidget {
  final TopSum jumlah;
  const Topup({required this.jumlah});

  @override
  State<Topup> createState() => _TopupState();
}

class _TopupState extends State<Topup> {
  late TopSum jumlah;

  @override
  void initState() {
    super.initState();
    jumlah = widget.jumlah;
  }

  bool _isExpanded = false;
  bool _isExpanded2 = false;
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(70.0), // Ukuran preferensi AppBar
              child: Container(
                decoration: BoxDecoration(
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
                  elevation: 0, // Hilangkan efek bayangan pada AppBartopup
                  leading: IconButton(
                    padding: EdgeInsets.only(top: 15.0),
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () {
                      Navigator.pushNamed(context, "/pilihTopup");
                    },
                    color: Colors.black,
                    iconSize: 24.0,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Topup',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                          fontSize: 24.0,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color:
                            _isExpanded ? Color(0xffE5E5E5) : Color(0xFF14213D),
                        borderRadius: BorderRadius.circular(30)),
                    child: ExpansionTile(
                      backgroundColor: Colors.transparent,
                      onExpansionChanged: (expanded) {
                        setState(() {
                          _isExpanded = expanded;
                        });
                      },
                      initiallyExpanded: _isExpanded,
                      title: Text(
                        "ATM",
                        style: TextStyle(
                            color:
                                _isExpanded ? Color(0xFF14213D) : Colors.white,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            fontSize: 20),
                      ),
                      children: [
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('bca.png');
                            FotoAndText teks = FotoAndText('BCA');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/bca.png',
                                    width: 60,
                                    height: 15,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "BCA",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('bni.png');
                            FotoAndText teks = FotoAndText('BNI');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/bni.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "BNI",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('mandiri.png');
                            FotoAndText teks = FotoAndText('Mandiri');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/mandiri.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Mandiri",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('bsi.png');
                            FotoAndText teks = FotoAndText('BSI');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/bsi.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "BSI",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, left: 15, right: 15),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: _isExpanded2
                            ? Color(0xffE5E5E5)
                            : Color(0xFF14213D),
                        borderRadius: BorderRadius.circular(30)),
                    child: ExpansionTile(
                      backgroundColor: Colors.transparent,
                      onExpansionChanged: (expanded) {
                        setState(() {
                          _isExpanded2 = expanded;
                        });
                      },
                      initiallyExpanded: _isExpanded2,
                      title: Text(
                        "E-Wallet",
                        style: TextStyle(
                            color:
                                _isExpanded2 ? Color(0xFF14213D) : Colors.white,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            fontSize: 20),
                      ),
                      children: [
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('gopay.png');
                            FotoAndText teks = FotoAndText('Gopay');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/gopay.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Gopay",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('shopeepay.png');
                            FotoAndText teks = FotoAndText('ShopeePay');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/shopeepay.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "ShopeePay",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('dana.png');
                            FotoAndText teks = FotoAndText('Dana');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/dana.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Dana",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FotoAndText foto = FotoAndText('ovo.png');
                            FotoAndText teks = FotoAndText('OVO');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VirtualAkunTopup(
                                  foto: foto,
                                  teks: teks,
                                  jumlah: jumlah,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/ovo.png',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Ovo",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      color: Colors.black),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      );
}
