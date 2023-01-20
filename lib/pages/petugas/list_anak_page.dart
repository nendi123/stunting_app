import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/petugas/anak_model.dart';
import 'package:stunting_app/pages/petugas/add_anak_page.dart';
import 'package:stunting_app/pages/petugas/add_skrining_page.dart';
import 'package:stunting_app/pages/petugas/edit_anak_page.dart';
import 'package:stunting_app/pages/petugas/kms_petugas_page.dart';
import 'package:stunting_app/pages/petugas/mpasi_anak_page.dart';
import 'package:stunting_app/pages/petugas/mpasi_page.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';

class ListAnakPage extends StatefulWidget {
  const ListAnakPage({super.key});

  @override
  State<ListAnakPage> createState() => _ListAnakPageState();
}

class _ListAnakPageState extends State<ListAnakPage> {
  TextEditingController _searchNikController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  List listIdAnak = [];
  List listNamaAnak = [];
  List listTglLahirAnak = [];

  bool isSearch = false;
  bool isLoading = false;
  bool isIbuShow = false;

  List _namaIbu = [];
  List _nikIbu = [];

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
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          'Daftar anak dari ibu',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        actions: [
          IconButton(
              onPressed: () {
                if (nikIbu != '') {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddAnakPagePetugas(nikIbu: nikIbu),
                    ),
                  );
                }
              },
              icon: Icon(Icons.add, size: 20,)),
        ],
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      bottomNavigationBar: Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Row(
          children: [
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor:
                      const Color.fromRGBO(87, 81, 203, 1),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: const Text(
                    'Show Daftar Ibu',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/homeIbu');
                    _fetchIbuPosyandu();
                  },
                ),
              )
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          // color: Colors.grey.shade200,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                child: TextField(
                  controller: _searchNikController,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {
                          _fetchIbu();
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Ketik NIK Ibu',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            const BorderSide(color: Colors.black45, width: 0.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !isLoading ? Container()
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
              // const CircularProgressIndicator(),
              isIbuShow ? Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _nikIbu.length,
                    itemBuilder: (context, index) {
                      return _tileIbu(
                          _nikIbu[index],
                          _namaIbu[index]);
                    },
                  ),
              )
              : Container(),

              isSearch
                  ? Container(
                      color: Colors.black12,
                      width: MediaQuery.of(context).size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: Constant().margin),
                      child: Card(
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text("DAFTAR ANAK", style:
                                  TextStyle(
                                    fontSize: 20,
                                    color: Colors.orange,
                                    // decoration: TextDecoration.underline,
                                    // decorationStyle: TextDecorationStyle.wavy,
                                  ),)),
                              const SizedBox(
                                height: 20,
                              ),
                              Align(
                                  alignment: Alignment.centerLeft,
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.account_circle,
                                        size: 40,
                                        color: Colors.black54,
                                      ),
                                      Column(
                                        children: [
                                          Text(
                                            " Ibu $namaIbu",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold, fontSize: 18),
                                          ),
                                        ],
                                      ),
                                    ],
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
                                  return _tile(
                                      listIdAnak[index],
                                      listNamaAnak[index],
                                      listTglLahirAnak[index]);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  : Container(),
            ],

          ),

        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   onPressed: () {
      //     // Navigator.pushNamed(context, '/addAnakPage');
      //     if (nikIbu != '') {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(
      //           builder: (context) => AddAnakPagePetugas(nikIbu: nikIbu),
      //         ),
      //       );
      //     }
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }

  Future<List<AnakModel>> _fetchAnak(String nik) async {
    listIdAnak = [];
    listNamaAnak = [];
    listTglLahirAnak = [];
    final response = await http
        .get(Uri.parse(AppConfig.API_ENDPOINT + '/showAnakIbu/' + nik));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        // if (jsonResponse[i]['nik_ibu'] == nikIbu) {
        setState(() {
          listIdAnak.add(jsonResponse[i]['id_anak'].toString());
          listNamaAnak.add(jsonResponse[i]['nama_lengkap']);
          listTglLahirAnak.add(jsonResponse[i]['tgl_lahir']);
        });
        // }
      }
      isLoading = false;
      setState(() {});
      return jsonResponse.map((job) => AnakModel.responseApi(job)).toList();
    } else {
      isLoading = false;
      setState(() {});
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
              color: Colors.deepPurple.shade100,
              child: ListTile(
                  title: Text(
                    nama,
                    style: const TextStyle(fontWeight: FontWeight.w400),
                  ),
                  subtitle: Text(umur),
                  trailing: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape:  CircleBorder(),
                        padding:  EdgeInsets.all(0),
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                      ),
                      // icon of the button
                      child: IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EditAnakPagePetugas(idAnak: idAnak),
                              ),
                            );
                          },
                          icon: Icon(Icons.edit, size: 24,)))),
              // child: Icon(Icons.edit, color: Colors.deepPurple),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              color: Colors.white,
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/mpasiPetugasPage');
                      print(idAnak+' '+nama);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              // MpasiAnakPagePetugas(id_anak: idAnak, nama: nama),
                            MpasiPagePetugas(id_anak: idAnak, nama: nama),
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
                      // Navigator.pushNamed(context, '/kmsPetugasPage');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              KmsPetugasPage(idanak: idAnak),
                        ),
                      );
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
                  // Column(
                  //   children: [
                  //     Image.asset(
                  //       'assets/image/Motherroom.png',
                  //       width: 20,
                  //     ),
                  //     const Text('Posyandu',
                  //         style: TextStyle(fontSize: 10, color: Colors.black54))
                  //   ],
                  // ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.pushNamed(context, '/skriningPage');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AddSkriningPage(nikIbu: nikIbu, idAnak: idAnak),
                        ),
                      );
                    },
                    child: Column(
                      children: const [
                        Icon(
                          Icons.search,
                          size: 20,
                          color: Color.fromRGBO(87, 81, 203, 1),
                        ),
                        Text('Skrining',
                            style:
                                TextStyle(fontSize: 10, color: Colors.black54))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Card _tileIbu(String nik, String nama) => Card(
    child: ListTile(
      // leading: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   mainAxisSize: MainAxisSize.max,
      //   children: [
      //     Text(
      //       '$index',
      //       style: const TextStyle(fontSize: 14),
      //     ),
      //   ],
      // ),
      subtitle: Text(
        nik,
      ),
      title: Text(
        'Ibu $nama',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.smart_display_outlined,
          color: Colors.purple,
        ),
        onPressed: () {
          _searchNikController.text = nik;
          _fetchIbu();
        },
      ),
    ),
  );

  void _fetchIbu() async {
    isSearch = true;
    isLoading = true;
    setState(() {});
    final SharedPreferences prefs = await _prefs;

    // final response = await http.get(Uri.parse(
    //     "${AppConfig.API_ENDPOINT}/showIbu/${_searchNikController.text}"));

    final response = await http.get(Uri.parse(
        "${AppConfig.API_ENDPOINT}/showIbuPosyandu/${prefs.getString('kode_posyandu')}"));

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
      _fetchAnak(_searchNikController.text);
      // } else {
      //   throw Exception('Failed to load jobs from API');
      // }
    }
  }

  void _fetchIbuPosyandu() async {
    isLoading = true;
    isIbuShow = true;
    setState(() {});
    final SharedPreferences prefs = await _prefs;

    final response = await http.get(Uri.parse(
        "${AppConfig.API_ENDPOINT}/showIbuPosyandu/${prefs.getString('kode_posyandu')}"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        _namaIbu.add(jsonResponse[i]['nama_lengkap']);
        _nikIbu.add(jsonResponse[i]['nik']);
        print(_namaIbu[i]);
        print(_nikIbu[i]);
      }
      setState(() {
      });
      isLoading = false;
    }
  }


}
