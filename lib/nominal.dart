import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class Nominal extends StatefulWidget {
  const Nominal({super.key});

  @override
  State<Nominal> createState() => _NominalState();
}

class _NominalState extends State<Nominal> {
  static const warnaBiru = Color(0xff14213D);
  static const warnaOren = Color(0xffFCA311);
  static const warnaHitam = Colors.black;
  static const warnaPutih = Colors.white;

  final _formKey = GlobalKey<FormState>();
  final textRek = TextEditingController();
  final textSum = TextEditingController();
  late Future<int> respPost;
  String url = "http://127.0.0.1:8000/update_tarik_saldo/";

  String _noRek = '';
  int _sumValue = 0;

  TextStyle gayaText(double font, FontWeight ketebalan) {
    return TextStyle(
        fontSize: font,
        fontFamily: GoogleFonts.poppins().fontFamily,
        letterSpacing: 1,
        fontWeight: ketebalan,
        color: Colors.black);
  }

  @override
  void initState() {
    super.initState();
    respPost = Future.value(0); //init
  }

  Future<int> fetchSaldo(String id) async {
    String byid = id;

    final response = await http.patch(Uri.parse(url + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: """
      {
        "saldo": "${_sumValue}"
      } """);

    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: warnaOren),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Tarik tunai",
                  style: gayaText(18, FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(Icons.close),
                )
              ],
            ),
            Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'No. Rekening',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    controller: textRek,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tolong masukkan nomor rekeningmu';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _noRek = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2),
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Nominal',
                      labelStyle: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 2), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical:
                              12.0), // Atur padding pada konten // Atur padding horizontal pada konten
                    ),
                    controller: textSum,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tolong masukkan nominal';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _sumValue = int.parse(value!);
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.17),
                  BlocBuilder<UserCubit, UserModel>(builder: (context, user) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            height: 50.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                width: 2.0,
                                color: const Color(0xFFFCA311),
                              ),
                            ),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _noRek = textRek.text;
                                    _sumValue = int.parse(textSum.text);
                                    if (user.saldo > _sumValue) {
                                      respPost =
                                          fetchSaldo(user.userID.toString());
                                      Navigator.pushNamed(context, "/sukses");
                                    } else {
                                      Navigator.pushNamed(
                                          context, "/tarikTunai");
                                    }
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    warnaBiru, // Warna latar belakang tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Selesai',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w600)
                                        .fontFamily,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
