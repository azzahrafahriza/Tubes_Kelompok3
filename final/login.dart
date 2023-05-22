import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                  Navigator.pushNamed(context, "/home");
                },
                color: Colors.black,
                iconSize: 24.0,
              ),
              title: Container(
                padding: const EdgeInsets.only(top: 15.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
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
                    'Login into your account and enjoy the apps',
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
                      labelText: 'Username/Email',
                      labelStyle:
                          TextStyle(fontSize: 18.0), // Atur ukuran label teks
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 16.0,
                          vertical: 12.0), // Atur padding pada konten
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _username = value!;
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
                                });
                              }
                            },
                            child: Text('Login'),
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
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "/register");
                          },
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Don't Have an Account? ",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Register',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
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
      ),
    );
  }
}
