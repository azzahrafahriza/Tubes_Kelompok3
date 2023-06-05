import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PilihTopup extends StatefulWidget {
  const PilihTopup({super.key});

  @override
  State<PilihTopup> createState() => _PilihTopupState();
}

class _PilihTopupState extends State<PilihTopup> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // Ukuran preferensi AppBar
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
              leading: IconButton(
                padding: EdgeInsets.only(top: 15.0),
                icon: Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, "/home");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Topup',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      letterSpacing: 1.0,
                      fontSize: 24.0),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
              child: Text(
                'Choose an amount',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.3,
              child: GridView.count(
                childAspectRatio: (25 / 10),
                crossAxisCount: 2,
                children: [
                  buildAmountContainer('Rp. 100.000'),
                  buildAmountContainer('Rp. 500.000'),
                  buildAmountContainer('Rp. 1.000.000'),
                  buildAmountContainer('Rp. 3.000.000'),
                  buildAmountContainer('Rp. 5.000.000'),
                  buildAmountContainer('Rp. 10.000.000'),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 10),
                width: MediaQuery.of(context).size.width * 0.90,
                height: MediaQuery.of(context).size.height * 0.05,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(100)),
                    color: Color(0xFFD9D9D9),
                  ),
                  child: TextField(
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      letterSpacing: 2
                    ),
                    maxLines: 1,
                    decoration: InputDecoration(
                      hintText: 'or type the amount',
                      hintStyle: TextStyle(
                        fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500,).fontFamily,
                        fontSize: 13,
                        color: Color(0xFF979696),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.3,),
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(40.0),
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/topup");
                },
                child: Text(
                  'Continue',
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
    );
  }

  Widget buildAmountContainer(String amount) {
    return Container(
      width: 50,
      height: 25,
      margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 10.0, top: 10.0),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(
          amount,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ),
    );
  }
}


  

