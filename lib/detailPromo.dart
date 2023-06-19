import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:tubes/home.dart';
import 'dart:convert';
import 'main2.dart';
import 'promo.dart';
import 'kalkulator.dart';
import 'bloc.dart';

class DetailPromo extends StatefulWidget {
  final ById id;
  final Message message;

  DetailPromo({required this.id, required this.message});

  @override
  State<DetailPromo> createState() => _DetailPromoState();
}



class _DetailPromoState extends State<DetailPromo> {
  late ById id;
  late Message message;

  @override
  void initState() {
    super.initState();
    message = widget.message;
    id = widget.id;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
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
                        if (message.content == '2') {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Promo()),
                            (route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
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
                        'Detail Promo',
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
              body: BlocBuilder<DetilJenisPromoCubit, DetilJenisPromoModel>(
                builder: (context, detilPromo) {
                  context.read<DetilJenisPromoCubit>().fetchData(id.byId);
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 1,
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: Image.asset(
                              'asset/square.png',
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
                                    detilPromo.judul,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 24,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    detilPromo.desc,
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w600)
                                            .fontFamily,
                                        fontSize: 18,
                                        color: Colors.black),
                                  ),
                                  Text(
                                    "Berlaku s.d ${detilPromo.tenggat}",
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
                              padding: const EdgeInsets.all(18),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.84,
                                    height: 40,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              const Color(0xffFCA311),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (message.content == '2') {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Kalkulator(kode: detilPromo.kode)),
                                              (route) => true,
                                            );
                                          }
                                        },
                                        child: Text("Use",
                                            style: TextStyle(
                                                fontFamily: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w600)
                                                    .fontFamily,
                                                fontSize: 18,
                                                color: Colors.white,
                                                letterSpacing: 1))),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.30,
                                    child: SingleChildScrollView(
                                      child: Text(
                                        "Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?Lorem ipsum, dolor sit amet consectetur adipisicing elit. Quod voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia ipsam aperiam repellendus praesentium magnam?",
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
    );
  }
}
