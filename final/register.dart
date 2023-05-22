import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final textEditController = TextEditingController();
  String _name = '';
  String _UMKM = '';
  String _email = '';
  String _password = '';
  String _konfpass = '';
  int _Notelp = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70.0),
          child: Container(
            decoration: BoxDecoration(
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
                padding: EdgeInsets.only(top: 15.0),
                icon: Icon(Icons.arrow_back_ios_new_rounded),
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
                      fontSize: 24.0),
                ),
              ),
              centerTitle: true,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
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
                    ),
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Nama',
                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _name = value!;
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Nama UMKM',
                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your UMKM';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _UMKM = value!;
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Email',

                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
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
                    onSaved: (value) {
                      _email = value!;
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Password',

                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
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
                    onSaved: (value) {
                      _password = value!;
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'Konfirmasi Password',

                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
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
                    onSaved: (value) {
                      _konfpass = value!;
                    },
                  ),
                  SizedBox(height: 30.0),
                  TextFormField(
                    decoration: InputDecoration(
                      fillColor: Color(0xFFD9D9D9),
                      filled: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(),
                      ),
                      labelText: 'No.telp',

                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your No.Telp';
                      }
                      return null;
                    },
                    controller: textEditController, //controller

                    onSaved: (value) {
                      _Notelp = value! as int;
                    },
                  ),
                  SizedBox(height: 40.0),
                  Center(
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        border: Border.all(
                          width: 2.0,
                          color: Color(0xFFFCA311),
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              _name = textEditController.text;
                            });
                          }
                        },
                        child: Text('Register'),
                        style: ElevatedButton.styleFrom(
                          primary:
                              Color(0xFFFCA311), // Warna latar belakang tombol
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                      ),
                    ),
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
