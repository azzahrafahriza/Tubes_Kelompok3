import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tubes/bloc.dart';
import 'package:tubes/sk.dart';

class Counting {
  var total_3 = 0;
  var total_6 = 0;
  var total_9 = 0;
  var total_12 = 0;
  var _3bulan = 0;
  var _6bulan = 0;
  var _9bulan = 0;
  var _12bulan = 0;

  void count(var ajuan) {
    total_3 = ajuan + (ajuan * 2.00 / 100);
    _3bulan = total_3 ~/ 3;

    total_6 = ajuan + (ajuan * 2.50 / 100);
    _6bulan = total_6 ~/ 6;

    total_9 = ajuan + (ajuan * 3.00 / 100);
    _9bulan = total_9 ~/ 9;

    total_12 = ajuan + (ajuan * 3.50 / 100);
    _12bulan = total_12 ~/ 12;
  }
}

class Kalkulator extends StatefulWidget {
  var kode;
  Kalkulator({super.key, required this.kode});

  @override
  State<Kalkulator> createState() => _KalkulatorState();
}

class _KalkulatorState extends State<Kalkulator> {
  Counting pilihan_ajuan = Counting();
  var _nominal = TextEditingController();
  var _kode = TextEditingController();
  var curDate = DateTime.now();
  var potongan = 0;

