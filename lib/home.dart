import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tubes/bayar.dart';
import 'package:tubes/kalkulator.dart';
import 'package:tubes/bloc.dart';
import 'package:intl/intl.dart';
import 'package:tubes/pilihTopup.dart';
import 'main2.dart';
import 'detailPromo.dart';
import 'pilihTopup.dart';
import 'promo.dart';
import 'detailArtikel.dart';
import 'artikel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //buat user
  var _email;
  var _id;

  late int dibayar;
  late int goals;
  late double percent;

  @override
  void initState() {
    super.initState();
  }

  calculate(int goals, int dibayar) {
    if (goals == 0 || dibayar == 0) {
      percent = 0;
    } else {
      percent = dibayar / goals;
    }

    return percent;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: AppBar(
                  leading: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                  backgroundColor: const Color(0xffE5E5E5),
                  title: Padding(
                    padding: const EdgeInsets.only(top: 13.0),
                    child: BlocBuilder<UserCubit, UserModel>(
                        builder: (context, user) {
                      _email = user.email;
                      _id = user.userID;
                      // context.read<UserCubit>().fetchData(user.email);
                      return Text(
                        "Hi, " + user.nama,
                        style: TextStyle(
                            fontFamily: GoogleFonts.poppins().fontFamily,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      );
                    }),
                  ),
                  actions: [
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 8.0),
                    //   child: IconButton(
                    //     icon: const Icon(Icons.logout),
                    //     color: Colors.black,
                    //     iconSize: 35,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/pusatBantuan");
                        },
                        icon: const Icon(Icons.headset_mic_rounded),
                        color: Colors.black,
                        iconSize: 35,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "/notifikasi");
                        },
                        icon: const Icon(Icons.notifications_active),
                        color: Colors.black,
                        iconSize: 35,
                      ),
                    ),
                  ],
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(30),
                  )),
                )),
            body: RefreshIndicator(
                onRefresh: () {
                  return Future.delayed(Duration(seconds: 2), () {
                    context.read<UserCubit>().fetchData(_email);
                    context
                        .read<PeminjamanBerjalanCubit>()
                        .fetchData(_id.toString());
                  });
                },
                child: SingleChildScrollView(
                    child: Column(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    height: MediaQuery.of(context).size.height * 0.23,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.03,
                        left: 23,
                        right: 23),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.53,
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: const BoxDecoration(
                                    color: Color(0xffA76800),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xffA76800),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(30))),
                                      width: MediaQuery.of(context).size.width *
                                          0.53,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomLeft:
                                                      Radius.circular(30)),
                                            ),
                                            backgroundColor:
                                                const Color(0xffA76800)),
                                        onPressed: () {
                                          if (context
                                                  .read<
                                                      PeminjamanBerjalanCubit>()
                                                  .getStatus() ==
                                              "Diterima") {
                                            Navigator.pushNamed(
                                                context, "/pengajuan");
                                          }
                                        },
                                        child: Text(
                                          "Ajukan Perpanjangan",
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  .fontFamily,
                                              fontSize: 12,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.35,
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: const BoxDecoration(
                                    color: Color(0xff14213D),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30))),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Color(0xff14213D),
                                          borderRadius: BorderRadius.only(
                                              bottomRight:
                                                  Radius.circular(30))),
                                      width: MediaQuery.of(context).size.width *
                                          0.35,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            shape: const RoundedRectangleBorder(
                                              borderRadius: BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(30)),
                                            ),
                                            backgroundColor:
                                                const Color(0xff14213D)),
                                        onPressed: () {
                                          if (context
                                                  .read<
                                                      PeminjamanBerjalanCubit>()
                                                  .getStatus() ==
                                              "Diterima") {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Bayar(
                                                          tagihan_bulanan: context
                                                              .read<
                                                                  PeminjamanBerjalanCubit>()
                                                              .getTagihanBulanan(),
                                                        )));
                                          }
                                        },
                                        child: Text(
                                          "Bayar",
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  .fontFamily,
                                              fontSize: 12,
                                              letterSpacing: 1),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        BlocBuilder<PeminjamanBerjalanCubit, PinjamanModel>(
                            builder: (context, curPinjam) {
                          return Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.19,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: const Color(0xffFCA311)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(15, 15, 15, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Pembayaran Pinjaman",
                                          style: TextStyle(
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  .fontFamily,
                                              fontSize: 16,
                                              color: Colors.white)),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 20),
                                        child: Row(
                                          children: [
                                            Text(
                                                "Rp " +
                                                    NumberFormat("###,###,###")
                                                        .format(curPinjam
                                                            .tagihan_terbayarkan)
                                                        .toString(),
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 28,
                                                    color: Colors.white)),
                                            Text(" / ",
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 20,
                                                    color: Colors.white)),
                                            Text(
                                                NumberFormat("###,###,###")
                                                    .format(curPinjam
                                                        .jumlah_tagihan)
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily:
                                                        GoogleFonts.poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)
                                                            .fontFamily,
                                                    fontSize: 18,
                                                    color: const Color(
                                                        0xfff9c980))),
                                          ],
                                        ),
                                      ),
                                      LinearPercentIndicator(
                                        padding: const EdgeInsets.only(
                                            top: 10, left: 10, right: 10),
                                        lineHeight: 20,
                                        percent: calculate(
                                            context
                                                .read<PeminjamanBerjalanCubit>()
                                                .getJumlahTagihan(),
                                            context
                                                .read<PeminjamanBerjalanCubit>()
                                                .getTagihanTerbayar()),
                                        progressColor: const Color(0xffd48300),
                                        backgroundColor:
                                            const Color(0xffed970b),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        margin: const EdgeInsets.only(
                                            top: 13, right: 15),
                                        alignment: Alignment.bottomLeft,
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Text("Masa Tenggang : ",
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 13,
                                                      color: Colors.white)),
                                              Text(
                                                  DateFormat.yMMMd()
                                                      .format(DateTime.parse(
                                                          curPinjam
                                                              .tenggat_waktu))
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontFamily:
                                                          GoogleFonts.poppins(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500)
                                                              .fontFamily,
                                                      fontSize: 13,
                                                      color: Colors.white)),
                                            ]),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        }),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06,
                        left: 23,
                        right: 23),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.53,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomLeft: Radius.circular(30)),
                              color: Color(0xff339989)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 26),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Saldo",
                                  style: TextStyle(
                                      fontFamily: GoogleFonts.poppins(
                                              fontWeight: FontWeight.w400)
                                          .fontFamily,
                                      color: Colors.white,
                                      fontSize: 16),
                                ),
                                BlocBuilder<UserCubit, UserModel>(
                                    builder: (context, user) {
                                  // context.read<UserCubit>().fetchData(user.email);
                                  return Text(
                                    "Rp. " +
                                        NumberFormat("###,###,###")
                                            .format(user.saldo)
                                            .toString(),
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)
                                            .fontFamily,
                                        fontSize: 21,
                                        color: Colors.white),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xff2B2C28),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(30))),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(30)),
                                      ),
                                      backgroundColor: const Color(0xff2B2C28)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/pilihTopup");
                                  },
                                  child: Text(
                                    "Topup",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)
                                            .fontFamily,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xff236D62),
                                    borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(30))),
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(30)),
                                      ),
                                      backgroundColor: const Color(0xff236D62)),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "/tarikTunai");
                                  },
                                  child: Text(
                                    "Tarik Tunai",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)
                                            .fontFamily,
                                        fontSize: 12,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.88,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.06,
                        left: 23,
                        right: 23),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          backgroundColor: const Color(0xfffca311)),
                      onPressed: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Kalkulator(kode: "")),
                          (route) => false,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_circle_outline,
                            color: Color(0xffBF7700),
                            size: 50,
                          ),
                          Text(
                            "Lakukan Peminjaman",
                            style: TextStyle(
                                fontFamily: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500)
                                    .fontFamily,
                                fontSize: 16,
                                letterSpacing: 1),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: const Color(0xff14213D),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 25, left: 25, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Promo",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500)
                                        .fontFamily,
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MainRouting(
                                                  selectedIndex: 1)),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "Lihat Semua >",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)
                                            .fontFamily,
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  )),
                            ],
                          ),
                        ),
                        BlocBuilder<JenisPromoCubit, JenisPromoModel>(
                            builder: (context, jenisPromo) {
                          // context.read<JenisPromoCubit>().fetchData();
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  children: List.generate(
                                    jenisPromo.dataPromo.length,
                                    (index) => Container(
                                      child: GestureDetector(
                                        onTap: () {
                                          ById byId = ById(
                                              byId: jenisPromo
                                                  .dataPromo[index].id);
                                          Message message = Message('1');
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => DetailPromo(
                                                  id: byId, message: message),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(right: 10),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.13,
                                          child: Stack(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(30.0),
                                                child: Image.network(
                                                  "https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=",
                                                  fit: BoxFit.cover,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.13,
                                                ),
                                              ),
                                              Positioned(
                                                bottom: 0,
                                                child: GestureDetector(
                                                  onTap: () {},
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 20,
                                                            bottom: 5),
                                                    child: Text(
                                                      jenisPromo
                                                          .dataPromo[index]
                                                          .judulpromo,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            GoogleFonts.poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500)
                                                                .fontFamily,
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        letterSpacing: 1,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ));
                        })
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05),
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.2,
                    color: const Color(0xff14213D),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 15, right: 25, left: 25, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Artikel",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500)
                                        .fontFamily,
                                    color: Colors.white,
                                    fontSize: 16,
                                    letterSpacing: 1),
                              ),
                              GestureDetector(
                                  onTap: () =>
                                      Navigator.pushNamed(context, "/artikel"),
                                  child: Text(
                                    "Lihat Semua >",
                                    style: TextStyle(
                                        fontFamily: GoogleFonts.poppins(
                                                fontWeight: FontWeight.w500)
                                            .fontFamily,
                                        color: Colors.white,
                                        fontSize: 16,
                                        letterSpacing: 1),
                                  )),
                            ],
                          ),
                        ),
                        BlocBuilder<JenisArtikelCubit, JenisArtikelModel>(
                            builder: (context, jenisArt) {
                          // context.read<JenisArtikelCubit>().fetchData();.
                          return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                    children: List.generate(
                                        jenisArt.dataArt.length,
                                        (index) => Container(
                                              child: GestureDetector(
                                                onTap: () {
                                                  Art id = Art(
                                                      content: jenisArt
                                                          .dataArt[index].id);
                                                  Message message2 =
                                                      Message('2');
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetailArtikel(
                                                              message2:
                                                                  message2,
                                                              id: id),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  margin: const EdgeInsets.only(
                                                      right: 10),
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.13,
                                                  child: Stack(
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                        child: Image.network(
                                                          "https://media.istockphoto.com/id/1415844404/id/foto/gelombang-percikan-daun-air.jpg?s=2048x2048&w=is&k=20&c=es5FtenDU--onwK445Th-M0VenVbC55J95oH__jIV-o=",
                                                          fit: BoxFit.cover,
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.6,
                                                          height: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height *
                                                              0.13,
                                                        ),
                                                      ),
                                                      Positioned(
                                                        bottom: 0,
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    left: 20,
                                                                    bottom: 5),
                                                            child: Text(
                                                              jenisArt
                                                                  .dataArt[
                                                                      index]
                                                                  .judulart,
                                                              style: TextStyle(
                                                                fontFamily: GoogleFonts.poppins(
                                                                        fontWeight:
                                                                            FontWeight.w500)
                                                                    .fontFamily,
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 16,
                                                                letterSpacing:
                                                                    1,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ))),
                              ));
                        })
                      ],
                    ),
                  )
                ])))));
  }
}
