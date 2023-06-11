import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class Pengajuan extends StatefulWidget {
  const Pengajuan({Key? key}) : super(key: key);

  @override
  State<Pengajuan> createState() => _PengajuanState();
}

class _PengajuanState extends State<Pengajuan> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) =>
  MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), // Ukuran preferensi AppBar
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0), // Radius melengkung pada sudut kiri bawah
                  bottomRight: Radius.circular(20.0), 
                  // Radius melengkung pada sudut kanan bawah
                ),
                color: Color.fromARGB(255,232,231,231), // Warna latar belakang AppBar
              ),
              child: AppBar(
                backgroundColor: Colors.transparent, // Atur latar belakang AppBar menjadi transparan
                elevation: 0, // Hilangkan efek bayangan pada AppBar
                leading: IconButton(
                  padding: const EdgeInsets.only(top: 15.0),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  color: Colors.black,
                  iconSize: 24.0,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'Ajukan Perpanjangan',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 24.0,
                      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 30),
              width: MediaQuery.of(context).size.width * 1.0,
              height: MediaQuery.of(context).size.height * 0.30,
              
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    left: 40.70,
                    right: 40.70,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.10,
                      decoration: const BoxDecoration(
                        color: Color(0xFF14213D),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(2, 3)
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 0, 0),
                        child: Text(
                          "Alasan Perpanjangan Pembayaran",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 40.0,
                    right: 40.0,
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.90,
                      height: MediaQuery.of(context).size.height * 0.10,
                      decoration: const BoxDecoration(
                        color: Color(0xFFD9D9D9),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(2, 3)
                          )
                        ]
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                        child: TextField(
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: 'Ketik disini ...',
                            hintStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: const Color(0xFF6D6D6D),
                            ),
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.transparent),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.only(top:30),
              width: MediaQuery.of(context).size.width * 0.90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: Text("Durasi Perpanjangan", style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                )),
                  ),
                  RadioListTile(
                    title: const Text('1 Minggu'),
                    value: 1,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = 1;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  ),
                  RadioListTile(
                    title: const Text('1 Bulan'),
                    value: 2,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = 2;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('3 Bulan'),
                    value: 3,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = 3;
                      });
                    },
                  ),
                  RadioListTile(
                    title: const Text('Lainnya'),
                    value: 4,
                    groupValue: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = 4;
                      });
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.05,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xFFD9D9D9),
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
                      hintText: 'Masukkan durasi perpanjangan',
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF6D6D6D),
                        letterSpacing: 2
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.25,
              width: MediaQuery.of(context).size.width * 0.90,
              child: Stack(
                children: [
                  // Konten lainnya
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      height: 45,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFFCA311)),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0), // Atur radius lengkungan di sini
                            ),
                          ),
                        ),
                        onPressed: () {
                          // Aksi yang dijalankan saat tombol ditekan
                        },
                        child: Text('Ajukan',
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 3
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
}


