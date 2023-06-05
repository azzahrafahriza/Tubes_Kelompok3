import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:google_fonts/google_fonts.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  static final lorem = 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. voluptate veritatis aspernatur optio adipisci earum nesciunt commodi ut id corporis quaerat repellat rem, cum quia  aperiam repellendus praesentium magnam?';

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
                    Navigator.pushNamed(context, "/pusatBantuan");
                  },
                  color: Colors.black,
                  iconSize: 24.0,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    'FAQ',
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
        body: 
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: buildCard(
                'Panduan Peminjaman', '1. Lengkapi terlebih dahulu data dirimu\n2. Tekan mode kalkulator kemudian masukkan nominal yang ingin dipinjam\n3. Pilih lama waktu cicilan\n4. Masukkan kode promo jika ada\n5. Tekan continue, kemudian baca syarat dan ketentuan yang ada\n6. Jika setuju, tekan tombol setuju\n7. Masukkan pin akunmu\n8. Peminjaman telah selesai'
              ),
            ),
            buildCard(
              'Question 2', lorem
            ),
            buildCard(
              'Question 3', lorem
            ),
            buildCard(
              'Question 4', lorem
            ),
          ],
        )
      ),
    );

    Widget buildCard(String title, String expand) => Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(80),
        ),
        color: Color(0xFF14213D),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(35, 10, 0, 0),
          child: ExpandableNotifier(
            child: ScrollOnExpand(
              child: ExpandablePanel(
                header: Text(
                  title,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: GoogleFonts.poppins().fontFamily
                  ),
                ),
                collapsed: SizedBox.shrink(), // Menyembunyikan konten terlipat secara default
                expanded: SizedBox( // Ubah warna sesuai keinginan Anda
                  width: 400,
                  child: Column(
                    children: [
                      Text(
                        expand,
                        style: TextStyle(fontSize: 16, color: Colors.white, fontFamily: GoogleFonts.poppins().fontFamily),
                      ),
                      // Tambahkan konten terlipat tambahan di sini jika diperlukan
                    ],
                  ),
                ),
                builder: (_, collapsed, expanded) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Expandable(
                      collapsed: collapsed,
                      expanded: expanded,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
}















