import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class EditDetailProfile extends StatefulWidget {
  const EditDetailProfile({super.key});

  @override
  State<EditDetailProfile> createState() => _EditDetailProfileState();
}

class _EditDetailProfileState extends State<EditDetailProfile> {
  final _formKey = GlobalKey<FormState>();
  final textEditController = TextEditingController();
  String _username = '';
  String _password = '';

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
                  Navigator.pushNamed(context, "/editprofile");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Container(
                padding: const EdgeInsets.only(top: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ubah Nama UMKM',
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
                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                          ),
                          decoration: InputDecoration(
                            fillColor: Color(0xFFD9D9D9),
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
                            labelStyle: TextStyle(fontSize: 18.0, fontFamily: GoogleFonts.poppins().fontFamily,),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 16.0,
                              vertical: 12.0,
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your UMKM';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
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
                                  _username = textEditController.text;
                                  Navigator.pushNamed(context, "/editprofile");
                                });
                              }
                            },
                            child: Text('Simpan', style: TextStyle(fontFamily: GoogleFonts.poppins().fontFamily,),),
                            style: ElevatedButton.styleFrom(
                              primary: Color(
                                  0xFFFCA311), // Warna latar belakang tombol
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16.0), // Jarak antara tombol dan teks
                      ],
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
