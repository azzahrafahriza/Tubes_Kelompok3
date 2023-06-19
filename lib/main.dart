import 'package:flutter/material.dart';
// import 'package:tubes/auth_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';
import 'register.dart';
import 'main2.dart';
import 'bloc.dart';

void main() async {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  final UserCubit _usercubit = UserCubit();
  final JenisPromoCubit _promocubit = JenisPromoCubit();
  final JenisArtikelCubit _artikelcubit = JenisArtikelCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FUNDFLEX",
      // debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) => MultiBlocProvider(providers: [
              BlocProvider<UserCubit>(
                create: (BuildContext context) => UserCubit(),
              ),
              BlocProvider<PeminjamanBerjalanCubit>(
                create: (BuildContext context) => PeminjamanBerjalanCubit(),
              ),
              BlocProvider<JenisPromoCubit>(
                create: (BuildContext context) => JenisPromoCubit(),
              ),
              BlocProvider<DetilJenisPromoCubit>(
                  create: (BuildContext context) => DetilJenisPromoCubit()),
              BlocProvider<JenisArtikelCubit>(
                  create: (BuildContext context) => JenisArtikelCubit()),
            ], child: const Login()),
        "/register": (context) => const Register(),
        "/home": (context) => BlocProvider.value(
            value: _usercubit,
            child: const MainRouting(
              selectedIndex: 0,
            )),
      },
      initialRoute: "/login",
    );
  }
}
