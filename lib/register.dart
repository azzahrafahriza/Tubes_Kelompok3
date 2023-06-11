import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late Future<int> respPost; //201 artinya berhasil
  String url = "http://127.0.0.1:8000/tambah_user/";

  final _formKey = GlobalKey<FormState>();
  final textTelp = TextEditingController();
  final textNama = TextEditingController();
  final textUMKM = TextEditingController();
  final textEmail = TextEditingController();
  final textPassword = TextEditingController();
  final textPin = TextEditingController();
  final textKonf = TextEditingController();
  String _name = '';
  String _UMKM = '';
  String _email = '';
  String _password = '';
  String _pin = '';
  String _konfpass = '';
  String _Notelp = '';

  Future<int> insertData() async {
    //data disimpan di body
    final response = await http.post(Uri.parse(url), headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8'
    }, body: """
      {  
        "nama": "$_name",
        "nama_umkm": "$_UMKM",
        "password": "$_password",
        "pin": "$_pin",
        "email": "$_email",
        "no_telp": "$_Notelp"} """);
    return response.statusCode; //sukses kalau 201
  }

  @override
  void initState() {
    super.initState();
    respPost = Future.value(0); //init
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70.0),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              color: Color.fromARGB(255, 232, 231, 231),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                padding: const EdgeInsets.only(top: 15.0),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Container(
                padding: const EdgeInsets.only(top: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      fontSize: 24.0,
                      fontFamily: GoogleFonts.poppins().fontFamily),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Your Account Here',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        letterSpacing: 1),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Nama',
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    controller: textNama,
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily,
                        letterSpacing: 1),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Nama UMKM',
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your UMKM';
                      }
                      return null;
                    },
                    controller: textUMKM,
                    onSaved: (value) {
                      _UMKM = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical:
                              12.0), // Atur padding pada konten // Atur padding horizontal pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: textEmail,
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Password',

                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical:
                              12.0), // Atur padding pada konten // Atur padding horizontal pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: textPassword,
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'Konfirmasi Password',
                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical:
                              12.0), // Atur padding pada konten // Atur padding horizontal pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your confirm password';
                      }
                      return null;
                    },
                    controller: textKonf,
                    onSaved: (value) {
                      _konfpass = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(6),
                    ],
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'PIN',

                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical:
                              12.0), // Atur padding pada konten // Atur padding horizontal pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your pin';
                      }
                      return null;
                    },
                    controller: textPin,
                    onSaved: (value) {
                      _pin = value!;
                    },
                  ),
                  const SizedBox(height: 30.0),
                  TextFormField(
                    style: TextStyle(
                        fontSize: 16.0,
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontFamily: GoogleFonts.poppins().fontFamily),
                    decoration: InputDecoration(
                      fillColor: const Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      labelText: 'No.telp',

                      labelStyle: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          fontFamily: GoogleFonts.poppins()
                              .fontFamily), // Atur ukuran label teks
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your No.Telp';
                      }
                      return null;
                    },
                    controller: textTelp, //controller

                    onSaved: (value) {
                      _Notelp = value!;
                    },
                  ),
                  const SizedBox(height: 40.0),
                  Center(
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          width: 2.0,
                          color: const Color(0xFFFCA311),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _name = textNama.text;
                              _UMKM = textUMKM.text;
                              _email = textEmail.text;
                              _password = textPassword.text;
                              _pin = textPin.text;
                              _Notelp = textTelp.text;
                              respPost = insertData();
                              Navigator.pushNamed(context, "/login");
                            });
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                              0xFFFCA311), // Warna latar belakang tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        child: const Text('Register'),
                      ),
                    ),
                  ),
                  FutureBuilder<int>(
                      future: respPost,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data! == 201) {
                            return const Text("Proses Insert Berhasil!");
                          }
                          if (snapshot.data! == 0) {
                            return const Text("");
                          } else {
                            return const Text("Proses insert gagal");
                          }
                        }
                        // default: loading spinner.
                        return const CircularProgressIndicator();
                      })
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
