import 'package:flutter/material.dart';
import 'package:stunting_app/pages/orangtua/home_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/profile_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/register_orangtua_page.dart';
import 'package:stunting_app/pages/petugas/home_petugas_page.dart';
import 'package:stunting_app/pages/petugas/list_ibu_page.dart';
import 'package:stunting_app/pages/petugas/login_petugas_page.dart';
import 'package:stunting_app/pages/petugas/profile_petugas_page.dart';
import 'package:stunting_app/splash_page.dart';
import 'package:stunting_app/start_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stunting App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashPage(),
      routes: {
        '/splash': (context) => const SplashPage(),
        '/start': (context) => const StartPage(),
        '/loginPetugas': (context) => const LoginPetugasPage(),
        '/registrasiOrangtua': (context) => const RegisterOrangTuaPage(),
        '/homePetugas': (context) => const HomePetugasPage(),
        '/listIbu': (context) => const ListIbuPage(),
        '/profileIbu': (context) => const ProfileOrangTuaPage(),
        '/homeOrangtua': (context) => const HomeOrangtuaPage(),
        '/profilePetugas': (context) => const ProfilePetugasPage(),
      },
    );
  }
}
