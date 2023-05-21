import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'riwayat.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  MyAppState createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  int idx = 0;

  static List<Center> halaman = [
    Center(child: Home()),
    Center(child: Text("dua")),
    Center(child: Text("tiga")),
    Center(child: Riwayat()),
    Center(child: Text("lima")),
  ];

  void onItemTap(int index) {
    setState(() {
      idx = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Coba Tubes",
      home: Scaffold(
        body: halaman[idx],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: idx,
          selectedItemColor: Color(0xffBF7700),
          backgroundColor: Color.fromARGB(0, 181, 235, 4),
          unselectedItemColor: Colors.blue,
          onTap: onItemTap,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.discount), label: "Programmer"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_outlined), label: "My Learning"),
            BottomNavigationBarItem(
                icon: Icon(Icons.receipt), label: "My Learning"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "My Learning"),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.account_circle,
                color: Colors.black,
              ),
            ),
            backgroundColor: Color(0xffE5E5E5),
            title: Text(
              'Hi, User',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.headset_mic_rounded),
                color: Colors.black,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.notifications_active),
                  color: Colors.black),
            ],
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            )),
          ),
          body: SingleChildScrollView(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40)),
                          color: Color(0xffFCA311)),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 24, top: 24, bottom: 32),
                              child: Text(
                                'Pembayaran Pinjaman',
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.white),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    'Rp 2.000.000 / ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  ),
                                  Text(
                                    '10.000.000',
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontFamily: 'Poppins',
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 24, bottom: 8),
                              child: Text(
                                'Masa Tenggang 24/04/2023',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                    fontSize: 12,
                                    decorationThickness: 2.85),
                              ),
                            ),
                          ),
                          ListTile(
                            title: Row(
                              children: <Widget>[
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Clear",
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                )),
                                Expanded(
                                    child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text("Filter",
                                      style: TextStyle(fontFamily: 'Poppins')),
                                )),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            ),
                            color: Color(0xff339989),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, top: 24.0),
                                    child: Text(
                                      'Saldo',
                                      style: TextStyle(fontFamily: 'Poppins'),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24, top: 24.0),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Top Up',
                                            style: TextStyle(
                                                fontFamily: 'Poppins'))),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, bottom: 24),
                                    child: Text(
                                      '18.000.000',
                                      style: TextStyle(
                                          fontFamily: 'Poppins', fontSize: 24),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 24, bottom: 24.0),
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Top Up',
                                            style: TextStyle(
                                                fontFamily: 'Poppins'))),
                                  )
                                ],
                              )
                            ],
                          )),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: ElevatedButton.icon(
                          icon: Icon(Icons.add_circle),
                          onPressed: () {},
                          label: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Text(
                              'Lakukan Pinjaman',
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFCA311),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                              )),
                        )),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xff14213D),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 32, left: 32, bottom: 12, top: 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Promo',
                                style: TextStyle(
                                    fontFamily: 'Poppins', color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () => {},
                                child: Text(
                                  'Lihat Semua',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 32),
                          child: Container(
                            height: 150,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, bottom: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey),
                                    width: 200,
                                    child: const Center(
                                        child: Text(
                                      'Item 1',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, bottom: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey),
                                    width: 200,
                                    child: const Center(
                                        child: Text(
                                      'Item 2',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 8, bottom: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Colors.grey),
                                    width: 200,
                                    child: const Center(
                                        child: Text(
                                      'Item 3',
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
                ],
              ),
            ],
          ))),
    );
  }
}
