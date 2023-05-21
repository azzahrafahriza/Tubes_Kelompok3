import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/main.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xffE5E5E5),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20))),
                height: 60,
                child: TabBar(
                  tabs: [
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'On Progress',
                              ))),
                    ),
                    Expanded(
                      child: Container(
                          width: double.infinity,
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Riwayat',
                              ))),
                    ),
                  ],
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                      insets: EdgeInsets.symmetric(horizontal: 42)),
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelColor: Colors.black,
                  unselectedLabelStyle:
                      TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  Center(child: Listview()),
                  Center(child: ListView2()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Listview extends StatelessWidget {
  const Listview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xffD9D9D9),
            margin: const EdgeInsets.all(12.0),
            child: ListTile(
                //leading: Image.network('https://picsum.photos/200'),
                title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffFFFFFF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Image.network(
                                    'https://picsum.photos/200',
                                    height: 60,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: Text(
                                    'Perincian Peminjaman',
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 16, top: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tagihan',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Jatuh Tempo',
                        style: TextStyle(
                            fontFamily: 'Poppins', fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text('Rp613.000'),
                        Text(
                          '/bln',
                          style: TextStyle(fontSize: 10),
                        )
                      ],
                    ),
                    Text(
                      '30 Feb 2021',
                      style: TextStyle(color: Color(0xffFF0000)),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, top: 24, bottom: 12),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Bayar',
                          style: TextStyle(fontFamily: 'Poppins'),
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xffFCA311),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                    ),
                  ),
                )
              ],
            )),
          );
        });
  }
}

class ListView2 extends StatelessWidget {
  const ListView2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            color: Color(0xffD9D9D9),
            margin: const EdgeInsets.all(12.0),
            child: ListTile(
                //leading: Image.network('https://picsum.photos/200'),
                title: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xffFFFFFF)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 24),
                                  child: Image.network(
                                    'https://picsum.photos/200',
                                    height: 60,
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 32),
                                  child: Text(
                                    'Judul Peminjaman',
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Lama Bayar',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff625A5A))),
                            Text('3 Bulan',
                                style: TextStyle(fontFamily: 'Poppins'))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Total Bayar',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff625A5A))),
                            Text('Rp. 1.000.000',
                                style: TextStyle(fontFamily: 'Poppins'))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Status',
                                style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color(0xff625A5A))),
                            Text('Lunas',
                                style: TextStyle(fontFamily: 'Poppins'))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )),
          );
        });
  }
}
