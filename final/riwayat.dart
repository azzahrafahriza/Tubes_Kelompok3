import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';




class ListView2 extends StatelessWidget {
  const ListView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), 
          color: Color(0xffD9D9D9),
          ),
          margin: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.22,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.12,
                    width: MediaQuery.of(context).size.width*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Pemohon", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                              Text("Tanggal", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                              Text("Sisa Bayar", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("User", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily),),
                              Text("04 April 2021", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily),),
                              Text("Rp. 100.000", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily, color: Colors.red),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.07,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:20,left:12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Perpanjangan - 2 Bulan", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                              Text("Diproses", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          )
        );
      }
    );
  }
}


class ListView3 extends StatelessWidget {
  const ListView3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), 
          color: Color(0xffD9D9D9),
          ),
          margin: const EdgeInsets.all(12.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width*1,
            height: MediaQuery.of(context).size.height*0.22,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.12,
                    width: MediaQuery.of(context).size.width*1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Lama Bayar", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily),),
                              Text("Total Bayar", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily),),
                              Text("Status", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w400).fontFamily),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("3 Bulan", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                              Text("Rp. 1.000.000", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                              Text("Lunas", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.08,
                    width: MediaQuery.of(context).size.width*1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:20,left:12, right: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('../asset/bca.png'),
                                width: 70,
                                height: 40,
                              ),
                              SizedBox(width: 10,),
                              Text("Peminjaman Pertama", style: TextStyle(fontSize: 16, fontFamily: GoogleFonts.poppins(fontWeight: FontWeight.w600).fontFamily),),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ],
            ),
          )
        );
      }
    );
  }
}


