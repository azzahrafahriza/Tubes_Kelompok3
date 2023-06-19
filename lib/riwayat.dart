import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tubes/bloc.dart';
import 'package:intl/intl.dart';

class ListView2 extends StatelessWidget {
  const ListView2({Key? key}) : super(key: key);
  static const warnaBiru = Color(0xff14213D);
  static const warnaOren = Color(0xffFCA311);
  static const warnaHitam = Colors.black;
  static const warnaPutih = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubitPanjang, HistoryModel>(
        builder: (context, history) {
      return ListView.builder(
          itemCount: history.dataHistory.length,
          itemBuilder: (context, index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xffFCA311),
                ),
                margin: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.22,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.12,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pemohon",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            color: warnaBiru),
                                      ),
                                      Text(
                                        "Tanggal",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            color: warnaBiru),
                                      ),
                                      Text(
                                        "Sisa Bayar",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            color: warnaBiru),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12, right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.read<UserCubit>().getUser(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400)
                                                .fontFamily,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        DateFormat.yMMMd()
                                            .format(DateTime.parse(history
                                                .dataHistory[index]
                                                .tenggat_waktu))
                                            .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400)
                                                .fontFamily,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Rp " +
                                            NumberFormat("###,###,###")
                                                .format(history
                                                        .dataHistory[index]
                                                        .jumlah_tagihan -
                                                    history.dataHistory[index]
                                                        .tagihan_terbayarkan)
                                                .toString(),
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400)
                                                .fontFamily,
                                            color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Positioned(
                          top: 0,
                          right: 0,
                          left: 0,
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.07,
                            width: MediaQuery.of(context).size.width * 1,
                            decoration: BoxDecoration(
                                color: const Color(0xff14213D),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 12, right: 12),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Perpanjangan - 2 Bulan",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w600)
                                                .fontFamily,
                                            color: Colors.white),
                                      ),
                                      Text(
                                        "Diproses",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontFamily: GoogleFonts.poppins(
                                                    fontWeight: FontWeight.w400)
                                                .fontFamily),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ));
          });
    });
  }
}

class ListView3 extends StatelessWidget {
  const ListView3({Key? key}) : super(key: key);
  static const warnaBiru = Color(0xff14213D);
  static const warnaOren = Color(0xffFCA311);
  static const warnaHitam = Colors.black;
  static const warnaPutih = Colors.white;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubitPinjam, HistoryModel>(
      builder: (context, history) {
        return ListView.builder(
            itemCount: history.dataHistory.length,
            itemBuilder: (context, index) {
              return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: warnaOren),
                  margin: const EdgeInsets.all(12.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 1,
                    height: MediaQuery.of(context).size.height * 0.22,
                    child: Stack(
                      children: [
                        Positioned(
                            bottom: 0,
                            right: 0,
                            left: 0,
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.12,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Lama Bayar",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  .fontFamily,
                                              color: warnaBiru),
                                        ),
                                        Text(
                                          "Total Bayar",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  .fontFamily,
                                              color: warnaBiru),
                                        ),
                                        Text(
                                          "Status",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w500)
                                                  .fontFamily,
                                              color: warnaBiru),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          history
                                              .dataHistory[index].jangka_waktu
                                              .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600)
                                                  .fontFamily,
                                              color: warnaPutih),
                                        ),
                                        Text(
                                          "Rp " +
                                              NumberFormat("###,###,###")
                                                  .format(history
                                                      .dataHistory[index]
                                                      .jumlah_tagihan)
                                                  .toString(),
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600)
                                                  .fontFamily,
                                              color: warnaPutih),
                                        ),
                                        Text(
                                          history.dataHistory[index].status,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600)
                                                  .fontFamily,
                                              color: warnaPutih),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 1,
                              decoration: BoxDecoration(
                                  color: warnaBiru,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20, left: 12, right: 12),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Image(
                                          image:
                                              AssetImage('../asset/logo2.png'),
                                          width: 80,
                                          height: 30,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "Peminjaman Pertama",
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.w600)
                                                  .fontFamily,
                                              color: warnaPutih),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ));
            });
      },
    );
  }
}
