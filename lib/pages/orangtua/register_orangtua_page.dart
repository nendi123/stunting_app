import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/model/userAuth.dart';
import 'dart:convert';
import 'package:stunting_app/shared/util.dart';
// import 'package:stunting_app/shared/util.dart';
// import 'package:async/async.dart';
// import 'package:http/http.dart';

class RegisterOrangTuaPage extends StatefulWidget {
  const RegisterOrangTuaPage({super.key});

  @override
  State<RegisterOrangTuaPage> createState() => _RegisterOrangTuaPageState();
}

class _RegisterOrangTuaPageState extends State<RegisterOrangTuaPage> {
  String inkwell='';
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _useridController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _rePasswordController = TextEditingController();
  //_nikController _namaController  _emailController  _passwordController  _rePasswordController
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
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
              child: const Text(
                "Silahkan lakukan registrasi agar dapat menggunakan aplikasi ini",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nikController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'NIK',
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
                          return 'Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _namaController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Nama Lengkap',
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
                          return 'Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _useridController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'UserID',
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
                          return 'Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Password',
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
                          return 'Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _rePasswordController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Re-password',
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
                          return 'Tidak boleh kosong';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 58,
                          margin: EdgeInsets.symmetric(
                              horizontal: Constant().margin),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(87, 81, 203, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30))),
                            child: const Text(
                              'Registrasi',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: ()
                              // Navigator.pushNamed(context, '/profileIbu');
                              async => (_formKey.currentState!.validate())
                                  ? prosesRegistrasi()
                                  : null,
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/loginIbu');
                              // setState(() {
                              //   inkwell='Inkwell Tapped';
                              // });
                            },
                            onLongPress: () {
                              Navigator.pushNamed(context, '/loginIbu');
                              // setState(() {
                              //   inkwell='InkWell Long Pressed';
                              // });
                            },
                            child: Container(
                                color: Colors.transparent,
                                width: 300,
                                height: 30,
                                child: Center(
                                    child: Text(
                                      'Sudah Punya akun ? Sign In',
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
              ),
            )
          ],
        ),
      )),
    );
  }

  void prosesRegistrasi() async {
    //_nikController _namaController  _useridController  _passwordController  _rePasswordController
    final response = await userCreate(UserAuth(userid: _useridController.text, password: _passwordController.text, nama_lengkap: _namaController.text, nik: _nikController.text, category: '2' ?? ""));

    if(response != null) {
      print(response.body.toString());
      if(response.statusCode == 200) {
        var jsonResp = jsonDecode(response.body);
        Navigator.pop(context, jsonResp['message']);
      } else {
        dialog(context, "${response.body.toString()}");
        Navigator.pop(context, "${response.body.toString()}");
      }
    }
  }
}


