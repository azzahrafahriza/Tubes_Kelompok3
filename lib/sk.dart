import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/bloc.dart';
import 'main2.dart';
import 'package:http/http.dart' as http;

class Sk extends StatefulWidget {
  int jumlah_pinjaman;
  int jumlah_tagihan;
  int tagihan_bulanan;
  String jangka_waktu;
  var tenggat_waktu;
  var cashback;

  Sk(
      {Key? key,
      required this.jumlah_pinjaman,
      required this.jumlah_tagihan,
      required this.tagihan_bulanan,
      required this.jangka_waktu,
      required this.tenggat_waktu,
      required this.cashback})
      : super(key: key);

  @override
  State<Sk> createState() => _SkState();
}

class _SkState extends State<Sk> {
  String url = "http://127.0.0.1:8000/tambah_pinjaman/";

  var id = 0;

  late int jumlah_pinjaman;
  late int jumlah_tagihan;
  late int tagihan_bulanan;
  late String jangka_waktu;
  var tenggat_waktu;
  late int cashback;

  @override
  void initState() {
    super.initState();
    id = context.read<UserCubit>().getid();
    jumlah_pinjaman = widget.jumlah_pinjaman;
    jumlah_tagihan = widget.jumlah_tagihan;
    tagihan_bulanan = widget.tagihan_bulanan;
    jangka_waktu = widget.jangka_waktu;
    tenggat_waktu = widget.tenggat_waktu.toString();
    cashback = widget.cashback;

    print(id);
    print(jumlah_pinjaman);
    print(jumlah_tagihan);
    print(tagihan_bulanan);
    print(jangka_waktu);
    print(tenggat_waktu);
    print(cashback);
  }

  Future<int> insertData() async {
    //data disimpan di body
    final response = await http.post(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    }, body: """{
      "ID": $id,
      "jumlah_pinjaman": $jumlah_pinjaman,
      "jumlah_tagihan": $jumlah_tagihan,
      "tagihan_bulanan": $tagihan_bulanan,
      "tagihan_terbayarkan": 0,
      "jangka_waktu": "$jangka_waktu",
      "tenggat_waktu": "$tenggat_waktu",
      "cashback": $cashback
    } """);
    return response.statusCode; //sukses kalau 201
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
                    bottomRight: Radius.circular(20.0),
                    // Radius melengkung pada sudut kanan bawah
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
                      Navigator.pushNamed(context, "/pusatBantuan");
                    },
                    color: Colors.black,
                    iconSize: 24.0,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Syarat dan Ketentuan',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.0,
                          fontSize: 24.0,
                          fontFamily: GoogleFonts.poppins().fontFamily),
                    ),
                  ),
                  centerTitle: true,
                ),
              ),
            ),
            body: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Yang bertanda tangan di bawah ini : ",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("1 . ",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16)),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    "Lorem ipsum dolor sit,  amet consectetur  adipisicing elit.  Sed a, at asperiores labore  mo di quae. Asperiores, animi dolor ",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("2. ",
                                style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.poppins().fontFamily,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                  "Lorem ipsum dolor sit,  amet consectetur  adipisicing elit.  Sed a, at asperiores labore  mo di quae. Asperiores, animi dolor ",
                                  style: TextStyle(
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                )),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  child: Text(
                                    "Dengan ini sepakat untuk menerapkan hal-hal pokok yang selanjutnya akan disebut sebagai Struktur Pembiayaan",
                                    style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                          child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFCA311),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            onPressed: () {
                              insertData();
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MainRouting(selectedIndex: 0)),
                                (route) => false,
                              );
                            },
                            child: Text(
                              "Agree",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2.0),
                            )),
                      )),
                    ],
                  ),
                )
              ],
            )),
      );
}
