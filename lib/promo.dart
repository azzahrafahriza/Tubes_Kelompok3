import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detailPromo.dart';

class DetilJenisPromoModel {
  String id;
  String judul;
  String tenggat;
  String desc;

  DetilJenisPromoModel({
    required this.id,
    required this.judul,
    required this.tenggat,
    required this.desc,
  }); //constructor
}

class DetilJenisPromoCubit extends Cubit<DetilJenisPromoModel> {
  //String url = "http://127.0.0.1:8000/detil_jenis_pinjaman/";
  String url = "http://178.128.17.76:8000/detil_jenis_pinjaman/";

  DetilJenisPromoCubit()
      : super(DetilJenisPromoModel(judul: '', tenggat: '', id: '', desc: ''));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(DetilJenisPromoModel(
      id: json["id"],
      judul: json["judul"],
      tenggat: json["tenggat"],
      desc: json["desc"],
    ));
  }

  void fetchData(String id) async {
    String urlJenis = "$url$id";
    final response = await http.get(Uri.parse(urlJenis));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

//-----------------------------------------------------------

class JenisPromo {
  String id;
  String judulpromo;
  String desc;
  JenisPromo({required this.id, required this.judulpromo, required this.desc});
}

class JenisPromoModel {
  List<JenisPromo> dataPromo;
  JenisPromoModel({required this.dataPromo});
}

class JenisPromoCubit extends Cubit<JenisPromoModel> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_promo/";

  JenisPromoCubit() : super(JenisPromoModel(dataPromo: []));

  void setFromJson(Map<String, dynamic> json) {
    var arrData = json["data"];
    List<JenisPromo> arrOut = [];
    for (var el in arrData) {
      String id = el["id"];
      String judulpromo = el["judul"];
      String desc = el["desc"];
      arrOut.add(
          JenisPromo(id: el["id"], judulpromo: el["judul"], desc: el["desc"]));
    }
    emit(JenisPromoModel(dataPromo: arrOut));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

class Promo extends StatefulWidget {
  const Promo({super.key});

  @override
  State<Promo> createState() => _PromoState();
}

class _PromoState extends State<Promo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          // Rute beranda Promo
          '/detailPromo': (context) => DetailPromo(), // Rute detailPromo
        },
        home: MultiBlocProvider(
          providers: [
            BlocProvider<JenisPromoCubit>(
              create: (BuildContext context) => JenisPromoCubit(),
            ),
            BlocProvider<DetilJenisPromoCubit>(
              create: (BuildContext context) => DetilJenisPromoCubit(),
            )
          ],
          child: Container(
            child: Scaffold(
                appBar: PreferredSize(
                  preferredSize:
                      Size.fromHeight(70.0), // Ukuran preferensi AppBar
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
                      title: Padding(
                        padding: const EdgeInsets.only(top: 15.0),
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
                body: BlocBuilder<JenisPromoCubit, JenisPromoModel>(
                    builder: (context, jenisPromo) {
                  context.read<JenisPromoCubit>().fetchData();
                  return Center(child:
                      BlocBuilder<DetilJenisPromoCubit, DetilJenisPromoModel>(
                    builder: (context, detilPromo) {
                      return ListView.builder(
                        itemCount: jenisPromo.dataPromo.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              context
                                  .read<DetilJenisPromoCubit>()
                                  .fetchData(jenisPromo.dataPromo[index].id);
                              Navigator.pushNamed(context, '/detailPromo');
                            },
                            child: PromoCard(coba: jenisPromo.dataPromo[index]),
                          );
                        },
                      );
                    },
                  ));
                })),
          ),
        ));
  }
}

class PromoCard extends StatelessWidget {
  final JenisPromo coba;
  const PromoCard({super.key, required this.coba});

  static const warnaBiru = Color(0xff14213D);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.18,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromARGB(255, 19, 15, 60),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 245, 185, 73).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 10,
            offset: Offset(5, 5), // changes position of shadow
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
            ),
            child: Container(
              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.center,
                  colors: [
                    Color.fromARGB(255, 241, 170, 5).withOpacity(1),
                    Color.fromARGB(255, 241, 170, 5).withOpacity(.3),
                  ],
                ),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), // Melengkungkan sisi kiri atas
                  bottomLeft:
                      Radius.circular(20), // Melengkungkan sisi kiri bawah
                ),
                child: Image.asset(
                  '../asset/square.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          )),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20)),
                  color: Color.fromARGB(255, 241, 170, 5)),
              child: Column(
                children: [
                  SizedBox(
                    height: 75,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          coba.judulpromo,
                          style: TextStyle(
                              fontSize: 22,
                              color: warnaBiru,
                              fontWeight: FontWeight.w600,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        coba.desc,
                        maxLines: 2,
                        style: TextStyle(
                            fontSize: 12,
                            color: warnaBiru,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                      child: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Lihat Selengkapnya >',
                          style: TextStyle(
                              fontSize: 10,
                              color: warnaBiru,
                              fontWeight: FontWeight.w500,
                              fontFamily: GoogleFonts.poppins().fontFamily),
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
