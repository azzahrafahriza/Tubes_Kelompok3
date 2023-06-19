import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class UserModel {
  int userID;
  String nama;
  String umkm;
  String email;
  String password;
  String pin;
  String no_Telp;
  int saldo;

  UserModel(
      {required this.userID,
      required this.nama,
      required this.umkm,
      required this.email,
      required this.password,
      required this.pin,
      required this.no_Telp,
      required this.saldo});
}

class UserCubit extends Cubit<UserModel> {
  final String url = "http://127.0.0.1:8000/login_user/?email=";
  UserCubit()
      : super(UserModel(
            userID: 0,
            nama: "",
            umkm: "",
            email: "",
            password: "",
            pin: "",
            no_Telp: "",
            saldo: 0)) {}

  void setFromJson(List json) async {
    if (json[0] != "Salah") {
      int userID = json[0];
      String nama = json[1];
      String umkm = json[2];
      String email = json[3];
      String password = json[4];
      String pin = json[5];
      String no_Telp = json[6];
      int saldo = json[7];
      print(saldo);

      emit(UserModel(
          userID: userID,
          nama: nama,
          umkm: umkm,
          email: email,
          password: password,
          pin: pin,
          no_Telp: no_Telp,
          saldo: saldo));
    }
  }

  void fetchData(String email) async {
    final response = await http.get(Uri.parse(url + email), headers: {
      "Accept": "application/json",
      "Access-Control_Allow_Origin": "*"
    });
    if (response.statusCode == 200) {
      //sukses
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Email Salah');
    }
  }

  getid() {
    return state.userID;
  }

  getSaldo() {
    return state.saldo;
  }

  getUser() {
    return state.nama;
  }

  // void getUser() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   emit(UserModel(
  //       userID: prefs.getInt('userID') ?? 0,
  //       nama: prefs.getString('nama') ?? "",
  //       umkm: prefs.getString('umkm') ?? "",
  //       email: prefs.getString('email') ?? "",
  //       password: prefs.getString('password') ?? "",
  //       pin: prefs.getString('pin') ?? "",
  //       no_Telp: prefs.getString('no_Telp') ?? "",
  //       saldo: prefs.getInt('saldo') ?? 0));
  // }

  void deleteUser() async {
    emit(UserModel(
        userID: 0,
        nama: "",
        umkm: "",
        email: "",
        password: "",
        pin: "",
        no_Telp: "",
        saldo: 0));
  }
}

class PinjamanModel {
  int userID;
  int jumlah_pinjaman;
  int jumlah_tagihan;
  int tagihan_bulanan;
  int tagihan_terbayarkan;
  String jangka_waktu;
  var tenggat_waktu;
  var perpanjangan;
  var cashback;
  String status;

  PinjamanModel(
      {required this.userID,
      required this.jumlah_pinjaman,
      required this.jumlah_tagihan,
      required this.tagihan_bulanan,
      required this.tagihan_terbayarkan,
      required this.jangka_waktu,
      required this.tenggat_waktu,
      required this.perpanjangan,
      required this.cashback,
      required this.status});
}

class PeminjamanBerjalanCubit extends Cubit<PinjamanModel> {
  PeminjamanBerjalanCubit()
      : super(PinjamanModel(
            userID: 0,
            jumlah_pinjaman: 0,
            jumlah_tagihan: 0,
            tagihan_bulanan: 0,
            tagihan_terbayarkan: 0,
            jangka_waktu: "",
            tenggat_waktu: "0001-01-01 00:00:00.000",
            perpanjangan: Null,
            cashback: Null,
            status: ""));

  void setFromJson(Map<String, dynamic> json) {
    if (json['ID'] != 0) {
      emit(PinjamanModel(
          userID: json['ID'],
          jumlah_pinjaman: json['jumlah_pinjaman'],
          jumlah_tagihan: json['jumlah_tagihan'],
          tagihan_bulanan: json['tagihan_bulanan'],
          tagihan_terbayarkan: json['tagihan_terbayarkan'],
          jangka_waktu: json['jangka_waktu'],
          tenggat_waktu: json['tenggat_waktu'],
          perpanjangan: json['perpanjangan'],
          cashback: json['cashback'],
          status: json['status']));
    } else {
      emit(PinjamanModel(
          userID: 0,
          jumlah_pinjaman: 0,
          jumlah_tagihan: 0,
          tagihan_bulanan: 0,
          tagihan_terbayarkan: 0,
          jangka_waktu: "",
          tenggat_waktu: "0001-01-01 00:00:00.000",
          perpanjangan: Null,
          cashback: Null,
          status: ""));
    }
  }

