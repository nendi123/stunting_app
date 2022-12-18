import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/model/anak.dart';

const List<String> jns_kelamin = <String>['Laki-laki', 'Perempuan'];
const List<String> jns_prematur = <String>['Ya', 'Tidak'];

class EditAnakPage extends StatefulWidget {
  String nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir,
      persalinan_oleh, bb_lahir, panjang_lahir, prematur, alergi, gol_darah, lingkar_kepala,tb_lahir ;
  int usia_kehamilan, id_anak;

  EditAnakPage({Key ? key, required this.id_anak, required this.nik_ibu, required this.nama_lengkap, required this.jenis_kelamin,
    required this.tgl_lahir,  required this.akte_lahir, required this.persalinan_oleh, required this.bb_lahir, required this.panjang_lahir,
    required this.prematur, required this.usia_kehamilan, required this.alergi, required this.gol_darah, required this.lingkar_kepala, required this.tb_lahir });

  // const EditAnakPage({super.key});
  @override
  State<EditAnakPage> createState() => _EditAnakPageState();
}

class _EditAnakPageState extends State<EditAnakPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // String dropdownValue = jns_kelamin.first;
  String? jenis_kelamin;
  String? prematur;

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';

  Widget _inputText(TextEditingController nama_control, String judul) {
    return new TextFormField(
      controller: nama_control,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: judul,
          label: Text('$judul'),
          // labelText: datavalue,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Constant().margin),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.white, width: 0.0),
          )
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _inputNumeric(TextEditingController nama_control, String judul) {
    return new TextFormField(
      controller: nama_control,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: judul,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Constant().margin),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.white, width: 0.0),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harus diisi!';
        }
        return null;
      },
      keyboardType: TextInputType.number,
    );
  }

  Widget _jenisKelaminDropdown() {
    return DropdownButton<String>(
      value: jenis_kelamin,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      hint: Text("Pilih jenis kelamin disini!     ", style: TextStyle(color: Colors.black38),),
      style: const TextStyle(color: Colors.black54),
      underline: Container(
        height: 1,
        color: Colors.black38,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          jenis_kelamin = value!;
        });
      },
      items: jns_kelamin.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  // Widget _jenisKelaminDropdown() {
  //   return DropdownButton<String>(
  //     value: widget.jenis_kelamin,
  //     icon: const Icon(Icons.arrow_downward),
  //     elevation: 16,
  //     hint: Text("Pilih jenis kelamin disini!     ", style: TextStyle(color: Colors.black38),),
  //     style: const TextStyle(color: Colors.black54),
  //     underline: Container(
  //       height: 1,
  //       color: Colors.black38,
  //     ),
  //     onChanged: (String? value) {
  //       jenis_kelamin = value;
  //       // This is called when the user selects an item.
  //       // setState(() {
  //       //   jenis_kelamin = value!;
  //       // });
  //     },
  //     items: jns_kelamin.map<DropdownMenuItem<String>>((String value) {
  //       return DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       );
  //     }).toList(),
  //   );
  // }

  void get_jeniskelamin() {
    setState(() {
      jenis_kelamin = widget.jenis_kelamin;
    });
  }

  Widget _prematurDropdown() {
    return DropdownButton<String>(
      value: prematur,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      hint: Text("Apakah anak lahir prematur? ", style: TextStyle(color: Colors.black38),),
      style: const TextStyle(color: Colors.black54),
      underline: Container(
        height: 1,
        color: Colors.black38,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          prematur = value!;
        });
      },
      items: jns_prematur.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  TextEditingController id_anak = TextEditingController();
  TextEditingController nik_ibu = TextEditingController();
  TextEditingController _jeniskelamin = TextEditingController();
  TextEditingController _prematur = TextEditingController();
  TextEditingController nama_lengkap = TextEditingController();
  TextEditingController tgl_lahir = TextEditingController();
  TextEditingController akte_lahir = TextEditingController();
  TextEditingController tb_lahir = TextEditingController();
  TextEditingController bb_lahir = TextEditingController();
  TextEditingController panjang_lahir = TextEditingController();
  TextEditingController lingkar_kepala = TextEditingController();
  TextEditingController usia_kehamilan = TextEditingController();
  TextEditingController alergi = TextEditingController();
  TextEditingController gol_darah = TextEditingController();
  TextEditingController persalinan_oleh = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TextEditingController id_anak = TextEditingController(text: widget.id_anak);
    // TextEditingController nik_ibu = TextEditingController(text: widget.nik_ibu);
    // TextEditingController nama_lengkap = TextEditingController(text: widget.nama_lengkap);
    // TextEditingController tgl_lahir = TextEditingController(text: widget.tgl_lahir);
    // TextEditingController akte_lahir = TextEditingController(text: widget.akte_lahir);
    // TextEditingController tb_lahir = TextEditingController(text: widget.tb_lahir);
    // TextEditingController bb_lahir = TextEditingController(text: widget.bb_lahir);
    // TextEditingController panjang_lahir = TextEditingController(text: widget.panjang_lahir);
    // TextEditingController lingkar_kepala = TextEditingController(text: widget.lingkar_kepala);
    // TextEditingController usia_kehamilan = TextEditingController(text: widget.usia_kehamilan.toString());
    // TextEditingController alergi = TextEditingController(text: widget.alergi);
    // TextEditingController gol_darah = TextEditingController(text: widget.gol_darah);
    // TextEditingController persalinan_oleh = TextEditingController(text: widget.persalinan_oleh);

    final ColorScheme colors = Theme.of(context).colorScheme;
    // id_anak, nik_ibu, jenis_kelamin, tgl_lahir, akte_lahir, persalinan_oleh, bb_lahir, panjang_lahir, prematur, alergi,
    // gol_darah, lingkar_kepala,tb_lahir, usia_kehamilan
    id_anak.text = widget.id_anak.toString();
    nik_ibu.text = widget.nik_ibu;
    nama_lengkap.text = widget.nama_lengkap;
    tgl_lahir.text = widget.tgl_lahir;
    akte_lahir.text = widget.akte_lahir;
    tb_lahir.text = widget.tb_lahir;
    bb_lahir.text = widget.bb_lahir;
    panjang_lahir.text = widget.panjang_lahir;
    lingkar_kepala.text = widget.lingkar_kepala;
    usia_kehamilan.text = widget.usia_kehamilan.toString();
    alergi.text = widget.alergi;
    gol_darah.text = widget.gol_darah;
    persalinan_oleh.text = widget.persalinan_oleh;

    // String _id_anak = widget.id_anak;
    // String _nik_ibu = widget.nik_ibu;
    // String _jenis_kelamin = widget.jenis_kelamin;
    // String _nama_lengkap = widget.nama_lengkap;
    // String _tgl_lahir = widget.tgl_lahir;
    // String _akte_lahir = widget.akte_lahir;
    // String _persalinan_oleh = widget.persalinan_oleh;
    // String _bb_lahir = widget.bb_lahir;
    // String _panjang_lahir = widget.panjang_lahir;
    String _prematur = widget.prematur;
    // String _alergi = widget.alergi;
    // String _gol_darah = widget.gol_darah;
    // String _lingkar_kepala = widget.lingkar_kepala;
    // int _usia_kehamilan = widget.usia_kehamilan;
    // String _tb_lahir = widget.tb_lahir;
    print(_prematur);
    print(widget.tgl_lahir);

    return Scaffold(
      appBar: AppBar(
        // title: Text('Profile Petugas'),
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            // Navigator.pushNamed(context, '/profileAnak');
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
          'Update Data : '+widget.nama_lengkap,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(
                      left: Constant().margin,
                      right: Constant().margin,
                      top: 30,
                      bottom: 10),
                  // child: const Text(
                  //   "Tambah Data Anak",
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  // ),
                ),
                const SizedBox(
                  height: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0), //or 15.0
                        child: Container(
                          height: 120.0,
                          width: 120.0,
                          color: Colors.transparent,
                          child: Image.asset('assets/image/foto_anak.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),

                const SizedBox(
                  height: 10,
                ),
                Form(
                    key: _formKey,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                      child: Column(
                          children: <Widget> [
                            // textInput(_namaController,  'Nama lengkap'),
                            _inputText(nama_lengkap, 'Nama Lengkap'),
                            const SizedBox(
                              height: 10,
                            ),
                            // _inputText(_tgl_lahirController, 'Tanggal Lahir'),
                            TextFormField(
                              controller: tgl_lahir,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Tanggal Lahir',
                                  label: Text("Tanggal Lahir"),
                                  prefixIcon: IconButton(
                                      icon: const Icon(Icons.date_range),
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
                              height: 10,
                            ),

                            Text('Jenis kelamin', style: TextStyle(color: Colors.black38),),
                            _jenisKelaminDropdown(),
                            const SizedBox(
                              height: 10,
                            ),
                            Text('Lahir prematur?', style: TextStyle(color: Colors.black38),),
                            _prematurDropdown(),
                            // _inputText(_prematurController, 'Apakah anak lahir prematur?'),
                            const SizedBox(
                              height: 10,
                            ),

                            _inputNumeric(bb_lahir, 'Berat badan saat lahir (kg)'),

                            const SizedBox(
                              height: 10,
                            ),

                            _inputNumeric(tb_lahir, 'Tinggi badan saat lahir (cm)'),
                            const SizedBox(
                              height: 10,
                            ),

                            _inputNumeric(lingkar_kepala, 'Lingkar kepala saat lahir (cm)'),
                            const SizedBox(
                              height: 10,
                            ),

                            _inputText(gol_darah, 'Golongan Darah'),
                            const SizedBox(
                              height: 10,
                            ),

                            _inputText(alergi, 'Alergi yang diderita'),
                            const SizedBox(
                              height: 10,
                            ),

                            _inputNumeric(usia_kehamilan, 'Usia kehamilan (minggu)'),
                            const SizedBox(
                              height: 10,
                            ),
                            // _inputText(_bb_ibuController, 'Berat badan ibu (cm)', _bb_ibu),
                            const SizedBox(
                              height: 20,
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 58,
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
                                      _formKey.currentState?.save();
                                      if(_formKey.currentState!.validate()) {
                                        editAnak(Anak(id_anak: id_anak.text,
                                            nik_ibu: nik_ibu.text,
                                            nama_lengkap: nama_lengkap.text,
                                            jenis_kelamin: jenis_kelamin
                                                .toString(),
                                            tgl_lahir: tgl_lahir.text,
                                            akte_lahir: akte_lahir.text,
                                            persalinan_oleh: persalinan_oleh
                                                .text,
                                            bb_lahir: bb_lahir.text,
                                            panjang_lahir: panjang_lahir.text,
                                            prematur: _prematur,
                                            usia_kehamilan: usia_kehamilan.text,
                                            alergi: alergi.text,
                                            gol_darah: gol_darah.text,
                                            tb_lahir: tb_lahir.text,
                                            lingkar_kepala: lingkar_kepala
                                                .text ?? ""));
                                        Navigator.pushNamed(
                                            context, '/homeOrangtua');
                                        setState(() {});
                                      };
                                    },

                                    // onPressed: ()  async => (_formKey.currentState!.validate())
                                    //   ?   editAnak(Anak(id_anak: id_anak.text, nik_ibu: nik_ibu.text,
                                    //       nama_lengkap: nama_lengkap.text, jenis_kelamin: jenis_kelamin.toString() , tgl_lahir: tgl_lahir.text,
                                    //       akte_lahir: akte_lahir.text, persalinan_oleh: persalinan_oleh.text, bb_lahir: bb_lahir.text,
                                    //       panjang_lahir: panjang_lahir.text, prematur: _prematur, usia_kehamilan: usia_kehamilan.text,
                                    //       alergi: alergi.text, gol_darah: gol_darah.text, tb_lahir: tb_lahir.text, lingkar_kepala: lingkar_kepala.text ?? ""))
                                    //   : null,

                                      // Navigator.pop(context, "${response.body.toString()}")

                                    // async => (_formKey.currentState!.validate())
                                    //     ? prosesEditAnak()
                                    //     : null,

                                  ),
                                )),
                            const SizedBox(
                              height: 300,
                            ),
                          ]
                      ),
                    )
                )
              ],
            )
        ),
      ),
    );
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
        tgl_lahir.text = dates[0];
      });
    }
  }

  String? name="";

  retrieve() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("nik");
    setState(() {
    });
  }

  // void prosesEditAnak() async {
  //   //_nikController _namaController  _useridController  _passwordController  _rePasswordController
  //   // final response = await addAnak(Anak(userid: _useridController.text, password: _passwordController.text, nama_lengkap: _namaController.text, nik: _nikController.text, category: '2' ?? ""));
  //   // print(tgl_lahir.text);
  //   // DateTime tgl = DateTime.parse(tgl_lahir.text);
  //   // String tgl_lahir_formatted = DateFormat('yyyy-M-dd').format(tgl);
  //   // print(tgl_lahir_formatted);
  //   String _prematur;
  //   if(prematur == 'Tidak') {
  //     _prematur = 'false';
  //   } else {
  //     _prematur = 'true';
  //   }
  //
  //   final response = await editAnak(Anak(id_anak: id_anak.text, nik_ibu: nik_ibu.text,
  //       nama_lengkap: nama_lengkap.text, jenis_kelamin: jenis_kelamin.toString() , tgl_lahir: tgl_lahir.text,
  //       akte_lahir: akte_lahir.text, persalinan_oleh: persalinan_oleh.text, bb_lahir: bb_lahir.text,
  //       panjang_lahir: panjang_lahir.text, prematur: _prematur, usia_kehamilan: usia_kehamilan.text,
  //       alergi: alergi.text, gol_darah: gol_darah.text, tb_lahir: tb_lahir.text, lingkar_kepala: lingkar_kepala.text ?? ""));
  //
  //   if(response != null) {
  //     print(response.body.toString());
  //     if(response.statusCode == 200) {
  //       var jsonResp = jsonDecode(response.body);
  //       Navigator.pop(context, jsonResp['message']);
  //     } else {
  //       // dialog(context, "${response.body.toString()}");
  //       // Navigator.pop(context, "${response.body.toString()}");
  //       print(response.statusCode);
  //       print(response.reasonPhrase);
  //     }
  //   }
  // }
}
