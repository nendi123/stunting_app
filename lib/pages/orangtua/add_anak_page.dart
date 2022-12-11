import 'package:flutter/material.dart';
import 'package:stunting_app/model/anak.dart';
import 'package:stunting_app/shared/constant.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';


const List<String> jns_kelamin = <String>['Laki-laki', 'Perempuan'];
const List<String> jns_prematur = <String>['Ya', 'Tidak'];

class AddAnakPage extends StatefulWidget {
  const AddAnakPage({super.key});

  @override
  State<AddAnakPage> createState() => _AddAnakPageState();
}

class _AddAnakPageState extends State<AddAnakPage> {
  final prefs = SharedPreferences.getInstance();
  var _val;
  var _nik='';

  @override
  void initState() {
    // _future =getValue();
    super.initState();
    getData().then((value) =>
      _nik = value);
  }

  late var _future;

  Future<String> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final nik = prefs.getString('nik');
    final response = nik!;
    print(response);
    return response.toString();
  }

  late Future<String> response;

  Future<void> getValue() async {
    await getData().then((value) {
      setVal(value);
    });
  }

  setVal(String val) {
    _val = val;
    print(_val);
  }

  getValData() {
    print('val : '+_val.toString());
    return  _val;
  }

  test() async {
    var res = await _val;
    await res;
  }

  // late String? token;
  final _formKey = GlobalKey<FormState>();

  // String dropdownValue = jns_kelamin.first;
  String? jenis_kelamin;
  String? prematur;

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';

  //id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir, persalinan_oleh,
  //bb_lahir, panjang_lahir, prematur, usia_kehamilan
  //tb_lahir, lingkar_kepala, gol_darah, alergi
  TextEditingController id_anak = TextEditingController();
  // TextEditingController nik_ibu = TextEditingController();
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
  // TextEditingController _tb_ibuController = TextEditingController();
  // TextEditingController _bb_ibuController = TextEditingController();

  Widget _inputText(TextEditingController nama_control, String judul) {
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


  @override
  Widget build(BuildContext context) {
    // String rest1 = test();
    // _future = getValData();
    setState(() {
      print('nik : '+_nik);
    });

    return Scaffold(
      appBar: AppBar(
        // title: Text('Profile Petugas'),
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/homeOrangtua');
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
          'Tambah Data Anak '+_nik,
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
                       child: Image.asset('assets/image/logo.png'),
                     ),
                   ),
                 ),
                 Container(
                   alignment: Alignment.center,
                   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                   child: const Text(
                     "Unggah Foto",
                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                   ),
                 ),
               ],
             ),
             const SizedBox(
               height: 20,
             ),
             Form(
                 key: _formKey,
                 child: Container(
                   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                   child: Column(
                       children: <Widget> [
                         // textInput(_namaController,  'Nama lengkap'),
                         _inputText(id_anak, 'ID Anak'),
                         const SizedBox(
                           height: 10,
                         ),
                         // _inputText(nik_ibu, 'NIK Ibu'),
                         // const SizedBox(
                         //   height: 10,
                         // ),
                         _inputText(nama_lengkap, 'Nama Lengkap'),
                         const SizedBox(
                           height: 10,
                         ),
                         // _inputText(_tgl_lahirController, 'Tanggal Lahir'),
                         DateTimePicker(
                           // type: DateTimePickerType.dateTimeSeparate,
                           type: DateTimePickerType.date,
                           // dateMask: 'd MMM, yyyy',
                           dateMask: 'yyyy-M-d',
                           controller: tgl_lahir,
                           //initialValue: _initialValue,
                           firstDate: DateTime(2000),
                           lastDate: DateTime(2100),
                           icon: Icon(Icons.event),
                           dateLabelText: 'Tanggal lahir',
                           // timeLabelText: "Hour",
                           //use24HourFormat: false,
                           //locale: Locale('pt', 'BR'),
                           // selectableDayPredicate: (date) {
                           //   if (date.weekday == 7 || date.weekday == 7) {
                           //     return false;
                           //   }
                           //   return true;
                           // },
                           onChanged: (val) => setState(() => _valueChanged1 = val),
                           // onChanged: (val) {
                           //   print(val.toString());
                           //   setState(() {
                           //     tgl_lahir.text = val.toString();
                           //     print(tgl_lahir.value);
                           //   });
                           // },
                           validator: (val) {
                             setState(() => _valueToValidate1 = val ?? '');
                             return null;
                           },
                           onSaved: (val) => setState(() => _valueSaved1 = val ?? ''),
                         ),

                         const SizedBox(
                           height: 10,
                         ),
                         // _inputText(_jenis_kelaminController, 'Jenis Kelamin'),
                          Text('Jenis kelamin', style: TextStyle(color: Colors.black38),),
                         _jenisKelaminDropdown(),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(akte_lahir, 'Akte Lahir'),
                         const SizedBox(
                           height: 10,
                         ),
                         Text('Lahir prematur?', style: TextStyle(color: Colors.black38),),
                         _prematurDropdown(),
                         // _inputText(_prematurController, 'Apakah anak lahir prematur?'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(persalinan_oleh, 'Persalinan ditolong oleh siapa?'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(bb_lahir, 'Berat badan saat lahir (kg)'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(tb_lahir, 'Tinggi badan saat lahir (cm)'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(lingkar_kepala, 'Lingkar kepala saat lahir (cm)'),
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
                         _inputText(usia_kehamilan, 'Usia kehamilan sebelum lahir (minggu)'),
                         const SizedBox(
                           height: 10,
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
                                 onPressed: ()
                                   async => (_formKey.currentState!.validate())
                                       ? prosesAddAnak(_nik)
                                       : null,

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

  String? name="";

  retrieve() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("nik");
    setState(() {
    });
  }

  void prosesAddAnak(String nikIbu) async {
    //_nikController _namaController  _useridController  _passwordController  _rePasswordController
    // final response = await addAnak(Anak(userid: _useridController.text, password: _passwordController.text, nama_lengkap: _namaController.text, nik: _nikController.text, category: '2' ?? ""));
    DateTime tgl = DateTime.parse(tgl_lahir.text);
    String tgl_lahir_formatted = DateFormat('yyyy-M-dd').format(tgl);
    print(tgl_lahir_formatted);
    String _prematur;
    if(prematur == 'Tidak') {
      _prematur = 'false';
    } else {
      _prematur = 'true';
    }

    final response = await addAnak(Anak(id_anak: id_anak.text, nik_ibu: nikIbu,
        nama_lengkap: nama_lengkap.text, jenis_kelamin: jenis_kelamin.toString(), tgl_lahir: tgl_lahir_formatted,
        akte_lahir: akte_lahir.text, persalinan_oleh: persalinan_oleh.text, bb_lahir: bb_lahir.text,
        panjang_lahir: panjang_lahir.text, prematur: _prematur, usia_kehamilan: usia_kehamilan.text,
        alergi: alergi.text, gol_darah: gol_darah.text, tb_lahir: tb_lahir.text, lingkar_kepala: lingkar_kepala.text ?? ""));

    if(response != null) {
      print(response.body.toString());
      if(response.statusCode == 200) {
        var jsonResp = jsonDecode(response.body);
        Navigator.pop(context, jsonResp['message']);
      } else {
        // dialog(context, "${response.body.toString()}");
        Navigator.pop(context, "${response.body.toString()}");
      }
    }
  }
}

class JenisKelaminList {
  String name;
  int index;
  JenisKelaminList({required this.name, required this.index});
}

class RadioGroupWidget extends State {

  // Default Radio Button Item
  String radioItem = 'Jenis Kelamin';

  // Group Value for Radio Button.
  int id = 1;

  List<JenisKelaminList> jList = [
    JenisKelaminList(
      index: 1,
      name: "Laki-lakk",
    ),
    JenisKelaminList(
      index: 2,
      name: "Perempuan",
    ),

  ];

  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding : EdgeInsets.all(14.0),
            child: Text('$radioItem', style: TextStyle(fontSize: 23))
        ),

        Expanded(
            child: Container(
              height: 350.0,
              child: Column(
                children:
                jList.map((data) => RadioListTile(
                  title: Text("${data.name}"),
                  groupValue: id,
                  value: data.index,
                  onChanged: (val) {
                    setState(() {
                      radioItem = data.name;
                      id = data.index;
                    });
                  },
                )).toList(),
              ),
            )),

      ],
    );
  }

}