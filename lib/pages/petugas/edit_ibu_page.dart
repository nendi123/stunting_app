import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/petugas/ibu_post_model.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';

class EditIbuPage extends StatefulWidget {
  const EditIbuPage({super.key, required this.nik});

  final String nik;

  @override
  State<EditIbuPage> createState() => _EditIbuPageState();
}

class _EditIbuPageState extends State<EditIbuPage> {
  List<String> listKK = <String>['Punya', 'Tidak'];
  List<String> listNikah = <String>['Ya', 'Tidak'];
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  String dropdownValue = '';
  String? pendidikanDrop;
  String? kecamatanDrop;
  String? desaDrop;
  String? pekerjaanDrop;
  String? statusNikahDrop;
  String? kkDrop;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _hpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _kelurahanController = TextEditingController();
  TextEditingController _kecamatanController = TextEditingController();
  TextEditingController _pendidikanController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _beratBadanController = TextEditingController();
  TextEditingController _tinggiBadanController = TextEditingController();
  TextEditingController _statusKkController = TextEditingController();
  TextEditingController _kode_posyanduController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    _fetchIbu();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          //menu icon button at start left of appbar
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          'Edit Data Ibu',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
          child: Container(
        color: Colors.grey.shade200,
        child: Form(
            key: _formKey,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nikController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'NIK',
                        label: const Text("NIK"),
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _namaController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Nama Lengkap',
                        label: const Text("Nama Lengkap"),
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _alamatController,
                    keyboardType: TextInputType.streetAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Alamat',
                        label: const Text("Alamat"),
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Email',
                        label: const Text("Email"),
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _hpController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'No HP',
                        label: const Text("No HP"),
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tglLahirController,
                    keyboardType: TextInputType.datetime,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tanggal Lahir',
                        label: const Text("Tanggal Lahir"),
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context)),
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
                    height: 20,
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
                      value: desaDrop,
                      hint: const Text("Pilih Kelurahan / Desa"),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          desaDrop = value!;
                        });
                      },
                      items: Constant()
                          .namaKampung
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      value: kecamatanDrop,
                      hint: const Text("Pilih Kecamatan"),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          kecamatanDrop = value!;
                        });
                      },
                      items: Constant()
                          .namaDistrik
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      value: pendidikanDrop,
                      hint: const Text("Pilih Pendidikan"),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          pendidikanDrop = value!;
                        });
                      },
                      items: Constant()
                          .pendidikan
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      value: pekerjaanDrop,
                      hint: const Text("Pilih Pekerjaan"),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          pekerjaanDrop = value!;
                        });
                      },
                      items: Constant()
                          .pekerjaan
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
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
                      value: statusNikahDrop,
                      hint: const Text("Status Nikah"),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          statusNikahDrop = value!;
                        });
                      },
                      items: listNikah
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _beratBadanController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Berat Badan',
                        label: const Text("Berat Badan"),
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
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tinggiBadanController,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tinggi Badan',
                        label: const Text("Tinggi Badan"),
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
                    height: 20,
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
                      value: kkDrop,
                      hint: const Text("Status Kartu Keluarga"),
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? value) {
                        // This is called when the user selects an item.
                        setState(() {
                          kkDrop = value!;
                        });
                      },
                      items:
                          listKK.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      )),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Colors.grey.shade200,
        width: MediaQuery.of(context).size.width,
        height: 58,
        padding: EdgeInsets.symmetric(horizontal: Constant().margin),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(87, 81, 203, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: const Text(
            'Simpan',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () async {
            // var statusKk = "";
            // if (dropdownValue == "Punya") {
            //   statusKk = "Ya";
            // }
            final SharedPreferences prefs = await _prefs;
            IbuPostMode.editIbu(
                    _nikController.text,
                    _namaController.text,
                    _alamatController.text,
                    _hpController.text,
                    _tglLahirController.text,
                    desaDrop.toString(),
                    kecamatanDrop.toString(),
                    pendidikanDrop.toString(),
                    pekerjaanDrop.toString(),
                    statusNikahDrop.toString(),
                    _beratBadanController.text,
                    _tinggiBadanController.text,
                    kkDrop.toString(),
                    _kode_posyanduController.text)
                .then((value) => {
                      if (value)
                        {_showMyDialog("Data Berhasil di Edit", true)}
                      else
                        {_showMyDialog("Data Gagal di Edit", false)}
                    });
          },
        ),
      )),
    );
  }

  void _fetchIbu() async {
    // final response = await http
    //     .get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbu?nik=" + widget.nik));
    final response =
        await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbuAll"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i]['nik'] == widget.nik) {
          _nikController.text = jsonResponse[i]['nik'];
          _namaController.text = jsonResponse[i]['nama_lengkap'];
          _tglLahirController.text = jsonResponse[i]['tgl_lahir'];
          _alamatController.text = jsonResponse[i]['alamat'];
          _hpController.text = jsonResponse[i]['no_hp'];
          desaDrop = jsonResponse[i]['kode_kelurahan'];
          kecamatanDrop = jsonResponse[i]['kode_distrik'];
          _beratBadanController.text = jsonResponse[i]['berat_badan'];
          _tinggiBadanController.text = jsonResponse[i]['tinggi_badan'];
          pendidikanDrop = jsonResponse[i]['pendidikan'];
          pekerjaanDrop = jsonResponse[i]['pekerjaan'];
          statusNikahDrop = jsonResponse[i]['status_nikah'];
          kkDrop = jsonResponse[i]['memiliki_kk'].toString();
          _kode_posyanduController.text =
              jsonResponse[i]['kode_posyandu'].toString();
          setState(() {});
        }
      }
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var dates = selectedDate.toString().split(' ');
        _tglLahirController.text = dates[0];
      });
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
                  Navigator.pushNamed(context, '/listIbu');
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
