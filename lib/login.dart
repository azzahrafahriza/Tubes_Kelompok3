import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  void signUserIn() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );

    //try sign in
    try {
      if (_formKey.currentState!.validate()) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: usernameController.text,
          password: passwordController.text,
        );
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      }
    }
    // Navigator.pop(context);
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Email Salah'),
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return const AlertDialog(
          title: Text('Password Salah'),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 100, 16, 16),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Image.asset(
                    'asset/logoCrop.png',
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: MediaQuery.of(context).size.width * 1,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontFamily:
                            GoogleFonts.poppins(fontWeight: FontWeight.w600)
                                .fontFamily,
                        fontSize: 32,
                        color: const Color(0xffFCA311),
                        letterSpacing: 1),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        controller: usernameController,
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFD9D9D9),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Username/Email',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2), // Atur ukuran label teks
                          contentPadding: const EdgeInsets.symmetric(
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
                      const SizedBox(height: 30.0),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2),
                        decoration: InputDecoration(
                          fillColor: const Color(0xFFD9D9D9),
                          filled: true,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                              fontFamily: GoogleFonts.poppins().fontFamily,
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2), // Atur ukuran label teks
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
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      const SizedBox(height: 40.0),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                  width: 2.0,
                                  color: const Color(0xFFFCA311),
                                ),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  signUserIn();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFFCA311),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontFamily: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                    ).fontFamily,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                                height: 1), // Jarak antara tombol dan teks
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
                                          fontSize: 12.0,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline,
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily,
                                          letterSpacing: 2),
                                    ),
                                    TextSpan(
                                      text: 'Register',
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w600)
                                              .fontFamily,
                                          letterSpacing: 2),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
