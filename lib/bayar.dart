import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/bloc.dart';
import 'package:http/http.dart' as http;

class Bayar extends StatefulWidget {
  final int tagihan_bulanan;

  Bayar({super.key, required this.tagihan_bulanan});

  @override
  State<Bayar> createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;

  late int tagihan_bulanan;

  @override
  void initState() {
    super.initState();
    tagihan_bulanan = widget.tagihan_bulanan;
  }

  Future<int> fetchSaldo(String id, int tagihanBulanan) async {
    const String url = "http://127.0.0.1:8000/update_tarik_saldo/";
    final response = await http.patch(Uri.parse(url + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: """
      {
        "saldo": ${tagihanBulanan}
      } """);

    return response.statusCode;
  }

  Future<int> UpdateSaldo(String id, int cashback) async {
    const String url = "http://127.0.0.1:8000/update_usr_saldo/";
    final response = await http.patch(Uri.parse(url + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: """
      {
        "saldo": ${cashback}
      } """);

    return response.statusCode;
  }

  Future<int> updateTagihan(String id, int tagihanBulanan) async {
    const String url = "http://127.0.0.1:8000/update_bayar_tagihan/";
    final response = await http.patch(Uri.parse(url + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: """
      {
        "tagihan": ${tagihanBulanan}
      } """);

    return response.statusCode;
  }

  Future<int> updateLunas(String id) async {
    final String url = "http://127.0.0.1:8000/lunaskan_peminjaman/";
    final response = await http.patch(
      Uri.parse(url + id),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8'
      },
    );

    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
              preferredSize:
                  const Size.fromHeight(70.0), // Ukuran preferensi AppBar
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
                      'Pembayaran',
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
                    margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: _isExpanded
                            ? const Color(0xffE5E5E5)
                            : const Color(0xFF14213D),
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
                            color: _isExpanded
                                ? const Color(0xFF14213D)
                                : Colors.white,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            fontSize: 20),
                      ),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/virtualAkunBayar");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                                const SizedBox(width: 10),
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
                            Navigator.pushNamed(context, "/virtualAkunBayar");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                                const SizedBox(width: 10),
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
                            Navigator.pushNamed(context, "/virtualAkunBayar");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                                const SizedBox(width: 10),
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
                            Navigator.pushNamed(context, "/virtualAkunBayar");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
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
                                const SizedBox(width: 10),
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
                    margin: const EdgeInsets.only(top: 30, left: 15, right: 15),
                    width: MediaQuery.of(context).size.width * 1,
                    decoration: BoxDecoration(
                        color: _isExpanded2
                            ? const Color(0xffE5E5E5)
                            : const Color(0xFF14213D),
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
                            color: _isExpanded2
                                ? const Color(0xFF14213D)
                                : Colors.white,
                            fontFamily:
                                GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                    .fontFamily,
                            fontSize: 20),
                      ),
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, "/sukses");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                                const SizedBox(width: 10),
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
                            Navigator.pushNamed(context, "/sukses");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                                const SizedBox(width: 10),
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
                            Navigator.pushNamed(context, "/sukses");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 5),
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
                                const SizedBox(width: 10),
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
                            Navigator.pushNamed(context, "/sukses");
                          },
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100)),
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            // height: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Image.asset(
                                    '../asset/ovo.jpg',
                                    width: 60,
                                    height: 30,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(width: 10),
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
                  Container(
                    margin: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: const Color(0xFF339989),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        var saldo = context.read<UserCubit>().getSaldo();

                        if (saldo >= tagihan_bulanan) {
                          fetchSaldo(
                              context.read<UserCubit>().getid().toString(),
                              tagihan_bulanan);

                          updateTagihan(
                              context.read<UserCubit>().getid().toString(),
                              tagihan_bulanan);

                          Future.delayed(Duration(seconds: 1), () {
                            if (context
                                    .read<PeminjamanBerjalanCubit>()
                                    .getJumlahTagihan() ==
                                context
                                        .read<PeminjamanBerjalanCubit>()
                                        .getTagihanTerbayar() +
                                    tagihan_bulanan) {
                              if (context
                                      .read<PeminjamanBerjalanCubit>()
                                      .getCashback() !=
                                  0) {
                                UpdateSaldo(
                                    context
                                        .read<UserCubit>()
                                        .getid()
                                        .toString(),
                                    context
                                        .read<PeminjamanBerjalanCubit>()
                                        .getCashback());
                              }
                              updateLunas(
                                  context.read<UserCubit>().getid().toString());
                            }
                            Navigator.pushNamed(context, "/sukses");
                          });
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 8),
                        child: Text(
                          "My Wallet",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontFamily: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1)
                                  .fontFamily),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                ],
              ),
            )),
      );
}
