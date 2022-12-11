import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/model/userAuth.dart';
import 'dart:convert';
import 'package:stunting_app/shared/util.dart';
import 'package:async/async.dart';
import 'package:http/http.dart';
import 'package:stunting_app/pages/orangtua/home_orangtua_page.dart';
import 'package:stunting_app/shared/session.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginOrangtuaPage extends StatefulWidget {
  const LoginOrangtuaPage({super.key});

  @override
  State<LoginOrangtuaPage> createState() => _LoginOrangtuaPageState();
}

class _LoginOrangtuaPageState extends State<LoginOrangtuaPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  //_usernameController  _passwordController
  var _obsecText = true;
  Icon _iconLock = Icon(Icons.lock);

  String inkwell='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/background.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: const Text(
                "SELAMAT DATANG",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                width: 200,
                child: Image.asset('assets/image/login.png')),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email atau userid',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: Constant().margin),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harus diisi!';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: _obsecText,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Password',
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: Constant().margin),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(
                                  color: Colors.white, width: 0.0),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Harus diisi';
                          }
                          return null;
                        },
                      ),
                    ],
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(87, 81, 203, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      'Sign In',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () =>
                      (_formKey.currentState!.validate())
                        ? prosesLogin()
                        : null,
                  ),
                )
            ),
            const SizedBox(
              height: 10,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 58,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(87, 81, 203, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                    child: const Text(
                      'Registrasi',
                      style: TextStyle(fontSize: 18),
                    ),
                    onPressed: () => {
                        Navigator.pushNamed(context, '/registrasiOrangtua')
                    }
                  ),
                )
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/lupaPassword');
                      // setState(() {
                      //   inkwell='Inkwell Tapped';
                      // });
                    },
                    onLongPress: () {
                      Navigator.pushNamed(context, '/lupaPassword');
                      // setState(() {
                      //   inkwell='InkWell Long Pressed';
                      // });
                    },
                    child: Container(
                        color: Colors.transparent,
                        width: 300,
                        height: 20,
                        child: Center(
                            child: Text(
                              'Lupa Password',
                              textScaleFactor: 1,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.indigo,
                              ),
                            ))),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(inkwell,textScaleFactor: 2,),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }

  void prosesLogin() async {
    final List list;
    ////_usernameController  _passwordController
    try {
      final response = await login(UserAuth(userid: _usernameController.text, password: _passwordController.text, nama_lengkap: '', nik: '', category: '2' ?? ""));

      var jsonResp = jsonDecode(response.body);
      print(jsonResp);
      String userid = jsonResp[0]['userid'];
      String nik = jsonResp[0]['nik'];
      String use = jsonResp[0]['userid'];
      if(use != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('IS_LOGIN', true);
        await prefs.setString('userid', userid);
        await prefs.setString('nik', nik);
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeOrangtuaPage(list: jsonResp)));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeOrangtuaPage()));
      } else {
        final snackBar = SnackBar(
          content: const Text('Userid atau password salah!')
        );
      }
      // if(response.statusCode == 200) {
      //   UserAuth userAuth = UserAuth.fromJson(jsonResp['userid']);
      //   // if (userAuth.userid != null) {
      //   //
      //   // } else {
      //   //
      //   // }
      //   Navigator.pushReplacement(context,
      //       MaterialPageRoute(builder: (context) => HomeOrangtuaPage()));
      // } else if(response.statusCode == 401) {
      //     dialog(context, jsonResp['message']);
      // } else {
      //     dialog(context, response);
      // }
    } catch (e) {
      String msg = 'Userid atau password salah!';
      // dialog(context, e.toString());
      dialog(context, msg);
      final snackBar = SnackBar(
          content: const Text('Userid atau password salah!')
      );
    }
  }
}
