import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:date_time_picker/date_time_picker.dart';


const List<String> jns_kelamin = <String>['Laki-laki', 'Perempuan'];
const List<String> jns_prematur = <String>['Ya', 'Tidak'];

class AddAnakPage extends StatefulWidget {
  const AddAnakPage({super.key});

  @override
  State<AddAnakPage> createState() => _AddAnakPageState();
}

class _AddAnakPageState extends State<AddAnakPage> {
  final _formKey = GlobalKey<FormState>();
  // String dropdownValue = jns_kelamin.first;
  String? jenis_kelamin;
  String? prematur;

  String _valueChanged1 = '';
  String _valueToValidate1 = '';
  String _valueSaved1 = '';

  TextEditingController _namaController = TextEditingController();
  TextEditingController _tgl_lahirController = TextEditingController();
  TextEditingController _jenis_kelaminController = TextEditingController();
  TextEditingController _prematurController = TextEditingController();
  TextEditingController _bb_lahirController = TextEditingController();
  TextEditingController _tb_lahirController = TextEditingController();
  TextEditingController _lingkarkepala_lahirController = TextEditingController();
  TextEditingController _gol_darahController = TextEditingController();
  TextEditingController _alergiController = TextEditingController();
  TextEditingController _tb_ibuController = TextEditingController();
  TextEditingController _bb_ibuController = TextEditingController();

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
          return 'Please enter some text';
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
          'Tambah Data Anak',
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
                         _inputText(_namaController, 'Nama Lengkap'),
                         const SizedBox(
                           height: 10,
                         ),
                         // _inputText(_tgl_lahirController, 'Tanggal Lahir'),
                         DateTimePicker(
                           // type: DateTimePickerType.dateTimeSeparate,
                           type: DateTimePickerType.date,
                           dateMask: 'd MMM, yyyy',
                           controller: _tgl_lahirController,
                           //initialValue: _initialValue,
                           firstDate: DateTime(2000),
                           lastDate: DateTime(2100),
                           icon: Icon(Icons.event),
                           dateLabelText: 'Tanggal lahir',
                           // timeLabelText: "Hour",
                           //use24HourFormat: false,
                           //locale: Locale('pt', 'BR'),
                           selectableDayPredicate: (date) {
                             if (date.weekday == 6 || date.weekday == 7) {
                               return false;
                             }
                             return true;
                           },
                           onChanged: (val) => setState(() => _valueChanged1 = val),
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
                         Text('Lahir prematur?', style: TextStyle(color: Colors.black38),),
                         _prematurDropdown(),
                         // _inputText(_prematurController, 'Apakah anak lahir prematur?'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_bb_lahirController, 'Berat badan saat lahir (kg)'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_tb_lahirController, 'Tinggi badan saat lahir (cm)'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_lingkarkepala_lahirController, 'Lingkar kepala saat lahir (cm)'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_gol_darahController, 'Golongan Darah'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_alergiController, 'Alergi yang diderita'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_tb_ibuController, 'Tinggi badan ibu (cm)'),
                         const SizedBox(
                           height: 10,
                         ),
                         _inputText(_bb_ibuController, 'Berat badan ibu (cm)'),
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
                                   Navigator.pushNamed(context, '/homeOrangtua');
                                 },
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