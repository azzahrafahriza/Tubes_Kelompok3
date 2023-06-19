import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/main2.dart';

class Sukses extends StatefulWidget {
  const Sukses({super.key});

  @override
  State<Sukses> createState() => _SuksesState();
}

class _SuksesState extends State<Sukses> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Image.asset(
                '../asset/suksesBayar.gif',
                height: 250,
                width: 300,
              ),
              SizedBox(height: 10),
              Text(
                'Sukses',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Pembayaranmu telah selesai',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
              SizedBox(height: 200),
              Text(
                'Akan dialihkan ke halaman home dalam 9 detik',
                style: TextStyle(
                    fontSize: 12,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    color: Colors.grey),
              ),
              Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(35.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                MainRouting(selectedIndex: 0))));
                  },
                  child: Text(
                    'Selesai',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1.8,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
