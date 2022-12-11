import 'package:flutter/material.dart';
import 'package:stunting_app/pages/orangtua/home_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/kms_anak_page.dart';
import 'package:stunting_app/pages/orangtua/login_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/lupa_password_page.dart';
import 'package:stunting_app/pages/orangtua/mpasi_anak_page.dart';
import 'package:stunting_app/pages/orangtua/profile_anak_page.dart';
import 'package:stunting_app/pages/orangtua/profile_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/register_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/add_anak_page.dart';
import 'package:stunting_app/pages/orangtua/edit_anak_page.dart';
import 'package:stunting_app/pages/orangtua/posyandu_page.dart';
import 'package:stunting_app/pages/petugas/add_anak_page.dart';

import 'package:stunting_app/pages/petugas/add_ibu_page.dart';
import 'package:stunting_app/pages/petugas/add_skrining_page.dart';
import 'package:stunting_app/pages/petugas/edit_anak_page.dart';
import 'package:stunting_app/pages/petugas/edit_ibu_page.dart';
import 'package:stunting_app/pages/petugas/home_ibu_page.dart';
import 'package:stunting_app/pages/petugas/home_petugas_page.dart';
import 'package:stunting_app/pages/petugas/list_ibu_page.dart';
import 'package:stunting_app/pages/petugas/list_anak_page.dart';
import 'package:stunting_app/pages/petugas/login_petugas_page.dart';
import 'package:stunting_app/pages/petugas/mpasi_anak_page.dart';
import 'package:stunting_app/pages/petugas/profile_petugas_page.dart';
import 'package:stunting_app/pages/petugas/list_anak.dart';
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
        //all
        '/splash': (context) => const SplashPage(),
        '/start': (context) => const StartPage(),
        // petugas
        '/loginPetugas': (context) => const LoginPetugasPage(),
        '/registrasiOrangtua': (context) => const RegisterOrangTuaPage(),
        '/homePetugas': (context) => const HomePetugasPage(),
        '/profilePetugas': (context) => const ProfilePetugasPage(),
        '/addIbu': (context) => const AddIbuPage(),

        '/homeIbu': (context) => const HomeIbuPage(),
        '/listAnakPage': (context) => const ListAnakPage(),
        '/editAnakPage': (context) => const EditAnakPagePetugas(),
        '/mpasiPetugasPage': (context) => const MpasiAnakPagePetugas(),
        '/addAnakPage': (context) => const AddAnakPagePetugas(),
        '/skriningPage': (context) => const AddSkriningPage(),
        //orang tua
        '/loginIbu': (context) => const LoginOrangtuaPage(),
        '/listIbu': (context) => const ListIbuPage(),
        '/profileIbu': (context) => const ProfileOrangTuaPage(),
        '/homeOrangtua': (context) => const HomeOrangtuaPage(),
        '/listAnak': (context) => const List_anakWidget(),
        '/lupaPassword': (context) => const LupaPasswordPage(),
        '/addAnak': (context) => const AddAnakPage(),
        '/profileAnak': (context) => const ProfileAnakPage(),
        '/editAnak': (context) => const EditAnakPage(),
        '/mpasiAnak': (context) => const MpasiAnakPage(),
        '/kmsAnak': (context) => const KmsAnakPage(),
        '/posyandu': (context) => const PosyanduPage(),
      },
    );
  }
}
