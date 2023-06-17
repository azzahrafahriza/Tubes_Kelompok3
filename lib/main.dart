import 'package:flutter/material.dart';
// import 'package:tubes/auth_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login.dart';
import 'register.dart';
import 'main2.dart';
import 'user.dart';

void main() async {
  runApp(Main());
}

class Main extends StatelessWidget {
  Main({super.key});

  final UserCubit _usercubit = UserCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FUNDFLEX",
      // debugShowCheckedModeBanner: false,
      routes: {
        "/login": (context) =>
            BlocProvider.value(value: _usercubit, child: const Login()),
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
