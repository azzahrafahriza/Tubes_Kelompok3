import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tubes/profile.dart';
import 'package:tubes/bloc.dart';
import 'package:http/http.dart' as http;
import 'main2.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  late Future<int> respPost;
  String url = "http://127.0.0.1:8000/update_usr_patch/";

  final _formKey = GlobalKey<FormState>();
  final textUmkm = TextEditingController();
  final textEmail = TextEditingController();
  final textTelp = TextEditingController();
  String _umkm = '';
  String _email = '';
  String _telp = '';

  Future<int> fetchData(String id) async {
    String byid = id;

    final response = await http.patch(Uri.parse(url + id),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: """
      {
        "umkm": "${_umkm}",
        "email" : "${_email}",
        "no_telp" : "${_telp}"
      } """);
    return response.statusCode;
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
          preferredSize:
              const Size.fromHeight(70.0), // Ukuran preferensi AppBar
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
                    MaterialPageRoute(
                        builder: (context) => MainRouting(
                              selectedIndex: 3,
                            )),
                    (route) => true,
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
            child: Form(
              key: _formKey,
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
                    child: BlocBuilder<UserCubit, UserModel>(
                        builder: (context, user) {
                      textUmkm.text = user.umkm.toString();
                      textEmail.text = user.email.toString();
                      textTelp.text = user.no_Telp.toString();
                      return Column(
                        children: [
                          TextFormField(
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            controller: textUmkm,
                            decoration: InputDecoration(
                              labelText: 'Nama UMKM',
                              suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            style: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                            ),
                            controller: textEmail,
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
                            controller: textTelp,
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
                          SizedBox(
                            height: 30,
                          ),
                          Container(
                            height: 50,
                            padding: const EdgeInsets.all(8.0),
                            width: MediaQuery.of(context).size.width * 1,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  setState(() {
                                    _umkm = textUmkm.text;
                                    _email = textEmail.text;
                                    _telp = textTelp.text;
                                    respPost =
                                        fetchData(user.userID.toString());
                                    Future.delayed(Duration(seconds: 1), () {
                                      context
                                          .read<UserCubit>()
                                          .fetchData(_email);
                                    });
                                    // context.read<UserCubit>().fetchData(_email);
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => Profile(),
                                    //   ),
                                    // );
                                  });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(
                                    0xFFFCA311), // Warna latar belakang tombol
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              child: Text(
                                'Simpan',
                                style: TextStyle(
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                ),
                              ),
                            ),
                          ),
                          Text("Hasil:"),
                          FutureBuilder<int>(
                              future: respPost,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  if (snapshot.data! == 200) {
                                    return Text(
                                        "Proses Update patch Berhasil!");
                                  }
                                  if (snapshot.data! == 0) {
                                    return Text("");
                                  } else {
                                    return Text("Proses insert gagal");
                                  }
                                }
                                // default: loading spinner.
                                return const CircularProgressIndicator();
                              })
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
