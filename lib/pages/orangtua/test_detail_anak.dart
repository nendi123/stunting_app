import 'package:flutter/material.dart';
import 'package:stunting_app/pages/orangtua/kms_anak_page.dart';
import 'package:stunting_app/pages/orangtua/test_edit_anak.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/pages/orangtua/edit_anak_page.dart';
import 'package:stunting_app/model/anak.dart';
import 'package:stunting_app/pages/orangtua/test_edit_anak.dart';

class TestDetailAnak extends StatelessWidget {
  // String nama_lengkap, tgl_lahir, jenis_kelamin;
  // final Anak anak;
  String nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir,
      persalinan_oleh, bb_lahir, panjang_lahir, prematur, alergi, gol_darah, lingkar_kepala,tb_lahir ;

  int usia_kehamilan, id_anak;

  TestDetailAnak({Key ? key, required this.id_anak, required this.nik_ibu, required this.nama_lengkap, required this.jenis_kelamin,
    required this.tgl_lahir,  required this.akte_lahir, required this.persalinan_oleh, required this.bb_lahir, required this.panjang_lahir,
    required this.prematur, required this.usia_kehamilan, required this.alergi, required this.gol_darah, required this.lingkar_kepala, required this.tb_lahir });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/homeOrangtua');
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
          // '${anak.nama_lengkap}',
          // anak.nama_lengkap,
          'Profile $nama_lengkap',
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
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
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
                        height: 100.0,
                        width: 100.0,
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
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  border: Border.all(width: 1, color: Colors.transparent),
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                ),
                
                child: _menuTengah(context),
              ),
              const SizedBox(
                height: 10,
              ),
              // id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir,
              // persalinan_oleh, bb_lahir, panjang_lahir, prematur, alergi, gol_darah, lingkar_kepala,tb_lahir
              _detailAnak(id_anak.toString(), 'ID Anak'),
              _detailAnak(nik_ibu, 'NIK Ibu'),
              _detailAnak(nama_lengkap, 'Nama lengkap'),
              _detailAnak(tgl_lahir, 'Tanggal lahir'),
              _detailAnak(jenis_kelamin, 'Jenis kelamin'),
              _detailAnak(gol_darah, 'Golongan darah'),
              _detailAnak(akte_lahir, 'Akte lahir'),
              _detailAnak(persalinan_oleh, 'Persalinan dibantu oleh siapa?'),
              _detailAnak(bb_lahir, 'Berat Badan Lahir (kg)'),
              _detailAnak(tb_lahir, 'Panjang/Tinggi Badan lahir (cm)'),
              _detailAnak(lingkar_kepala, 'Ukuran lingkar kepala (cm)'),
              _detailAnak(prematur, 'Apakah lahir prematur?'),
              _detailAnak(alergi, 'Alergi yang diderita'),

              // Container(
              //       alignment: Alignment.centerLeft,
              //       margin: EdgeInsets.only(
              //       left: Constant().margin,
              //       right: Constant().margin,
              //       top: 30,
              //       bottom: 10),
              //
              //       child: Row(
              //         // children: [
              //         //   Text('Nama Lengkap : $nama_lengkap'),
              //         //   Text('Tgl Lahir : $tgl_lahir'),
              //         //   Text('Jenis Kelamin : $jenis_kelamin')
              //         // ],
              //         children: [
              //           Column(
              //             children: [
              //               Text('Nama Lengkap : '),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               Text('$nama_lengkap'),
              //             ],
              //           ),
              //         ],
              //         ),
              // ),
              // Text('Nama : $nama_lengkap'),
              // Text('Tgl Lahir : $tgl_lahir'),
              // Text('Jenis Kelamin : $jenis_kelamin'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _detailAnak(String title, String subtile) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.only(left:10.0, top:5.0,right:10.0,bottom:5.0),
      child: Column(
        children: [
          ListTile(
            title: Text(title.toUpperCase()),
            subtitle: Text(subtile),
            trailing: Icon(Icons.favorite_outline),
          ),
        ],
      ),
    );
  }
  
  Widget _menuTengah(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Spacer(),
          Column(
            children: [
              const SizedBox( height: 10, ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/mpasiAnak');
                    },
                    // borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.emoji_food_beverage,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox( height: 5 ),
              Text(' MPASI ', style: TextStyle(fontSize: 10, color: Colors.black54),),
            ],
          ),
          Spacer(),
          Column(
            children: [
              const SizedBox( height: 10, ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1 , color: Colors.white70),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo
                  ),
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, '/kmsAnak');
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context)=>
                          KmsAnakPage(id_anak: this.id_anak)));

                    },
                    // borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.add_chart,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox( height: 5 ),
              Text(' KMS ', style: TextStyle(fontSize: 10, color: Colors.black54),),
            ],
          ),
          Spacer(),
          Column(
            children: [
              const SizedBox( height: 10, ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/posyandu');
                    },
                    // borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.home,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox( height: 5 ),
              Text('Posyandu', style: TextStyle(fontSize: 10, color: Colors.black54),),
            ],
          ),
          Spacer(),
          Column(
            children: [
              const SizedBox( height: 10, ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder:
                          (context)=>
                              // TestEditAnakPage(idAnak: this.id_anak.toString())));
                              EditAnakPage(id_anak: this.id_anak, nik_ibu: this.nik_ibu, nama_lengkap: this.nama_lengkap, jenis_kelamin: this.jenis_kelamin,
                              tgl_lahir: this.tgl_lahir, akte_lahir : this.akte_lahir, persalinan_oleh : this.persalinan_oleh,
                              bb_lahir: this.bb_lahir, panjang_lahir: this.panjang_lahir, prematur: this.prematur, usia_kehamilan: this.usia_kehamilan,
                              alergi: this.alergi, gol_darah: this.gol_darah, lingkar_kepala: this.lingkar_kepala,tb_lahir: this.tb_lahir)));
                    },
                    // borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.edit,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox( height: 5 ),
              Text('Update', style: TextStyle(fontSize: 10, color: Colors.black54),),
            ],
          ),
          Spacer(),
          Column(
            children: [
              const SizedBox( height: 10, ),
              Material(
                type: MaterialType.transparency,
                child: Ink(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white70),
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.indigo
                  ),
                  child: InkWell(
                    onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete Data'),
                        content: const Text('Yakin Data Akan Dihapus '),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Tidak'),
                            child: const Text('Tidak'),
                          ),
                          TextButton(
                            onPressed: () {
                              eraseAnak(id_anak);
                              Navigator.pushNamed(context, '/homeOrangtua');
                            },

                            child: const Text('Ya'),
                          ),
                        ],
                      ),
                    ),

                    // borderRadius: BorderRadius.circular(50.0),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.delete,
                        size: 20.0,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox( height: 5 ),
              Text('Delete', style: TextStyle(fontSize: 10, color: Colors.black54),),
            ],
          ),
        Spacer(),
      ],
    );
  }
}