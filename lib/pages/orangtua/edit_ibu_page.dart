import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/distrik.dart';
import 'package:stunting_app/model/kelurahan.dart';
import 'package:stunting_app/model/petugas/ibu_post_model.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/shared/input_number.dart';
import 'package:stunting_app/shared/input_text.dart';

class EditIbuPage extends StatefulWidget {
  const EditIbuPage({super.key, required this.nik});

  final String nik;

  @override
  State<EditIbuPage> createState() => _EditIbuPageState();
}

class _EditIbuPageState extends State<EditIbuPage> {
  List<String> list = <String>['Punya', 'Tidak'];
  List<String> statusMenikah = <String>['Menikah','Tidak Menikah','Cerai'];
  List<String> statusKK = <String>['Ya','Tidak'];
  List<String> statusPekerjaan = <String>["IRT","Petani/Buruh","PNS","Swasta","Wirtaswasta"];
  List<String> listKelurahan = [];
  List<String>? listDistrik;

  String dropdownValue = '';
  String _selectKelurahan = Wilayah().namaKelurahanKampung[0];
  String _selectDistrik = Wilayah().namaDistrik[0];
  // String _selectPosyandu = Wilayah().namaPosyandu[0];
  String _selectPuskesmas = Wilayah().namaPuskesmas[0];
  String _selectPendidikan = Pendidikan().pendidikanDrop[0];
  String? status_nikah;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _hpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _kelurahanController = TextEditingController();
  TextEditingController _namaKampungController = TextEditingController();
  TextEditingController _namaDistrikController = TextEditingController();
  TextEditingController _kecamatanController = TextEditingController();
  TextEditingController _pendidikanController = TextEditingController();
  TextEditingController _pekerjaanController = TextEditingController();
  TextEditingController _statusController = TextEditingController();
  TextEditingController _beratBadanController = TextEditingController();
  TextEditingController _tinggiBadanController = TextEditingController();
  TextEditingController _statusKkController = TextEditingController();
  TextEditingController _kode_posyandu = TextEditingController();

  DateTime selectedDate = DateTime.now();

  var kampung;
  var distrik;
  String? sekolah;
  String? statusNikah;
  String? statusPunyaKK;
  String? pekerjaan;

  @override
  void initState() {
    _fetchIbu();
    super.initState();
  }

  _fetchKelurahan() async {
    List<Kelurahan> desa = await fetchKelurahan();
    if(desa.isNotEmpty) {
      _selectKelurahan = desa[0].nama_kelurahan;
    }
  }

  _fetchDistrik() async {
    List<Distrik> distrik = await fetchDistrik();
    if(distrik.isNotEmpty) {
      _selectDistrik = distrik[0].nama_distrik;
    }
  }

  @override
  Widget build(BuildContext context) {
    // print(Wilayah().namaKelurahanKampung);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: const Text('Edit Data Ibu',
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
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
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Align(
                      //   alignment: Alignment.bottomCenter,
                      //   child: ClipRRect(
                      //     borderRadius: BorderRadius.circular(80.0), //or 15.0
                      //     child: Container(
                      //       height: 150.0,
                      //       width: 150.0,
                      //       color: Colors.white,
                      //       child: Image.asset('assets/image/logo.png'),
                      //     ),
                      //   ),
                      // ),
                      // const SizedBox(
                      //   height: 10,
                      // ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                      //   child: const Text(
                      //     "Unggah Foto Anda",
                      //     style: TextStyle(
                      //       fontSize: 14,
                      //     ),
                      //   ),
                      // ),
                      const SizedBox(
                        height: 20,
                      ),

                      InputText(nama_control: _nikController, judul: 'NIK', status: true),
                      const SizedBox(
                        height: 15,
                      ),
                      InputText(nama_control: _namaController, judul: 'Nama Lengkap', status: false),
                      const SizedBox(
                        height: 15,
                      ),
                      InputText(nama_control: _alamatController, judul: 'Alamat', status: false),
                      const SizedBox(
                        height: 15,
                      ),
                      InputNumber(nama_control: _hpController, judul: 'No HP', status: false),
                      const SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: _tglLahirController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Tanggal Lahir',
                            label: Text("Tanggal Lahir"),
                            suffixIcon: IconButton(
                                icon: const Icon(Icons.calendar_today),
                                onPressed: () => _selectDate(context)),
                            contentPadding:
                            EdgeInsets.symmetric(horizontal: Constant().margin),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              const BorderSide(color: Colors.white, width: 0.0),
                            )),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Kolom tanggal harus diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField(
                            // value: sekolah,
                            value: _pendidikanController.text.isNotEmpty ? _pendidikanController.text : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Text("Pendidikan : $sekolah"),
                            ),
                            icon: const Icon(Icons.arrow_downward, size: 20,),
                            elevation: 16,
                            hint: Text("Pendidikan terakhir", style: TextStyle(color: Colors.black38),),
                            style: const TextStyle(color: Colors.black54),
                            items: Pendidikan().pendidikanDrop.map<DropdownMenuItem<String>>((String val) {
                              return DropdownMenuItem(
                                  value: val,
                                  child: Container(
                                    child: Text(val),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue3) {
                              setState(() {
                                sekolah = newValue3;
                              });
                            },
                          ),
                        ),
                      ),


