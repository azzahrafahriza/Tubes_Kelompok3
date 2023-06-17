import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
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
  String url = "http://127.0.0.1:8000/login_user/?email=";
  UserCubit()
      : super(UserModel(
            userID: 0,
            nama: "",
            umkm: "",
            email: "",
            password: "",
            pin: "",
            no_Telp: "",
            saldo: 0)) {
    getUser();
  }

  void setFromJson(List json) async {
    final prefs = await SharedPreferences.getInstance();
    int userID = json[0];
    String nama = json[1];
    String umkm = json[2];
    String email = json[3];
    String password = json[4];
    String pin = json[5];
    String no_Telp = json[6];
    int saldo = json[7];
    print(saldo);

    await prefs.setInt('userID', userID);
    await prefs.setString('nama', nama);
    await prefs.setString('umkm', umkm);
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    await prefs.setString('pin', pin);
    await prefs.setString('no_Telp', no_Telp);
    await prefs.setInt('saldo', saldo);

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

  void fetchData(String email) async {
    url = url + email;
    final response = await http.get(Uri.parse(url), headers: {
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

  void getUser() async {
    final prefs = await SharedPreferences.getInstance();
    emit(UserModel(
        userID: prefs.getInt('userID') ?? 0,
        nama: prefs.getString('nama') ?? "",
        umkm: prefs.getString('umkm') ?? "",
        email: prefs.getString('email') ?? "",
        password: prefs.getString('password') ?? "",
        pin: prefs.getString('pin') ?? "",
        no_Telp: prefs.getString('no_Telp') ?? "",
        saldo: prefs.getInt('saldo') ?? 0));
  }

  void deleteUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('userID');
    await prefs.remove('nama');
    await prefs.remove('umkm');
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('pin');
    await prefs.remove('no_Telp');
    await prefs.remove('saldo');
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
  int jangka_waktu;
  String status;

  PinjamanModel(
      {required this.userID,
      required this.jumlah_pinjaman,
      required this.jumlah_tagihan,
      required this.tagihan_bulanan,
      required this.tagihan_terbayarkan,
      required this.jangka_waktu,
      required this.status});
}

class ListPinjaman {
  ListPinjaman() {
    List<PinjamanModel> listPinjaman = [];
  }
}
