import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stunting_app/model/petugas/anak_model.dart';
import 'package:stunting_app/pages/orangtua/add_anak_page.dart';
import 'package:stunting_app/pages/petugas/add_anak_page.dart';
import 'package:stunting_app/pages/petugas/edit_anak_page.dart';
import 'package:stunting_app/pages/petugas/mpasi_anak_page.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:http/http.dart' as http;

class ListAnakPage extends StatefulWidget {
  const ListAnakPage({super.key});

  @override
  State<ListAnakPage> createState() => _ListAnakPageState();
}

class _ListAnakPageState extends State<ListAnakPage> {
  TextEditingController _searchNikController = TextEditingController();

  List listIdAnak = [];
  List listNamaAnak = [];
  List listTglLahirAnak = [];

  var namaIbu = '';
  var nikIbu = '';
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
          //menu icon button at start left of appbar
          onPressed: () {
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/homePetugas');
          },
          icon: Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: Text(
          'Daftar anak dari ibu',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(

          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                child: TextField(
                  controller: _searchNikController,
                  decoration: InputDecoration(
                      suffixIcon: GestureDetector(
                          onTap: () {
                            _fetchIbu();
                          },
                          child: const Icon(Icons.search)),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ketik NIK Ibu',
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                child: Card(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Hasil Pencarian :")),
                        const SizedBox(
                          height: 20,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Ibu $namaIbu",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        const Divider(),
                        // FutureBuilder<List<AnakModel>>(
                        //   future: _fetchAnak(),
                        //   builder: (context, snapshot) {
                        //     if (snapshot.hasData) {
                        //       List<AnakModel>? data = snapshot.data;
                        //       return _jobsListView(data);
                        //     } else if (snapshot.hasError) {
                        //       return Text("${snapshot.error}");
                        //     }
                        //     return const CircularProgressIndicator();
                        //   },
                        // )
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listIdAnak.length,
                          itemBuilder: (context, index) {
                            return _tile(listIdAnak[index], listNamaAnak[index],
                                listTglLahirAnak[index]);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          // Navigator.pushNamed(context, '/addAnakPage');
          if (nikIbu != '') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddAnakPagePetugas(nikIbu: nikIbu),
              ),
            );
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<AnakModel>> _fetchAnak() async {
    listIdAnak = [];
    listNamaAnak = [];
    listTglLahirAnak = [];
    final response =
        await http.get(Uri.parse(AppConfig.API_ENDPOINT + '/showAnakAll'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        if (jsonResponse[i]['nik_ibu'] == nikIbu) {
          setState(() {
            listIdAnak.add(jsonResponse[i]['id_anak'].toString());
            listNamaAnak.add(jsonResponse[i]['nama_lengkap']);
            listTglLahirAnak.add(jsonResponse[i]['tgl_lahir']);
          });
        }
      }
      return jsonResponse.map((job) => AnakModel.responseApi(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  // ListView _jobsListView(data) {
  //   return ListView.builder(
  //       physics: const NeverScrollableScrollPhysics(),
  //       shrinkWrap: true,
  //       itemCount: data.length,
  //       itemBuilder: (context, index) {
  //         return _tile(data[index].namaLengkap, data[index].tglLahir);
  //       });
  // }

  Card _tile(String idAnak, String nama, String umur) => Card(
        child: Column(
          children: [
            Container(
              color: Colors.grey.shade200,
              child: ListTile(
                  title: Text(
                    nama,
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(umur),
                  trailing: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                EditAnakPagePetugas(idAnak: idAnak),
                          ),
                        );
                      },

                      child: Icon(Icons.edit, color: Colors.deepPurple,size: 18,)
                  )
              ),
                      // child: Icon(Icons.edit, color: Colors.deepPurple),

            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/mpasiPetugasPage');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              MpasiAnakPagePetugas(nama: nama),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/image/Tableware.png',
                          width: 20,
                        ),
                        const Text('MPASI',
                            style:
                                TextStyle(fontSize: 10, color: Colors.black54))
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/kmsPetugasPage');
                    },
                    child: Column(
                      children: const [
                        Icon(
                          Icons.laptop,
                          size: 20,
                          color: Color.fromRGBO(87, 81, 203, 1),
                        ),
                        Text('KMS',
                            style:
                                TextStyle(fontSize: 10, color: Colors.black54))
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        'assets/image/Motherroom.png',
                        width: 20,
                      ),
                      const Text('Posyandu',
                          style: TextStyle(fontSize: 10, color: Colors.black54))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      );

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
        if (jsonResponse[i]['nik'] == _searchNikController.text) {
          namaIbu = jsonResponse[i]['nama_lengkap'];
          nikIbu = jsonResponse[i]['nik'];
          setState(() {});
        }
      }
      _fetchAnak();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
}
