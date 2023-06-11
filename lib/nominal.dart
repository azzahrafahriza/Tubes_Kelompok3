import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  TextStyle gayaText(double font, FontWeight ketebalan){
    return TextStyle(
      fontSize: font,
      fontFamily: GoogleFonts.poppins().fontFamily,
      letterSpacing: 1,
      fontWeight: ketebalan,
      color: Colors.black
    );
  }

  final _formKey = GlobalKey<FormState>();
  final textEditController = TextEditingController();
  String _username = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*0.6,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        color: warnaOren
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tarik tunai", style: gayaText(18, FontWeight.bold),),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: const Icon(
                    Icons.close
                  ),
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
                      letterSpacing: 2
                    ),
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
                        letterSpacing: 2
                      ), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0), // Atur padding pada konten
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tolong masukkan nomor rekeningmu';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _username = value!;
                  },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 2
                    ),
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
                      labelStyle:
                          TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2
                          ), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical:
                              12.0), // Atur padding pada konten // Atur padding horizontal pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Tolong masukkan nominal';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.17),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.9,
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
                                  _username = textEditController.text;
                                  Navigator.pushNamed(context, "/sukses");
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: warnaBiru, // Warna latar belakang tombol
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Center(
                              child: Text('Finish', 
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, fontSize: 18, 
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}