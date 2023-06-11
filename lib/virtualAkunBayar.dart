import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class VirtualAkunBayar extends StatefulWidget {
  const VirtualAkunBayar({super.key});

  @override
  State<VirtualAkunBayar> createState() => _VirtualAkunBayarState();
}

class _VirtualAkunBayarState extends State<VirtualAkunBayar> {
  @override
  Widget build(BuildContext context) =>
  MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), // Ukuran preferensi AppBar
            child: Container(
              decoration: const BoxDecoration(
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
                  padding: const EdgeInsets.only(top: 15.0),
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: () {
                    Navigator.pushNamed(context, "/bayar");
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
          child: Padding(
            padding: const EdgeInsets.fromLTRB(18,18,18,0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Pembayaran", style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                    Text("Rp. 600.000", style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bayar Dalam", style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                    Text("23 jam 59 menit 59 detik", style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top:20),
                  width: MediaQuery.of(context).size.width*0.88,
                  height: MediaQuery.of(context).size.height*0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xffFCA311),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20,11,20,0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Image(
                              image: AssetImage('../asset/bca.png'),
                              width: 70,
                              height: 50,
                            ),
                            const SizedBox(width: 10,),
                            Text("Bank BCA", style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w500).fontFamily, letterSpacing: 1),),
                          ],
                        ),
                      ),
                      Center(child: SizedBox(width: MediaQuery.of(context).size.width*0.8,height: 1, child: Container(color: Colors.black),)),
                      Padding(
                        padding: const EdgeInsets.only(left:20,top: 18),
                        child: Text("No Rekening", style: TextStyle(fontSize: 12, color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w300).fontFamily, letterSpacing: 1),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20,top: 5),
                        child: Text("122 0858 9055 0284", style: TextStyle(fontSize: 26, color: Colors.white, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily, letterSpacing: 2),),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Petunjuk Transfer mbanking", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, fontSize: 12) )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("1 . ",  style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text("Pilih m-trasfer > BCA Virtual Account", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w400, fontSize: 12),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("2 . ",  style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text("Masukan nomor Virtual Account 122085890550284 dan pilih send", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w400, fontSize: 12),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("3 . ",  style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text("Periksa informasi yang tertera di layar. pastikan Merchant yang tertera adalah XXX, dan username kamu XXX. \nJika benar, pilih Ya", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w400, fontSize: 12),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4 . ",  style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text("Masukan PIN m-BCA Anda dan pilih OK.", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w400, fontSize: 12),)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("5 . ",  style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, fontSize: 12)),
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.8,
                        child: Text("Jika muncul notifikasi “Transaksi Gagal. Nominal melebihi limit harian”, mohon ulangi transaksi menggunakan KlikBCA(iBanking) atau ATM.", style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.w400, fontSize: 12),)),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.2,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFCA311),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                          )
                        ),
                        onPressed: (){Navigator.pushNamed(context, "/sukses");}, 
                        child: Text("Continue", style: TextStyle(fontSize: 18, fontFamily: GoogleFonts.poppins().fontFamily,fontWeight: FontWeight.bold, letterSpacing: 2.0),)
                      ),
                    )
                  ),
                ],
              ),
            )
              ],
            ),
          ),
        )
      ),
    );
}