  @override
  void initState() {
    super.initState();
    _kode.text = widget.kode;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(80.0), // Ukuran preferensi AppBar
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                        30.0), // Radius melengkung pada sudut kiri bawah
                    bottomRight: Radius.circular(30.0),
                    // Radius melengkung pada sudut kanan bawah
                  ),
                  color: Color.fromARGB(
                      255, 232, 231, 231), // Warna latar belakang AppBar
                ),
                child: AppBar(
                  backgroundColor: Colors
                      .transparent, // Atur latar belakang AppBar menjadi transparan
                  elevation: 0, // Hilangkan efek bayangan pada AppBar
                  title: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Text(
                      'Kalkulator Pinjaman',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24.0,
                          fontFamily:
                              GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                  .fontFamily),
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
                      margin: const EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: Stack(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1.0,
                            height: MediaQuery.of(context).size.height * 0.074,
                            child: DecoratedBox(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 5,
                                        offset: const Offset(2, 3))
                                  ],
                                  color: const Color(0xFF14213D)),
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(12, 5, 0, 0),
                                child: Text(
                                  "Nominal",
                                  style: TextStyle(
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w500)
                                          .fontFamily,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                              right: 0,
                              left: 0,
                              top: 30,
                              bottom: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(17),
                                  color: const Color(0xFFD9D9D9),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 1,
                                        blurRadius: 10,
                                        offset: const Offset(2, 3))
                                  ],
                                ),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  textInputAction: TextInputAction.go,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _nominal,
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      letterSpacing: 2),
                                  maxLines: 1,
                                  decoration: InputDecoration(
                                    hintText: 'Masukkan nominal',
                                    hintStyle: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xFF6D6D6D),
                                        letterSpacing: 2),
                                    border: InputBorder.none,
                                  ),
                                  onSubmitted: (value) {
                                    var nom = int.parse(_nominal.text);
                                    pilihan_ajuan.count(nom);
                                    setState(() {});
                                  },
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 25),
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xFFD9D9D9)),
                    child: TextField(
                      controller: _kode,
                      textInputAction: TextInputAction.go,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          letterSpacing: 2),
                      maxLines: 1,
                      decoration: InputDecoration(
                        hintText: 'Kode Promo',
                        hintStyle: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF6D6D6D),
                            letterSpacing: 2),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (value) {
                        potongan = context
                            .read<PeminjamanBerjalanCubit>()
                            .getPotongan(_kode.text);
                      },
                    ),
                  ),
                  // Ini 12 bulan
                  Container(
                      margin: const EdgeInsets.only(top: 40),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          color: const Color(0xFF14213D),
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Sk(
                                                jumlah_pinjaman:
                                                    int.parse(_nominal.text),
                                                jumlah_tagihan:
                                                    pilihan_ajuan.total_3,
                                                tagihan_bulanan:
                                                    pilihan_ajuan._3bulan,
                                                jangka_waktu: "3 Bulan",
                                                tenggat_waktu: DateTime(
                                                    curDate.year,
                                                    curDate.month + 3,
                                                    curDate.day),
                                                cashback:
                                                    pilihan_ajuan.total_3 *
                                                        potongan /
                                                        100)),
                                      );
                                    },
                                    child: Text(
                                      "Pinjam Sekarang",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily),
                                    )),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCA311),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 20, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cicilan 3 Bulan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(
                                                          pilihan_ajuan._3bulan)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "  per bulan",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text("Total",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Bunga ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "2.00 ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "%",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(
                                                          pilihan_ajuan.total_3)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                  // Ini 9 Bulan
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          color: const Color(0xFF14213D),
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Sk(
                                                jumlah_pinjaman:
                                                    int.parse(_nominal.text),
                                                jumlah_tagihan:
                                                    pilihan_ajuan.total_6,
                                                tagihan_bulanan:
                                                    pilihan_ajuan._6bulan,
                                                jangka_waktu: "6 Bulan",
                                                tenggat_waktu: DateTime(
                                                    curDate.year,
                                                    curDate.month + 6,
                                                    curDate.day),
                                                cashback:
                                                    pilihan_ajuan.total_6 *
                                                        potongan /
                                                        100)),
                                      );
                                    },
                                    child: Text(
                                      "Pinjam Sekarang",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily),
                                    )),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCA311),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 20, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cicilan 6 Bulan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(
                                                          pilihan_ajuan._6bulan)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "  per bulan",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text("Total",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Bunga ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "2.50 ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "%",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(
                                                          pilihan_ajuan.total_6)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                  // Ini 6 bulan
                  Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          color: const Color(0xFF14213D),
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Sk(
                                                jumlah_pinjaman:
                                                    int.parse(_nominal.text),
                                                jumlah_tagihan:
                                                    pilihan_ajuan.total_9,
                                                tagihan_bulanan:
                                                    pilihan_ajuan._9bulan,
                                                jangka_waktu: "9 Bulan",
                                                tenggat_waktu: DateTime(
                                                    curDate.year,
                                                    curDate.month + 9,
                                                    curDate.day),
                                                cashback:
                                                    pilihan_ajuan.total_9 *
                                                        potongan /
                                                        100)),
                                      );
                                    },
                                    child: Text(
                                      "Pinjam Sekarang",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily),
                                    )),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCA311),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 20, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cicilan 9 Bulan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(
                                                          pilihan_ajuan._9bulan)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "  per bulan",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text("Total",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Bunga ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "3.00 ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "%",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(
                                                          pilihan_ajuan.total_9)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                  // Ini 3 bulan
                  Container(
                      margin: const EdgeInsets.only(top: 30, bottom: 30),
                      width: MediaQuery.of(context).size.width * 0.93,
                      height: MediaQuery.of(context).size.height * 0.15,
                      decoration: BoxDecoration(
                          color: const Color(0xFF14213D),
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 0,
                              right: 0,
                              // left: 0,
                              child: Container(
                                padding: const EdgeInsets.only(bottom: 5),
                                width: MediaQuery.of(context).size.width * 0.5,
                                child: ElevatedButton(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.transparent)),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Sk(
                                                jumlah_pinjaman:
                                                    int.parse(_nominal.text),
                                                jumlah_tagihan:
                                                    pilihan_ajuan.total_12,
                                                tagihan_bulanan:
                                                    pilihan_ajuan._12bulan,
                                                jangka_waktu: "12 Bulan",
                                                tenggat_waktu: DateTime(
                                                    curDate.year,
                                                    curDate.month + 12,
                                                    curDate.day),
                                                cashback:
                                                    pilihan_ajuan.total_12 *
                                                        potongan /
                                                        100)),
                                      );
                                    },
                                    child: Text(
                                      "Pinjam Sekarang",
                                      style: TextStyle(
                                          letterSpacing: 1,
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily),
                                    )),
                              )),
                          Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: BoxDecoration(
                                    color: const Color(0xFFFCA311),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 8, 20, 0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Cicilan 12 Bulan",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            fontSize: 16),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(pilihan_ajuan
                                                          ._12bulan)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  "  per bulan",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Text("Total",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 16)),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1.0,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  "Bunga ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "3.50 ",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                                Text(
                                                  "%",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontStyle:
                                                          FontStyle.italic,
                                                      fontSize: 12),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "Rp. ",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                                Text(
                                                  NumberFormat("###,###,###")
                                                      .format(pilihan_ajuan
                                                          .total_12)
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600)
                                                              .fontFamily,
                                                      fontSize: 16),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      )),
                ],
              ),
            )));
  }
}
