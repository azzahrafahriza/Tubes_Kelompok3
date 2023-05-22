import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotifikasiKanan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return 
      Row(
        children: [
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top:50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: Color(0xFFE5E5E5)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15,15,15,25),
                    child: Text("Terbaru", style: TextStyle(fontSize: 18, fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 12, 5, 0),
                          child: Icon(Icons.check, size: 22,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,0,10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Permohonanmu Sudah Diterima", style: TextStyle(fontSize: 18, fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold)),
                              Container(
                                child: Text("Lorem ipsum dolor sit,  amet consectetur adipisicing elit. Sed a, at asperiores labore mo di quae. Asperiores, animi dolor", style: TextStyle(fontSize: 14, fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.w500)),
                                width: 450,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: SizedBox(
                                  height: 1, // Atur tinggi underline sesuai kebutuhan
                                  width: 450,
                                  child: Container(
                                    color: Color(0xFF747474), // Atur warna underline sesuai kebutuhan
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(15, 12, 5, 0),
                          child: Icon(Icons.close, size: 22,),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0,10,0,10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Permohonanmu ditolak", style: TextStyle(fontSize: 18, fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.bold)),
                              Container(
                                child: Text("Lorem ipsum dolor sit,  amet consectetur adipisicing elit. Sed a, at asperiores labore mo di quae. Asperiores, animi dolor", style: TextStyle(fontSize: 14, fontFamily: GoogleFonts.poppins().fontFamily, fontWeight: FontWeight.w500)),
                                width: 450,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top:20.0),
                                child: SizedBox(
                                  height: 1, // Atur tinggi underline sesuai kebutuhan
                                  width: 450,
                                  child: Container(
                                    color: Color(0xFF747474), // Atur warna underline sesuai kebutuhan
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    ;
  }
}