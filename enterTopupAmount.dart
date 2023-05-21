import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(PinEntryApp());
}

//enter topup amount
class PinEntryApp extends StatelessWidget {
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
                  Navigator.pushNamed(context, "/login");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  ' ',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                      letterSpacing: 1.0,
                      fontSize: 20.0),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, right: 20.0, left: 20.0),
              child: Text(
                'Enter topup amount',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 107, 106, 106),
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: TextFormField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 90, 89, 89),
                    // enabledBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    //   // borderSide: BorderSide(),
                    // ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20),
                    //   // borderSide: BorderSide(),
                    // ),
                    alignLabelWithHint:
                        true, // Mengatur label teks menjadi pusat
                    labelText: 'Rp. 0',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: 1.8,
                      fontFamily: GoogleFonts.poppins().fontFamily,
                    ), // Atur ukuran label teks
                  ),
                ),
              ),
            ),
            // SizedBox(height: 20),

            SizedBox(height: 145),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: GridView.count(
                  childAspectRatio: (25 / 10),
                  crossAxisCount: 3,
                  children: [
                    KeyboardNum('1'),
                    KeyboardNum('2'),
                    KeyboardNum('3'),
                    KeyboardNum('4'),
                    KeyboardNum('5'),
                    KeyboardNum('6'),
                    KeyboardNum('7'),
                    KeyboardNum('8'),
                    KeyboardNum('9'),
                    SizedBox.shrink(), // Empty container for empty grid item
                    KeyboardNum('0'),
                    Icon(
                      Icons.backspace,
                      color: Colors.black,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
              ),
              child: Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.only(
                    bottom: 35.0, left: 35.0, right: 35.0, top: 35.0),
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {
                    // Add your continue button functionality here
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
            )
          ],
        ),
      ),
    );
  }
}

class KeyboardNum extends StatelessWidget {
  final String number;

  KeyboardNum(this.number);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Handle number input
      },
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // shape: BoxShape.circle,
          color: Color.fromARGB(0, 0, 0, 0),
        ),
        child: Center(
          child: Text(
            number,
            style: TextStyle(
              fontFamily: GoogleFonts.poppins().fontFamily,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
