import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



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
                  Navigator.pushNamed(context, "/bayar");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Enter PIN',
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
                'Please enter your 6 digit PIN',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 107, 106, 106),
                  // fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinDot(),
                PinDot(),
                PinDot(),
                PinDot(),
                PinDot(),
                PinDot(),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(right: 20.0, left: 20.0),
              child: Text(
                'Forgot PIN?',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.poppins().fontFamily,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.32),
            Expanded(
              child: Container(
                color: Colors.grey[200],
                child: GridView.count(
                  childAspectRatio: (20 / 10),
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
                    Navigator.pushNamed(context, "/sukses");
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

class PinDot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      margin: EdgeInsets.only(top: 8, left: 8, right: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color.fromARGB(255, 214, 214, 214),
        // color: Colors.white,
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
