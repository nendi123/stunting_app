import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/petugas/petugas_model.dart';
import 'package:stunting_app/model/petugas/petugas_post_model.dart';
import 'package:stunting_app/model/petugas/posyandu_model.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:http/http.dart' as http;

class ProfilePetugasPage extends StatefulWidget {
  const ProfilePetugasPage({super.key});

  @override
  State<ProfilePetugasPage> createState() => _ProfilePetugasPageState();
}

class _ProfilePetugasPageState extends State<ProfilePetugasPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _hpController = TextEditingController();
  TextEditingController _posyanduController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();

  String? txtCity;
  List<Posyandu> listPosyandu = [];

  @override
  void initState() {
    _fetchPetugas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Profile Petugas'),
        leading: IconButton(
          //menu icon button at start left of appbar
          onPressed: () {
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/homePetugas');
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          'Profile Petugas',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        toolbarHeight: 50,
        elevation: 30.0,
      ),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: Constant().margin),
        child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(80.0), //or 15.0
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      color: Colors.white,
                      child: Image.asset('assets/image/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: const Text(
                    "Unggah Foto Anda",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Column(
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
                          return 'Please enter some text';
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
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _alamatController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Alamat',
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
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'E-mail',
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
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _hpController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'No HP',
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
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FutureBuilder<List<Posyandu>>(
                      future: _fetchPosyandu(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<Posyandu>? data = snapshot.data;
                          return Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: Constant().margin),
                            child: DropdownButton<String>(
                              dropdownColor: Colors.grey.shade200,
                              underline: Container(),
                              isExpanded: true,
                              elevation: 16,
                              hint: const Text("Pilih Posyandu"),
                              style: const TextStyle(color: Colors.black),
                              value: txtCity,
                              items: snapshot.data
                                  ?.map((data) => DropdownMenuItem<String>(
                                        value: data.kodePosyandu,
                                        child: Text(data.namaPosyandu),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                txtCity = value;
                                setState(() {});
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // TextFormField(
                    //   controller: _posyanduController,
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: Colors.white,
                    //       hintText: 'Nama Posyandu',
                    //       contentPadding: EdgeInsets.symmetric(
                    //           horizontal: Constant().margin),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //       enabledBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //         borderSide: const BorderSide(
                    //             color: Colors.white, width: 0.0),
                    //       )),
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter some text';
                    //     }
                    //     return null;
                    //   },
                    // ),
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
                              'Simpan',
                              style: TextStyle(fontSize: 18),
                            ),
                            onPressed: () {
                              PetugasPostMode.editPetugas(
                                      _nikController.text,
                                      _namaController.text,
                                      _alamatController.text,
                                      _emailController.text,
                                      _hpController.text,
                                      txtCity!,
                                      _posyanduController.text)
                                  .then((value) => {
                                        if (value)
                                          {
                                            _showMyDialog(
                                                "Data Berhasil di Edit", true)
                                          }
                                        else
                                          {
                                            _showMyDialog(
                                                "Data Gagal di Edit", false)
                                          }
                                      });
                            },
                          ),
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            )),
      )),
    );
  }

  void _fetchPetugas() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final response = await http
        .get(Uri.parse("${AppConfig.API_ENDPOINT}/showPetugasPosyanduAll"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }

      for (var i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i]['nik'] == prefs.getString('nik')) {
          _alamatController.text = jsonResponse[i]['alamat'];
          _emailController.text = jsonResponse[i]['email'];
          _hpController.text = jsonResponse[i]['no_hp'];
          _posyanduController.text = jsonResponse[i]['kode_posyandu'];
          txtCity = jsonResponse[i]['kode_posyandu'];
          _namaController.text = jsonResponse[i]['nama_lengkap'];
          _nikController.text = jsonResponse[i]['nik'];
          setState(() {});
        }
      }
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<List<Posyandu>> _fetchPosyandu() async {
    final response =
        await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showPosyanduAll"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      return jsonResponse.map((job) => Posyandu.responseApi(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<void> _showMyDialog(String body, bool hasil) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Pemberitahuan'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(body),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                if (hasil) {
                  Navigator.pushNamed(context, '/homePetugas');
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
