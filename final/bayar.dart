import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Bayar extends StatefulWidget {
  const Bayar({super.key});

  @override
  State<Bayar> createState() => _BayarState();
}

class _BayarState extends State<Bayar> {
  bool _isExpanded = false;
  bool _isExpanded2 = false;
  @override
  Widget build(BuildContext context) =>
  MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0), // Ukuran preferensi AppBar
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0), // Radius melengkung pada sudut kiri bawah
                  bottomRight: Radius.circular(20.0), // Radius melengkung pada sudut kanan bawah
                ),
                color: Color.fromARGB(255,232,231,231), // Warna latar belakang AppBar
              ),
              child: AppBar(
                backgroundColor: Colors.transparent, // Atur latar belakang AppBar menjadi transparan
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
                    'Pembayaran',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 24.0,
                      fontFamily: GoogleFonts.poppins().fontFamily
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top:30, left: 15, right: 15),
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: _isExpanded ?Color(0xffE5E5E5) : Color(0xFF14213D),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: ExpansionTile(
                  backgroundColor: Colors.transparent,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded = expanded;
                    });
                  },
                  initiallyExpanded: _isExpanded,
                  title: Text("ATM",
                    style: TextStyle(
                      color: _isExpanded ? Color(0xFF14213D) : Colors.white,
                      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
                      fontSize: 20
                    ),
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("BCA", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("BNI", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Mandiri", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("BSI", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:30, left: 15, right: 15),
                width: MediaQuery.of(context).size.width * 1,
                decoration: BoxDecoration(
                  color: _isExpanded2 ?Color(0xffE5E5E5) : Color(0xFF14213D),
                  borderRadius: BorderRadius.circular(30)
                ),
                child: ExpansionTile(
                  backgroundColor: Colors.transparent,
                  onExpansionChanged: (expanded) {
                    setState(() {
                      _isExpanded2 = expanded;
                    });
                  },
                  initiallyExpanded: _isExpanded2,
                  title: Text("E-Wallet",
                    style: TextStyle(
                      color: _isExpanded2 ? Color(0xFF14213D) : Colors.white,
                      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily,
                      fontSize: 20
                    ),
                  ),
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Gopay", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("ShopeePay", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 5),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Dana", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(100)
                        ),
                        margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        // height: MediaQuery.of(context).size.width * 1,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left:20.0),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1183417077/id/foto/percikan-tetes-air.jpg?s=1024x1024&w=is&k=20&c=B1ZG68eDGIcUetIuWOS9y-tP5aJWLXDVKKWJOrNLJpE=',
                                width: 60,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text("Ovo", style: TextStyle(fontSize: 20, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:30),
                width: MediaQuery.of(context).size.width*0.9,
                height: MediaQuery.of(context).size.height*0.05,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xFF339989), 
                ),
                child: GestureDetector(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(left:15, top:8),
                    child: Text("My Wallet", style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500, letterSpacing: 1).fontFamily),),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.5,
              ),
              Container(
                margin: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.1),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                width: MediaQuery.of(context).size.width*0.84,
                height: MediaQuery.of(context).size.height*0.05,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(Color(0xFFFCA311)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0), // Atur radius lengkungan di sini
                      ),
                    ),
                  ),
                  onPressed: (){Navigator.pushNamed(context, "/virtualAkunBayar");}, 
                  child: Text("Continue", style: TextStyle(fontSize: 18, color: Colors.white, letterSpacing: 2, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),)
                ),
              )
            ],
          ),
        )
      ),
    );

    
}















