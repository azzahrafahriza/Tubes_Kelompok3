import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PusatBantuan extends StatefulWidget {
  const PusatBantuan({super.key});
  
  @override
  State<PusatBantuan> createState() => _PusatBantuanState();
}

class _PusatBantuanState extends State<PusatBantuan> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              elevation: 0, // Hilangkan efek bayangan pada AppBar
              leading: IconButton(
                padding: EdgeInsets.only(top: 15.0),
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Pusat Bantuan',
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
        body: Center(
          child: Column(children: [
            Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // Warna teks
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins()
                            .fontFamily), // Mengatur ukuran font
                    fixedSize:
                        Size(450, 100), // Mengatur tinggi dan lebar tombol
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(90.0), // Border radius
                    ),
                    backgroundColor:
                        Color(0xFFFCA311), // Mengatur jarak ikon dan label
                  ).merge(ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(50))),
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Icon(
                      Icons.phone_callback_sharp,
                      color: Color(0xFF231F20),
                    ),
                  ),
                  label: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("Hubungi kami di 081290161938"),
                  ),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // Warna teks
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins()
                            .fontFamily), // Mengatur ukuran font
                    fixedSize:
                        Size(450, 100), // Mengatur tinggi dan lebar tombol
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(90.0), // Border radius
                    ),
                    backgroundColor:
                        Color(0xFFFCA311), // Mengatur jarak ikon dan label
                  ).merge(ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(50))),
                  onPressed: () {},
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                    child: Icon(
                      Icons.wechat_sharp,
                      color: Color(0xFF14213D),
                    ),
                  ),
                  label: Align(
                      alignment: Alignment.centerLeft, child: Text("WhatsApp")),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // Warna teks
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins()
                            .fontFamily), // Mengatur ukuran font
                    fixedSize:
                        Size(450, 100), // Mengatur tinggi dan lebar tombol
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(90.0), // Border radius
                    ),
                    backgroundColor:
                        Color(0xFFFCA311), // Mengatur jarak ikon dan label
                  ).merge(ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(50))),
                  onPressed: () {
                    Navigator.pushNamed(context, "/faq");
                  },
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                    child: Icon(
                      Icons.question_mark_sharp,
                      color: Color(0xFF14213D),
                    ),
                  ),
                  label: Align(
                      alignment: Alignment.centerLeft, child: Text("FAQ")),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    // Warna teks
                    textStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins()
                            .fontFamily), // Mengatur ukuran font
                    fixedSize:
                        Size(450, 100), // Mengatur tinggi dan lebar tombol
                    padding: EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0), // Padding
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(90.0), // Border radius
                    ),
                    backgroundColor:
                        Color(0xFF14213D), // Mengatur jarak ikon dan label
                  ).merge(ButtonStyle(
                      iconSize: MaterialStateProperty.all<double>(50))),
                  onPressed: () {
                    Navigator.pushNamed(context, "/sk");
                  },
                  icon: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 30, 20),
                    child: Icon(
                      Icons.close,
                      color: Color(0xFFFCA311),
                    ),
                  ),
                  label: Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Hapus Akun")),
                )),
          ]),
        ),
      ),
    );
  }
}