                      // Container(
                      //   padding: const EdgeInsets.symmetric(horizontal: 20),
                      //   decoration: const BoxDecoration(
                      //     borderRadius: BorderRadius.all(Radius.circular(40)),
                      //     color: Colors.white,
                      //   ),
                      //   width: MediaQuery.of(context).size.width,
                      //   child: DropdownButton<String>(
                      //     dropdownColor: Colors.white,
                      //     underline: Container(),
                      //     isExpanded: true,
                      //     value: sekolah,
                      //     hint: const Text("Pilih Pendidikan"),
                      //     style: const TextStyle(color: Colors.black),
                      //     onChanged: (String? value) {
                      //       // This is called when the user selects an item.
                      //       setState(() {
                      //         sekolah = value!;
                      //       });
                      //     },
                      //     items: Constant()
                      //         .pendidikan
                      //         .map<DropdownMenuItem<String>>((String value) {
                      //       return DropdownMenuItem<String>(
                      //         value: value,
                      //         child: Text(value),
                      //       );
                      //     }).toList(),
                      //   ),
                      // ),

                      const SizedBox(height: 15,),
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField(
                            // value: distrik,
                            value: _namaDistrikController.text.isNotEmpty ? _namaDistrikController.text : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Text("Distrik : $distrik"),
                            ),
                            icon: const Icon(Icons.arrow_downward, size: 20,),
                            elevation: 16,
                            hint: Text("Distrik/Kecamatan ", style: TextStyle(color: Colors.black38),),
                            style: const TextStyle(color: Colors.black54),
                            items: Wilayah().namaDistrik.map((String val) {
                              return DropdownMenuItem(
                                  value: val,
                                  child: Container(
                                    child: Text(val),
                                  ));
                            }).toList(),
                            onChanged: (newValue2) {
                              setState(() {
                                distrik = newValue2.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField(
                            // value: kampung,
                            value: _namaKampungController.text.isNotEmpty ? _namaKampungController.text : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Text("Kel/kampung : $kampung"),
                            ),
                            icon: const Icon(Icons.arrow_downward, size: 20,),
                            elevation: 16,
                            hint: Text("Kelurahan / Kampung ", style: TextStyle(color: Colors.black38),),
                            style: const TextStyle(color: Colors.black54),
                            items: Wilayah().namaKelurahanKampung.map((String val) {
                              return DropdownMenuItem(
                                  value: val,
                                  child: Container(
                                    child: Text(val),
                                  ));
                            }).toList(),
                            onChanged: (newValue1) {
                              setState(() {
                                kampung = newValue1.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      // InputText(nama_control: _kecamatanController, judul: 'Distrik / Kecamatan', status: false),
                      // InputText(nama_control: _pendidikanController, judul: "Pendidikan", status: false),

                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField(
                            value: _pekerjaanController.text.isNotEmpty ? _pekerjaanController.text : null,
                            // value: pekerjaan?.isNotEmpty ? pekerjaan : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Text("Pekerjaan : $pekerjaan"),
                            ),
                            icon: const Icon(Icons.arrow_downward, size: 20,),
                            elevation: 16,
                            hint: Text("Pekerjaan : ", style: TextStyle(color: Colors.black38),),
                            style: const TextStyle(color: Colors.black54),
                            items: statusPekerjaan.map((String val) {
                              return DropdownMenuItem(
                                  value: val,
                                  child: Container(
                                    child: Text(val),
                                  ));
                            }).toList(),
                            onChanged: (newValue1) {
                              setState(() {
                                pekerjaan = newValue1.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),

                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField(
                            // value: sekolah,
                            value: _statusController.text.isNotEmpty ? _statusController.text : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Text("Status Pernikahan : $statusNikah"),
                            ),
                            icon: const Icon(Icons.arrow_downward, size: 20,),
                            elevation: 16,
                            style: const TextStyle(color: Colors.black54),
                            hint: Text("Status Pernikahan", style: TextStyle(color: Colors.black38),),
                            items: statusMenikah.map((String val) {
                              return DropdownMenuItem(
                                  value: val,
                                  child: Container(
                                    child: Text(val),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue3) {
                              setState(() {
                                statusNikah = newValue3;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // InputText(nama_control: _statusController, judul: "Status Nikah (Ya/Tidak/Janda/Duda)", status: false),
                      // TextButton(
                      //   style: ButtonStyle(
                      //     foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                      //   ),
                      //   onPressed: () {
                      //     _statusNikahDialog(context);
                      //   },
                      //   child: Text('>> Ubah status pernikahan'),
                      // ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     _displayDialog(context);
                      //   },
                      //   child: Text("Ubah status pernikahan"),
                      // ),

                      // const SizedBox(height: 15,),
                      InputNumber(nama_control: _beratBadanController, judul: "Berat Badan (kg)", status: false),
                      const SizedBox(
                        height: 15,
                      ),
                      InputNumber(nama_control: _tinggiBadanController, judul: "Tinggi Badan (cm)", status: false),
                      const SizedBox(
                        height: 15,
                      ),

                      Container(
                        height: 60,
                        color: Colors.white,
                        child: Center(
                          child: DropdownButtonFormField(
                            // value: sekolah,
                            value: _statusKkController.text.isNotEmpty ? _statusKkController.text : null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
                              label: Text("Memiliki Kartu Keluarga? $statusPunyaKK"),
                            ),
                            icon: const Icon(Icons.arrow_downward, size: 20,),
                            elevation: 16,
                            hint: Text("Memiliki Kartu Keluarga?", style: TextStyle(color: Colors.black38),),
                            style: const TextStyle(color: Colors.black54),
                            items: statusKK.map((String val) {
                              return DropdownMenuItem(
                                  value: val,
                                  child: Container(
                                    child: Text(val),
                                  ));
                            }).toList(),
                            onChanged: (String? newValue3) {
                              setState(() {
                                statusPunyaKK = newValue3;
                              });
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      // InputText(nama_control: _kode_posyandu, judul: 'Kode Posyandu', status: true),
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
              onPressed: () {
                var statusKk = '';
                if (dropdownValue == "Punya") {
                  statusKk = "Ya";
                }
                IbuPostMode.editIbu(
                    _nikController.text,
                    _namaController.text,
                    _alamatController.text,
                    _hpController.text,
                    _tglLahirController.text,
                    // _kelurahanController.text,
                    kampung!,
                    distrik!,
                    sekolah!,
                    // _kecamatanController.text,
                    // _pendidikanController.text,
                    // _pekerjaanController.text,
                    pekerjaan!,
                    statusNikah!,
                    // _statusController.text,
                    _beratBadanController.text,
                    _tinggiBadanController.text,
                    // _statusKkController.text,
                    statusPunyaKK!,
                    _kode_posyandu.text
                    )
                    .then((value) => {
                  if (value)
                    {_showMyDialog("Data Berhasil di Edit", true)}
                  else
                    {_showMyDialog("Update gagal, periksa kembali isian data!", false)}
                });
              },
            ),
          )),
    );
  }

  void _fetchIbu() async {
    final prefs = await SharedPreferences.getInstance();
    final nik = prefs.getString('nik');
    print(nik);
    final response = await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbu/"+nik!));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      var i = 0;
      print(jsonResponse);

      sekolah = jsonResponse[i]['pendidikan'];
      distrik = jsonResponse[i]['nama_distrik'];
      kampung = jsonResponse[i]['nama_kelurahan'];
      pekerjaan = jsonResponse[i]['pekerjaan'];
      statusNikah = jsonResponse[i]['status_nikah'];
      statusPunyaKK = jsonResponse[i]['memiliki_kk'];

      _nikController.text = jsonResponse[i]['nik'];
      _namaController.text = jsonResponse[i]['nama_lengkap'];
      _tglLahirController.text = jsonResponse[i]['tgl_lahir'];
      _alamatController.text = jsonResponse[i]['alamat'];
      _hpController.text = jsonResponse[i]['no_hp'];
      _kelurahanController.text = jsonResponse[i]['kode_kelurahan'];
      _kecamatanController.text = jsonResponse[i]['kode_distrik'];
      _beratBadanController.text = jsonResponse[i]['berat_badan'];
      _tinggiBadanController.text = jsonResponse[i]['tinggi_badan'];
      _pendidikanController.text = jsonResponse[i]['pendidikan'];
      _pekerjaanController.text = jsonResponse[i]['pekerjaan'];
      _statusController.text = jsonResponse[i]['status_nikah'];
      _statusKkController.text = jsonResponse[i]['memiliki_kk'];
      _kode_posyandu.text = jsonResponse[i]['nama_posyandu'];
      _namaKampungController.text = jsonResponse[i]['nama_kelurahan'];
      _namaDistrikController.text = jsonResponse[i]['nama_distrik'];

      print('sekolah ${sekolah}');
      print('distrik ${distrik}');
      print('kampung ${kampung}');

      setState(() {});
    } else {
      CircularProgressIndicator();
      throw Exception('Failed to load jobs from API');
    }

  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1970, 8),
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
          elevation: 10,
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
                if (hasil == false) {
                  Navigator.pop(context);
                } else {
                  Navigator.pushNamed(context, '/homeOrangtua');
                }
              },
            ),
          ],
        );
      },
    );
  }

  var _selected ="";
  _statusNikahDialog(BuildContext context) async {
    _selected = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: SimpleDialog(
            title: Text('Pilih status pernikahan!'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  _statusController.text = "Menikah";
                  Navigator.pop(context,"Menikah");
                },
                child: Text("- Menikah"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _statusController.text = "Tidak Menikah";
                  Navigator.pop(context,"Tidak Menikah");
                },
                child: Text("- Tidak Menikah"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _statusController.text = "Cerai";
                  Navigator.pop(context,"Cerai");
                },
                child: Text("- Cerai"),
              )
            ],
            elevation: 10,
            //backgroundColor: Colors.green,
          ),
        );
      },
    );

