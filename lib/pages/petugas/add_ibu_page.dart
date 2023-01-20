import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/petugas/ibu_post_model.dart';
import 'package:stunting_app/shared/constant.dart';

class AddIbuPage extends StatefulWidget {
  const AddIbuPage({super.key});

  @override
  State<AddIbuPage> createState() => _AddIbuPageState();
}

class _AddIbuPageState extends State<AddIbuPage> {
  final _formKey = GlobalKey<FormState>();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List<String> listNikah = <String>['Ya', 'Tidak'];
  List<String> listKK = <String>['Ya', 'Tidak'];
  List<String> list = <String>['Punya', 'Tidak'];
  List<String> statusMenikah = <String>['Menikah','Tidak Menikah','Cerai'];
  List<String> statusKK = <String>['Ya','Tidak'];
  List<String> statusPekerjaan = <String>["IRT","Petani/Buruh","PNS","Swasta","Wirtaswasta"];

  String? pendidikanDrop;
  String? pekerjaanDrop;
  String? statusNikahDrop;
  String? kkDrop;
  String? kecamatanDrop;
  String? desaDrop;
  String? sekolah;

  DateTime selectedDate = DateTime.now();
  TextEditingController _nikController = TextEditingController();
  TextEditingController _namaController = TextEditingController();
  TextEditingController _alamatController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _hpController = TextEditingController();
  TextEditingController _tglLahirController = TextEditingController();
  TextEditingController _beratBadanController = TextEditingController();
  TextEditingController _tinggiBadanController = TextEditingController();
  TextEditingController _statusKkController = TextEditingController();
  TextEditingController _kode_posyanduController = TextEditingController();
  TextEditingController _useridController = TextEditingController();
  TextEditingController _passwdController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          //menu icon button at start left of appbar
          onPressed: () {
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/listIbu');
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          'Tambah data Ibu di Posyandu',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        toolbarHeight: 50,
        elevation: 30.0,
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
                        return 'Tidak boleh kosong harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _useridController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'UserID',
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
                        return 'Tidak boleh kosong harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _passwdController,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Password',
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
                        return 'Tidak boleh kosong harus diisi';
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
                        return 'Tidak boleh kosong harus diisi';
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
                        return 'Tidak boleh kosong harus diisi';
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
                        return 'Tidak boleh kosong harus diisi';
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
                        return 'Tidak boleh kosong harus diisi';
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
                        suffixIcon: IconButton(
                            icon: const Icon(Icons.calendar_today),
                            onPressed: () => _selectDate(context)),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tanggal Lahir',
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
                        return 'Tidak boleh kosong harus diisi';
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
                      value: kecamatanDrop,
                      hint: const Text("Pilih Distrik"),
                      style: const TextStyle(color: Colors.black),
                      items: Wilayah().namaDistrik.map((String val) {
                        return DropdownMenuItem(
                            value: val,
                            child: Container(
                              child: Text(val),
                            ));
                      }).toList(),
                      onChanged: (newValue2) {
                        setState(() {
                          kecamatanDrop = newValue2.toString();
                        });
                      },
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
                      value: desaDrop,
                      hint: const Text("Pilih Kelurahan / Desa"),
                      style: const TextStyle(color: Colors.black),
                      items: Wilayah().namaKelurahanKampung.map((String val) {
                        return DropdownMenuItem(
                            value: val,
                            child: Container(
                              child: Text(val),
                            ));
                      }).toList(),
                      onChanged: (newValue1) {
                        setState(() {
                          desaDrop = newValue1.toString();
                        });
                      },
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
                      // onChanged: (String? value) {
                      //   // This is called when the user selects an item.
                      //   setState(() {
                      //     pendidikanDrop = value!;
                      //   });
                      // },
                      items: Pendidikan().pendidikanDrop.map<DropdownMenuItem<String>>((String val) {
                        return DropdownMenuItem(
                            value: val,
                            child: Container(
                              child: Text(val),
                            ));
                      }).toList(),
                      onChanged: (String? newValue3) {
                        setState(() {
                          pendidikanDrop = newValue3;
                        });
                      },
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
                      items: statusMenikah.map((String val) {
                        return DropdownMenuItem(
                            value: val,
                            child: Container(
                              child: Text(val),
                            ));
                      }).toList(),
                      onChanged: (String? newValue3) {
                        setState(() {
                          statusNikahDrop = newValue3;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _beratBadanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Berat Badan',
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
                        return 'Tidak boleh kosong harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _tinggiBadanController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Tinggi Badan',
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
                        return 'Tidak boleh kosong harus diisi';
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
            final SharedPreferences prefs = await _prefs;
            IbuPostMode.addIbu(
                    _nikController.text,
                    _useridController.text,
                    _passwdController.text,
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
                    prefs.getString('kode_posyandu').toString())
                .then((value) => {
                      if (value)
                        {_showMyDialog("Input Data Berhasil.", true)}
                      else
                        {_showMyDialog("Input Data Gagal!", false)}
                    });
          },
        ),
      )),
    );
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

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1930, 8),

        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        var dates = selectedDate.toString().split(' ');
        _tglLahirController.text = dates[0];
      });
    }
  }
}
