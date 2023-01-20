import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/userAuth.dart';
import 'package:stunting_app/pages/orangtua/home_orangtua_page.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/shared/util.dart';

class LoginOrangtuaPage extends StatefulWidget {
  // const LoginOrangtuaPage({ Key ? key, required this.anak}) : super(key: key);
  // final Anak anak;

  const LoginOrangtuaPage({super.key});

  // const LoginOrangtuaPage(Key key);

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
  bool remember_me = false;

  void onRemember(bool value) {
    setState(() {
      this.remember_me = value;
    });
  }

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
              height: 10,
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                width: 200,
                child: Image.asset('assets/image/login.png')),
            const SizedBox(
              height: 20,
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
                        height: 10,
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
                      'Login',
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
              height: 10,
            ),
            // Container(
            //   alignment: Alignment.center,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       Checkbox(
            //           value: this.remember_me,
            //           onChanged: (bool? newValue) {
            //             setState(() {
            //               this.remember_me = newValue!;
            //             });
            //           }
            //       ),
            //       Text('Remember me', style: TextStyle(color: Colors.indigo),)
            //     ],
            //   ),
            //
            // ),
            // const SizedBox(
            //   height: 10,
            // ),
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
    String msg='';
    try {
      final response = await login(UserAuth(userid: _usernameController.text, password: _passwordController.text, nama_lengkap: '', nik: '', category: '2' ?? ""));

      var jsonResp = jsonDecode(response.body);
      print(response.statusCode);
      if(response.statusCode == 500) { msg = 'Userid belum terdaftar.\nSilahkan registrasi!'; }
      else if(response.statusCode == 422) { msg = 'Userid atau password salah!'; }
      // print(jsonResp);
      String userid = jsonResp[0]['userid'];
      String nik = jsonResp[0]['nik'];
      String use = jsonResp[0]['userid'];
      print(nik);
      // var status = jsonDecode(response.statusCode);
      // print(status);
      if(use != null) {
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool('IS_LOGIN', true);
        await prefs.setString('userid', userid);
        await prefs.setString('nik', nik);
        // await prefs.setBool('remember_me', this.remember_me);
        // print(this.remember_me.toString());
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeOrangtuaPage(list: jsonResp)));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeOrangtuaPage()));
      } else {
        final snackBar = SnackBar(
          content: Text(msg)
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
      // print(context.toString());
      // String msg = 'Userid atau password salah!';
      // dialog(context, e.toString());
      dialog(context, msg);
      final snackBar = SnackBar(
          content: Text(msg)
      );
    }
  }
}
