import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';


class MpasiAnakPage extends StatefulWidget {
  const MpasiAnakPage({super.key});

  @override
  State<MpasiAnakPage> createState() => _MpasiAnakPageState();
}

class _MpasiAnakPageState extends State<MpasiAnakPage> {
  final _formKey = GlobalKey<FormState>();
  final List jadwalMpasi = ['06:00','08:00','10:00','12:00','14:00','16:00','18:00','21:00','24:00','03:00'];
  final List mpasi = [
    'ASI','Makan Pagi','Camilan','Makan Siang','ASI','Camilan','Makan Malam','ASI','ASI','ASI',
  ];

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

  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

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
          'Jadwal MPASI Anak',
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
                Container(
                  // margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  height: 70,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    border: Border.all(width: 1, color: Colors.transparent),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),

                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Spacer(),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.timelapse),
                          Text('Jadwal', style: TextStyle(color: Colors.black54),)
                        ],
                      ),
                      Spacer(),
                      Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.restaurant_menu),
                          Text('Menu', style: TextStyle(color: Colors.black54),)
                        ],
                      ),
                      Spacer(),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      border: Border.all(width: 1, color: Colors.transparent),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    padding: EdgeInsets.all(14),
                  child:
                      Row(
                        children: [
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: jadwalMpasi.map((elemen) {
                              int index = jadwalMpasi.indexOf(elemen);
                              print(index);
                              return Text(elemen, style: TextStyle(color: Colors.black54),);
                            }).toList(),
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: mpasi.map((elemen) {
                              int index = mpasi.indexOf(elemen);
                              print(index);
                              return Text(elemen, style: TextStyle(color: Colors.black54),);
                            }).toList(),
                          ),
                          Spacer(),
                        ],
                      )
                ),
              ],
            )
        ),
      ),
    );
  }
}
