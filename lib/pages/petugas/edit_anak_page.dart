import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stunting_app/pages/petugas/kms_petugas_page.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';

class EditAnakPagePetugas extends StatefulWidget {
  const EditAnakPagePetugas({super.key, required this.idAnak});

  final String idAnak;

  @override
  State<EditAnakPagePetugas> createState() => _EditAnakPageState();
}

class _EditAnakPageState extends State<EditAnakPagePetugas> {
  final _formKey = GlobalKey<FormState>();
  List<String> list = <String>['Ya', 'Tidak'];
  List<String> listJk = <String>['Laki-laki', 'Perempuan'];
  List<String> listGolongan = <String>['A', 'B', 'O', 'AB'];

  String dropdownValue = '';
  String? jkDrop;
  String? golonganDrop;
  String namaAnak = '';

  TextEditingController _namaLengkapController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _jenisKelaminController = TextEditingController();
  TextEditingController _anakLahirPrematurController = TextEditingController();
  TextEditingController _beratBadanController = TextEditingController();
  TextEditingController _tinggiBadanController = TextEditingController();
  TextEditingController _lingkarKepalaController = TextEditingController();
  TextEditingController _golonganDarahController = TextEditingController();
  TextEditingController _alergiController = TextEditingController();

  @override
  void initState() {
    _fetchAnak();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profil Anak $namaAnak")),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black26)),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/mpasiPetugasPage');
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/image/Tableware.png',
                                  width: 30,
                                ),
                                const Text('MPASI')
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      KmsPetugasPage(idanak: widget.idAnak),
                                ),
                              );
                            },
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.laptop,
                                  size: 30,
                                  color: Color.fromRGBO(87, 81, 203, 1),
                                ),
                                Text('KMS')
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Image.asset(
                                'assets/image/Motherroom.png',
                                width: 30,
                              ),
                              const Text('Posyandu')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Constant().margin),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _namaLengkapController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Nama Lengkap',
                      label: const Text('Nama Lengkap'),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _tanggalLahirController,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Tanggal Lahir',
                      label: const Text('Tanggal Lahir'),
                      suffixIcon: const Icon(Icons.calendar_today),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    underline: Container(),
                    isExpanded: true,
                    value: jkDrop,
                    hint: const Text("Jenis Kelamin"),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        jkDrop = value!;
                      });
                    },
                    items: listJk.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _anakLahirPrematurController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Apa Anak Lahir Prematur ?',
                      label: const Text('Apa Anak Lahir Prematur ?'),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _beratBadanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Berat Badan saat lahir (Kg)',
                      label: const Text('Berat Badan saat lahir (Kg)'),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _tinggiBadanController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Tinggi Badan saat lahir (Kg)',
                      label: const Text('Tinggi Badan saat lahir (Kg)'),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide:
                            const BorderSide(color: Colors.white, width: 0.0),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white,
                  ),
                  width: MediaQuery.of(context).size.width,
                  child: DropdownButton<String>(
                    dropdownColor: Colors.white,
                    underline: Container(),
                    isExpanded: true,
                    value: golonganDrop,
                    hint: const Text("Golongan Darah"),
                    style: const TextStyle(color: Colors.black),
                    onChanged: (String? value) {
                      // This is called when the user selects an item.
                      setState(() {
                        golonganDrop = value!;
                      });
                    },
                    items: listGolongan
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors
                          .grey.shade200, //background color of dropdown button
                      //border of dropdown button
                      borderRadius: BorderRadius.circular(
                          50), //border raiuds of dropdown button
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.grey.shade200,
                        value: list.first,
                        underline: Container(), //remove underline
                        isExpanded: true,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      margin: const EdgeInsets.symmetric(horizontal: 22),
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
                          Navigator.pushNamed(context, '/homeIbu');
                        },
                      ),
                    ))
              ]),
            ),
          )
        ],
      )),
    );
  }

  void _fetchAnak() async {
    // final response = await http
    //     .get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbu?nik=" + widget.nik));
    final response =
        await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showAnakAll"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i]['id_anak'].toString() == widget.idAnak) {
          _namaLengkapController.text = jsonResponse[i]['nama_lengkap'];
          _tanggalLahirController.text = jsonResponse[i]['tgl_lahir'];
          _jenisKelaminController.text = jsonResponse[i]['jenis_kelamin'];
          _anakLahirPrematurController.text = jsonResponse[i]['prematur'];
          _beratBadanController.text = jsonResponse[i]['bb_lahir'];
          _tinggiBadanController.text = jsonResponse[i]['panjang_lahir'];
          _golonganDarahController.text = jsonResponse[i]['gol_darah'];
          namaAnak = jsonResponse[i]['nama_lengkap'];
          setState(() {});
        }
      }
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