    if(_selected != null)
    {
      setState(() {
        _selected = _selected;
      });
    }
  }

  var _selectedKK ="";
  _statusKKDialog(BuildContext context) async {
    _selected = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: SimpleDialog(
            title: Text('Memiliki kartu keluarga?'),
            children: [
              SimpleDialogOption(
                onPressed: () {
                  _statusKkController.text = "Ya";
                  Navigator.pop(context,"Ya");
                },
                child: Text("- Ya"),
              ),
              SimpleDialogOption(
                onPressed: () {
                  _statusKkController.text = "Tidak";
                  Navigator.pop(context,"Tidak");
                },
                child: Text("- Tidak"),
              )
            ],
            elevation: 10,
            //backgroundColor: Colors.green,
          ),
        );
      },
    );

    if(_selected != null)
    {
      setState(() {
        _selected = _selected;
      });
    }
  }

  Widget StatusPernikahan() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Status pernikahan:'),
          Divider(),
          RadioListTile(
              title: Text("Menikah"),
              value: "Menikah",
              groupValue: status_nikah,
              onChanged: (value) {
                setState(() {
                  status_nikah = value.toString();
                });
              }
          ),
          RadioListTile(
              title: Text("Tidak Menikah"),
              value: "Tidak Menikah",
              groupValue: status_nikah,
              onChanged: (value) {
                setState(() {
                  status_nikah = value.toString();
                });
              }
          ),
          RadioListTile(
              title: Text("Duda"),
              value: "Duda",
              groupValue: status_nikah,
              onChanged: (value) {
                setState(() {
                  status_nikah = value.toString();
                });
              }
          ),
          RadioListTile(
              title: Text("Janda"),
              value: "Janda",
              groupValue: status_nikah,
              onChanged: (value) {
                setState(() {
                  status_nikah = value.toString();
                });
              }
          ),

        ],
      ),
    );
  }

}
