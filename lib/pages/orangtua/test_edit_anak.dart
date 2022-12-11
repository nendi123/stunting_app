import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/model/anak.dart';
import 'package:stunting_app/shared/textfield.dart';

class TestEditAnakPage extends StatefulWidget {
  final Anak anak;
  const TestEditAnakPage({Key? key, required  this.anak});
  @override
  _TestEditAnakState createState() => _TestEditAnakState();
}

class _TestEditAnakState extends State<TestEditAnakPage> {
  void prosesEditAnak() async  {


    final response = await editAnak(Anak(id_anak: '', nik_ibu:'',
        nama_lengkap: '', jenis_kelamin: '' , tgl_lahir: '',
        akte_lahir: '', persalinan_oleh: '', bb_lahir: '',
        panjang_lahir: '', prematur: '', usia_kehamilan: '',
        alergi: '', gol_darah: '', tb_lahir: '', lingkar_kepala: '' ?? ""));

    if(response != null) {
      print(response.body.toString());
      if(response.statusCode == 200) {
        var jsonResp = jsonDecode(response.body);
        Navigator.pop(context, jsonResp['message']);
      } else {
        // dialog(context, "${response.body.toString()}");
        Navigator.pop(context, "${response.body.toString()}");
        print(response.statusCode);
        print(response.reasonPhrase);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController id_anak = TextEditingController(text: widget.anak.id_anak);
    TextEditingController nik_ibu = TextEditingController(text: widget.anak.nik_ibu);
    TextEditingController nama_lengkap = TextEditingController(text: widget.anak.nama_lengkap);
    TextEditingController tgl_lahir = TextEditingController(text: widget.anak.tgl_lahir);
    TextEditingController akte_lahir = TextEditingController(text: widget.anak.akte_lahir);
    TextEditingController tb_lahir = TextEditingController(text: widget.anak.tb_lahir);
    TextEditingController bb_lahir = TextEditingController(text: widget.anak.bb_lahir);
    TextEditingController panjang_lahir = TextEditingController(text: widget.anak.panjang_lahir);
    TextEditingController lingkar_kepala = TextEditingController(text: widget.anak.lingkar_kepala);
    TextEditingController usia_kehamilan = TextEditingController(text: widget.anak.usia_kehamilan);
    TextEditingController alergi = TextEditingController(text: widget.anak.alergi);
    TextEditingController gol_darah = TextEditingController(text: widget.anak.gol_darah);
    TextEditingController persalinan_oleh = TextEditingController(text: widget.anak.persalinan_oleh);

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
          'Update Data : '+widget.anak.nama_lengkap,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 100, bottom: 100, left: 18, right: 18),
          child: Container(
              height: 550,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.indigo[700],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    decoration: BoxDecoration(boxShadow: [
                    ]),
                    child: Textfield(
                      hintStyle: TextStyle(color: Colors.black45),
                      controller: id_anak,
                      onChanged: (val) {
                        id_anak.text = val;
                      },
                      hintText: 'ID Anak',
                      icon: Icon(Icons.accessibility),
                  ),
                ),
              ],

            ),
          ),
        ),
      ),

    );
  }
}