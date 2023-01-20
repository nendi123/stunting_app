import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/petugas/ibu_post_model.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/shared/config.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/petugas/ibu_model.dart';

class AddIbuPosyandu extends StatefulWidget {
  const AddIbuPosyandu({super.key});

  @override
  State<AddIbuPosyandu> createState() => _AddIbuPosyanduState();
}

class _AddIbuPosyanduState extends State<AddIbuPosyandu> {
  // Pada page ini akan menampilkan daftar ibu yang belum memiliki kode posyandu
  // Dengan menekan tombol '+' pada list Ibu, secara otomatis akan menambahka kode posyandu
  // pada ibu tersebut
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homePetugas');
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          'Daftar ibu bukan anggota Posyandu',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder<List<IbuModel>>(
                future: _fetchIbu(),
                builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<IbuModel>? data = snapshot.data;
                      return _jobsListView(data);
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    return Align(child: Center(
                      child: CircularProgressIndicator(),
                    ));
                },
              ),
      ),
    );
  }

  Future<List<IbuModel>> _fetchIbu() async {
    final SharedPreferences prefs = await _prefs;
    final response = await http.get(Uri.parse(
        "${AppConfig.API_ENDPOINT}/showIbuBukanPosyandu/${prefs.getString('kode_posyandu')}"));

    print(prefs.getString('kode_posyandu'));
    // /showIbuPosyandu/{kode_posyandu}
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      return jsonResponse.map((job) => IbuModel.responseApi(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          int i = index + 1;
          return _tile(i, data[index].nik, data[index].namaLengkap);
        });
  }

  Card _tile(int index, String nik, String nama) => Card(
    child: ListTile(
        leading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              '$index',
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
        subtitle: Text(
          nik,
        ),
        title: Text(
          'Ibu $nama',
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        trailing:
        MaterialButton(
          onPressed: () async {
            print(nik);
            final SharedPreferences prefs = await _prefs;
            IbuPostMode.addPosyanduIbu(
                nik,
                prefs.getString('kode_posyandu').toString()
            )
            .then((value) => {
              if (value)
                {_showMyDialog("Data Ibu Berhasil ditambahkan ke Posyandu", true)}
              else
                {_showMyDialog("Update gagal, periksa kembali isian data!", false)}
            });
            setState(() {

            });
          },
          color: Colors.blue,
          textColor: Colors.white,
          child: Icon(
            Icons.add_box_outlined,
            size: 18,
          ),
          padding: EdgeInsets.all(10),
          shape: CircleBorder(),
        )
    ),
  );

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
                setState(() {});
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

}