  getStatus() {
    return state.status;
  }

  getTagihanBulanan() {
    return state.tagihan_bulanan;
  }

  getJumlahTagihan() {
    return state.jumlah_tagihan;
  }

  getTagihanTerbayar() {
    return state.tagihan_terbayarkan;
  }

  getCashback() {
    return state.cashback;
  }

  getPotongan(String kode) async {
    final url = "http://127.0.0.1:8000/potongan_promo/?kode=";
    final response = await http.get(Uri.parse(url + kode));
    if (response.statusCode == 200) {
      var jcode = jsonDecode(response.body);
      return jcode['cashback'];
    } else {
      throw Exception('Gagal load');
    }
  }

  void fetchData(String id) async {
    final url = "http://127.0.0.1:8000/pinjaman_berjalan/?id=";
    final response = await http.get(Uri.parse(url + id));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

// class ListPinjaman {
//   ListPinjaman() {
//     List<PinjamanModel> listPinjaman = [];
//   }
// }

class DetilJenisPromoModel {
  String id;
  String judul;
  String tenggat;
  String desc;
  String kode;

  DetilJenisPromoModel(
      {required this.id,
      required this.judul,
      required this.tenggat,
      required this.desc,
      required this.kode}); //constructor
}

class DetilJenisPromoCubit extends Cubit<DetilJenisPromoModel> {
  //String url = "http://127.0.0.1:8000/detil_jenis_pinjaman/";
  String url = "http://127.0.0.1:8000/tampilkan_promo_detail/";

  DetilJenisPromoCubit()
      : super(DetilJenisPromoModel(
            id: '', judul: '', tenggat: '', desc: '', kode: ''));

  //map dari json ke atribut
  void setFromJson(Map<String, dynamic> json) {
    emit(DetilJenisPromoModel(
        id: json["id"],
        judul: json["judul"],
        tenggat: json["tenggat"],
        desc: json["desc"],
        kode: json["kode"]));
  }

  void fetchData(String id) async {
    String urlJenis = "$url$id";
    final response = await http.get(Uri.parse(urlJenis));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

// -----------------------------------------------------------

class JenisPromo {
  String id;
  String judulpromo;
  String desc;
  String kode;
  JenisPromo(
      {required this.id,
      required this.judulpromo,
      required this.desc,
      required this.kode});
}

class JenisPromoModel {
  List<JenisPromo> dataPromo;
  JenisPromoModel({required this.dataPromo});
}

class JenisPromoCubit extends Cubit<JenisPromoModel> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_promo/";

  JenisPromoCubit() : super(JenisPromoModel(dataPromo: []));

  void setFromJson(Map<String, dynamic> json) {
    var arrData = json["data"];
    List<JenisPromo> arrOut = [];
    for (var el in arrData) {
      String id = el["id"];
      String judulpromo = el["judul"];
      String desc = el["desc"];
      String kode = el["kode"];
      arrOut.add(JenisPromo(
          id: el["id"],
          judulpromo: el["judul"],
          desc: el["desc"],
          kode: el["kode"]));
    }
    emit(JenisPromoModel(dataPromo: arrOut));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

class JenisArtikel {
  String id;
  String judulart;
  String desc;
  String gambar;
  JenisArtikel(
      {required this.id,
      required this.judulart,
      required this.desc,
      required this.gambar});
}

class JenisArtikelModel {
  List<JenisArtikel> dataArt;
  JenisArtikelModel({required this.dataArt});
}

class JenisArtikelCubit extends Cubit<JenisArtikelModel> {
  String url = "http://127.0.0.1:8000/tampilkan_semua_artikel/";

  JenisArtikelCubit() : super(JenisArtikelModel(dataArt: []));

  void setFromJson(Map<String, dynamic> json) {
    var arrData = json["data"];
    List<JenisArtikel> arrOut = [];

    for (var el in arrData) {
      String id = el["id"];
      String judulart = el["judul"];
      String desc = el["desc"];
      String gambar = el["gambar"];
      arrOut.add(JenisArtikel(
          id: el["id"],
          judulart: el["judul"],
          desc: el["desc"],
          gambar: el["gambar"]));
    }
    emit(JenisArtikelModel(dataArt: arrOut));
  }

  void fetchData() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

//-----------------------------------------------------

class HistoryModel {
  List<PinjamanModel> dataHistory;
  HistoryModel({required this.dataHistory});
}

class HistoryCubitPinjam extends Cubit<HistoryModel> {
  String urlpinjam = "http://127.0.0.1:8000/history_peminjaman/";

  HistoryCubitPinjam() : super(HistoryModel(dataHistory: []));

  void setFromJson(Map<String, dynamic> json) {
    var arrData = json["data"];

    List<PinjamanModel> arrOut = [];

    for (var el in arrData) {
      int id = el["id"];
      int jumlah_pinjaman = el["jumlah_pinjaman"];
      int jumlah_tagihan = el["jumlah_tagihan"];
      int tagihan_bulanan = el["tagihan_bulanan"];
      int tagihan_terbayarkan = el["tagihan_terbayarkan"];
      String jangka_waktu = el["jangka_waktu"];
      var tenggat_waktu = el["tenggat_waktu"];
      var perpanjangan = el["perpanjangan"];
      var cashback = el["cashback"];
      String status = el["status"];
      arrOut.add(PinjamanModel(
          userID: el["id"],
          jumlah_pinjaman: el["jumlah_pinjaman"],
          jumlah_tagihan: el["jumlah_tagihan"],
          tagihan_bulanan: el["tagihan_bulanan"],
          tagihan_terbayarkan: el["tagihan_terbayarkan"],
          jangka_waktu: el["jangka_waktu"],
          tenggat_waktu: el["tenggat_waktu"],
          perpanjangan: el["perpanjangan"],
          cashback: el["cashback"],
          status: el["status"]));
    }
    emit(HistoryModel(dataHistory: arrOut));
  }

  void fetchPinjam(String id) async {
    String urlJenis = "$urlpinjam$id";
    final response = await http.get(Uri.parse(urlJenis));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}

class HistoryCubitPanjang extends Cubit<HistoryModel> {
  String urlpanjang = "http://127.0.0.1:8000/history_perpanjangan/";

  HistoryCubitPanjang() : super(HistoryModel(dataHistory: []));

  void setFromJson(Map<String, dynamic> json) {
    var arrData = json["data"];

    List<PinjamanModel> arrOut = [];

    for (var el in arrData) {
      int id = el["id"];
      int jumlah_pinjaman = el["jumlah_pinjaman"];
      int jumlah_tagihan = el["jumlah_tagihan"];
      int tagihan_bulanan = el["tagihan_bulanan"];
      int tagihan_terbayarkan = el["tagihan_terbayarkan"];
      String jangka_waktu = el["jangka_waktu"];
      var tenggat_waktu = el["tenggat_waktu"];
      var cashback = el["cashback"];
      var perpanjangan = el["perpanjangan"];
      String status = el["status"];
      arrOut.add(PinjamanModel(
          userID: el["id"],
          jumlah_pinjaman: el["jumlah_pinjaman"],
          jumlah_tagihan: el["jumlah_tagihan"],
          tagihan_bulanan: el["tagihan_bulanan"],
          tagihan_terbayarkan: el["tagihan_terbayarkan"],
          jangka_waktu: el["jangka_waktu"],
          tenggat_waktu: el["tenggat_waktu"],
          perpanjangan: el["perpanjangan"],
          cashback: el["cashback"],
          status: el["status"]));
    }
    emit(HistoryModel(dataHistory: arrOut));
  }

  void fetchPanjang(String id) async {
    String urlJenis = "$urlpanjang$id";
    final response = await http.get(Uri.parse(urlJenis));
    if (response.statusCode == 200) {
      setFromJson(jsonDecode(response.body));
    } else {
      throw Exception('Gagal load');
    }
  }
}
