import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'artikel.dart';
import 'main2.dart';

class DetilJenisArtikelModel {
  String id;
  String judul;
  String desc;
  String gambar;

  DetilJenisArtikelModel({
    required this.id,
    required this.judul,
    required this.desc,
    required this.gambar,
  }); //constructor
}

class DetilJenisArtikelCubit extends Cubit<DetilJenisArtikelModel> {
  String url = "http://127.0.0.1:8000/tampilkan_artikel_detail/";

  DetilJenisArtikelCubit()
      : super(DetilJenisArtikelModel(id: '', judul: '', desc: '', gambar: ''));

  void setFromJson(Map<String, dynamic> json) {
    emit(DetilJenisArtikelModel(
      id: json["id"],
      judul: json["judul"],
      desc: json["desc"],
      gambar: json["gambar"],
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

class DetailArtikel extends StatefulWidget {
  final Art id;
  final Message message2;

  const DetailArtikel({required this.message2, required this.id});

  @override
  State<DetailArtikel> createState() => _DetailArtikelState();
}

class _DetailArtikelState extends State<DetailArtikel> {
  late Message message2;
  late Art id;

  @override
  void initState() {
    super.initState();
    message2 = widget.message2;
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: [
        BlocProvider<DetilJenisArtikelCubit>(
            create: (BuildContext context) => DetilJenisArtikelCubit())
      ],
      child: Builder(
        builder: (context) => Container(
          child: Scaffold(
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
                    leading: IconButton(
                      padding: const EdgeInsets.only(top: 15.0),
                      icon: const Icon(Icons.arrow_back_ios_new_rounded),
                      onPressed: () {
                        if (message2.content == '2') {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Artikel()),
                            (route) => false,
                          );
                        }
                      },
                      color: Colors.black,
                      iconSize: 24.0,
                    ),
                    backgroundColor: Colors
                        .transparent, // Atur latar belakang AppBar menjadi transparan
                    elevation: 0, // Hilangkan efek bayangan pada AppBar
                    title: Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Text(
                        'Detail Artikel',
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
              body: BlocBuilder<DetilJenisArtikelCubit, DetilJenisArtikelModel>(
                builder: (context, detilArt) {
                  context.read<DetilJenisArtikelCubit>().fetchData(id.content);
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset(
                              '../asset/${detilArt.gambar}',
                              width: MediaQuery.of(context).size.width * 1,
                              height: MediaQuery.of(context).size.height * 0.3,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.1,
                              margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    detilArt.judul,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Ditulis pada 19 Mei 2023",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w400)
                                            .fontFamily,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                ],
                              )),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30),
                                ),
                                color: Color(0xff14213D)),
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.all(24),
                              child: Column(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.4,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        detilArt.desc,
                                        style: TextStyle(
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400)
                                                .fontFamily,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
        ),
      ),
    ));
  }
}
