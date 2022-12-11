import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/pages/orangtua/home_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/kms_anak_page.dart';
import 'package:stunting_app/pages/orangtua/login_orangtua_page.dart' as LoginOrangtua;
import 'package:stunting_app/pages/orangtua/lupa_password_page.dart';
import 'package:stunting_app/pages/orangtua/mpasi_anak_page.dart';
import 'package:stunting_app/pages/orangtua/profile_anak_page.dart';
import 'package:stunting_app/pages/orangtua/profile_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/register_orangtua_page.dart';
import 'package:stunting_app/pages/orangtua/add_anak_page.dart';
import 'package:stunting_app/pages/orangtua/edit_anak_page.dart';
import 'package:stunting_app/pages/orangtua/posyandu_page.dart';

import 'package:stunting_app/pages/petugas/add_ibu_page.dart';
import 'package:stunting_app/pages/petugas/edit_ibu_page.dart';
import 'package:stunting_app/pages/petugas/home_petugas_page.dart';
import 'package:stunting_app/pages/petugas/list_ibu_page.dart';
import 'package:stunting_app/pages/petugas/login_petugas_page.dart' as LoginPetugas;
import 'package:stunting_app/pages/petugas/profile_petugas_page.dart';
import 'package:stunting_app/pages/petugas/list_anak.dart';
import 'package:stunting_app/splash_page.dart';
import 'package:stunting_app/start_page.dart';

import 'package:stunting_app/shared/session.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  Widget loading() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pencegahan Dini Stunting',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: const SplashPage(),
      home: FutureBuilder(
        future: _loadSession(),
        builder: (context, snapshot) {
          Widget result = Container();


          if (snapshot.connectionState == ConnectionState.waiting) {
            result = Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              SharedPreferences prefs = snapshot.data;
              if (prefs.getBool(IS_LOGIN) ?? false) {
                if (prefs.getString(CATEGORY) ==
                    jenislogin.PETUGAS.toString()) {
                  result = LoginPetugas.LoginPetugasPage();
                }
                else {
                  result = LoginOrangtua.LoginOrangtuaPage();
                }
              }
              else {
                return SplashPage();
              }
            } else {
              return Container(child: Text('Terjadi kesalahan...'));
            }
          }
          return result;
        },
      ),
      routes: {
        //all
        '/splash': (context) => const SplashPage(),
        '/start': (context) => const StartPage(),
        // petugas
        '/loginPetugas': (context) => const LoginPetugas.LoginPetugasPage(),
        '/registrasiOrangtua': (context) => const RegisterOrangTuaPage(),
        '/homePetugas': (context) => const HomePetugasPage(),
        '/profilePetugas': (context) => const ProfilePetugasPage(),
        '/addIbu': (context) => const AddIbuPage(),
        '/editIbu': (context) => const EditIbuPage(),
        //orang tua
        '/loginIbu': (context) => const LoginOrangtua.LoginOrangtuaPage(),
        '/listIbu': (context) => const ListIbuPage(),
        '/profileIbu': (context) => const ProfileOrangTuaPage(),
        '/homeOrangtua': (context) => const HomeOrangtuaPage(),
        '/listAnak': (context) => const List_anakWidget(),
        '/lupaPassword': (context) => const LupaPasswordPage(),
        '/addAnak': (context) => const AddAnakPage(),
        // '/profileAnak': (context) => const ProfileAnakPage(),
        // '/editAnak': (context) => const EditAnakPage(),
        '/mpasiAnak': (context) => const MpasiAnakPage(),
        '/kmsAnak': (context) => const KmsAnakPage(),
        '/posyandu': (context) => const PosyanduPage(),
      },
    );
  }


  Future _loadSession() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }
}
