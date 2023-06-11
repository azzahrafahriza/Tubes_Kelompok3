import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'main2.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0), // Ukuran preferensi AppBar
          child: Container(
            decoration: const BoxDecoration(
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
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                padding: const EdgeInsets.only(top: 15.0),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const MainRouting(selectedIndex: 3)),
                    (route) => false,
                  );
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Ubah Akun Saya',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                    fontSize: 24.0,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                  ),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Column(
                    children: [
                      const Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Color.fromARGB(255, 203, 203, 203),
                      ),
                      const SizedBox(height: 10),
                      TextButton(
                        onPressed: () {
                          // Aksi yang ingin diambil saat tombol ditekan
                        },
                        child: Text(
                          'Ubah Foto Profil',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text('Info UMKM',
                      style: TextStyle(
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    children: [
                      TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        initialValue: 'Nama UMKM',
                        decoration: InputDecoration(
                          labelText: 'Nama UMKM',
                          suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/editdetailprofile");
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        initialValue: 'Username',
                        decoration: InputDecoration(
                          labelText: 'Username',
                          suffixIcon: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/editdetailprofile");
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        initialValue: 'email@example.com',
                        decoration: InputDecoration(
                          labelText: 'Email',
                          suffixIcon: IconButton(
                            onPressed: () {
                              // Aksi yang ingin diambil saat tombol edit ditekan
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        style: TextStyle(
                          fontFamily: GoogleFonts.poppins().fontFamily,
                        ),
                        initialValue: 'Nomor Telepon',
                        decoration: InputDecoration(
                          labelText: 'Nomor Telepon',
                          suffixIcon: IconButton(
                            onPressed: () {
                              // Aksi yang ingin diambil saat tombol edit ditekan
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
