import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class StatusPerpanjangan extends StatefulWidget {
  const StatusPerpanjangan({Key? key}) : super(key: key);

  @override
  State<StatusPerpanjangan> createState() => _StatusPerpanjanganState();
}

class _StatusPerpanjanganState extends State<StatusPerpanjangan> {

  @override
  Widget build(BuildContext context) =>
  MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80.0), // Ukuran preferensi AppBar
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30.0), // Radius melengkung pada sudut kiri bawah
                  bottomRight: Radius.circular(30.0), 
                  // Radius melengkung pada sudut kanan bawah
                ),
                color: Color.fromARGB(255,232,231,231), // Warna latar belakang AppBar
              ),
              child: AppBar(
                backgroundColor: Colors.transparent, // Atur latar belakang AppBar menjadi transparan
                elevation: 0, // Hilangkan efek bayangan pada AppBar
                leading: IconButton(
                  padding: const EdgeInsets.only(top: 25.0),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pushNamed(context, "/home");
                  },
                  color: Colors.black,
                  iconSize: 24.0,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Text(
                    'Status Perpanjangan',
                    style: TextStyle(
                      color: Colors.black,
                      letterSpacing: 1.0,
                      fontSize: 24.0,
                      fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.bold).fontFamily
                    ),
                  ),
                ),
                centerTitle: true,
              ),
            ),
          ),
        body: Center(
          child: Container(
            padding: const EdgeInsets.fromLTRB(10,8,0,0),
            margin: const EdgeInsets.fromLTRB(0,8,0,0),
            width: MediaQuery.of(context).size.width * 0.9,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 75, 
                        backgroundImage: Image.network("https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80").image, 
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      height: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("User", style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily
                          ),),
                          Text("Saldo", style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily
                          ),),
                          Text("Rp. 100.000", style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily
                          ),),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0,20,0,20),
                  child: SizedBox(
                    height: 1, // Atur tinggi underline sesuai kebutuhan
                    width: MediaQuery.of(context).size.width * 1.0,
                    child: Container(
                      color: const Color(0xFF747474), // Atur warna underline sesuai kebutuhan
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Tampilkan: ", 
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily,
                            fontSize: 15,
                            color: Colors.black
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFB0FFC1)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0), // Atur radius lengkungan di sini
                              ),
                            ),
                          ), 
                          child: Text("Semua", style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            color: Colors.black
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFC5C5C5)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0), // Atur radius lengkungan di sini
                              ),
                            ),
                          ), 
                          child: Text("Sukses", style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            color: Colors.black
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFC5C5C5)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0), // Atur radius lengkungan di sini
                              ),
                            ),
                          ), 
                          child: Text("Gagal", style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            color: Colors.black
                          ),),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(1, 0, 1, 0),
                        child: ElevatedButton(
                          onPressed: (){},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFFC5C5C5)),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100.0), // Atur radius lengkungan di sini
                              ),
                            ),
                          ), 
                          child: Text("Pending", style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            color: Colors.black
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFC5C5C5)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sp/12324424242", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("04 April 2023", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Container(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xFFFFB800),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                    child: Text("Pending...", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 15),),
                                  )),
                                )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 20,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Perpanjangan pembayaran - ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("2 bulan", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Pemohon :", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("User", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Sisa Bayar : ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("Rp. ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("1000000", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 30, 0, 10),
                  height: MediaQuery.of(context).size.height * 0.17,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: const Color(0xFFC5C5C5)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Sp/12324424242", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("04 April 2023", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Container(
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: const Color(0xFF339989),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(5,0,5,0),
                                    child: Text("Sukses", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily, fontSize: 15, color: Colors.white),),
                                  )),
                                )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 20,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Perpanjangan pembayaran - ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("2 bulan", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Pemohon :", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("User", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(12, 10,12,0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Sisa Bayar : ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("Rp. ", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                              Text("1000000", style: TextStyle(fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, fontSize: 15),),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ),
              ],
            ),
          ),
        )
      ),
    );
}


