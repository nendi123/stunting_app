import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/shared/constant.dart';
import 'dart:async';

<<<<<<< HEAD


=======
>>>>>>> 2534b7a9d1d202b9c11da9dffcae63635793cf4c
class HomePetugasPage extends StatefulWidget {
  const HomePetugasPage({super.key});

  @override
  State<HomePetugasPage> createState() => _HomePetugasPageState();
}

class _HomePetugasPageState extends State<HomePetugasPage> {
  final _formKey = GlobalKey<FormState>();

  String _userid = '';

  @override
  void initState() {
    // TODO: implement initState
    getNik();
    super.initState();
  }

  Future<void> getUserid() async {
    final prefs = await SharedPreferences.getInstance();
    final String? userid = await prefs.getString('userid');

    setState(() => _userid = userid!);
  }

  static Future getNik() async {
    final prefs = await SharedPreferences.getInstance();
    final nik = prefs.getString('nik') ?? 0;
    return nik;
  }

  final _formKeyRes = GlobalKey<FormState>();
  TextEditingController _emailResController = TextEditingController();
  TextEditingController _passwordResController = TextEditingController();
  TextEditingController _rePasswordResController = TextEditingController();

  TextEditingController _searchNikController = TextEditingController();
  var namaIbu = '';
  var nikIbu = '';
  List listIdAnak = [];
  List listNamaAnak = [];
  List listTglLahirAnak = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/backgroundtiga.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: Constant().margin + 55),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0), //or 15.0
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.white,
                    child: Image.asset('assets/image/logo.png'),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Text(
                'Selamat Datang Petugas $_userid',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushNamed(context, '/listIbu');
                    }),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Card(
                          // color: Color.fromRGBO(0, 191, 166, 1),
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset('assets/image/ibu.png'),
                                ),
                                const Text('Ibu',
                                    style: TextStyle(color: Colors.white60))
                              ],
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      // Navigator.pushNamed(context, '/listPelatih');
                      Navigator.pushNamed(context, '/listAnakPage');
                    }),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Card(
                          // color: Color.fromRGBO(0, 191, 166, 1),
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Image.asset('assets/image/anak.png'),
                                ),
                                const Text('Anak',
                                    style: TextStyle(color: Colors.white60))
                              ],
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Card(
                          //color: Color.fromRGBO(0, 191, 166, 1),
                          color: Colors.deepPurple,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child:
                                      Image.asset('assets/image/skrining.png'),
                                ),
                                const Text('Skrining',
                                    style: TextStyle(color: Colors.white60))
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {},
      //     child: const Icon(
      //       Icons.child_care,
      //       size: 50,
      //     )),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.indigo,
        elevation: 10,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home, color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.qr_code, color: Colors.white,
              ),
<<<<<<< HEAD
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(children: [
                                Image.asset(
                                  'assets/image/iconscreening.png',
                                  width: 100,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Align(
                                  alignment: Alignment.centerRight,
                                  child: Text(
                                    'Tumbuh Kembang Anak',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ]),
                              const SizedBox(
                                height: 20,
                              ),
                              TextField(
                                controller: _searchNikController,
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade200,
                                    hintText: 'NIK ORANGTUA',
                                    suffixIcon: GestureDetector(
                                        onTap: () {
                                          _fetchAnak(_searchNikController.text);
                                          setState(() {

                                          });
                                        },
                                      // onTap: ((_fetchAnak(_searchNikController.text).(context) =>Hasil())),
                                        child: const Icon(Icons.search)),
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: Constant().margin),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: const BorderSide(
                                          color: Colors.white, width: 0.0),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                margin: const EdgeInsets.all(10),
                                child: const Align(
                                    alignment: Alignment.centerLeft,)
                                    // child: Text('DATA ANAK')),
                              ),

                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listIdAnak.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(listNamaAnak[index]),
                                    trailing: IconButton(
                                      icon:
                                          const Icon(Icons.arrow_circle_right),
                                      onPressed: () {
                                        Navigator.pushNamed(
                                            context, '/kmsPetugasPage');
                                      },
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
=======
              onPressed: () {},
>>>>>>> 2534b7a9d1d202b9c11da9dffcae63635793cf4c
            ),
            IconButton(
              icon: const Icon(
                Icons.person, color: Colors.white,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profilePetugas');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app, color: Colors.white,
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Yakin Akan Logout'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Tidak'),
                      child: const Text('Tidak'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.of(context)
                          .pushNamedAndRemoveUntil(
                              '/loginPetugas', (Route<dynamic> route) => false),
                      child: const Text('Ya'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
<<<<<<< HEAD

  Future<void> _showDialog() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: Container(
              margin: EdgeInsets.all(Constant().margin),
              child: Form(
                key: _formKeyRes,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('SKRINING',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20)),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: _searchNikController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          hintText: 'NIK Orang Tua',
                          suffixIcon: IconButton(
                              onPressed: () async {
                                CircularProgressIndicator;
                                _fetchIbu();
                                // _fetchAnak(_searchNikController.text);
                              },
                              icon: const Icon(Icons.search)),
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: Constant().margin),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: const BorderSide(
                                color: Colors.white, width: 0.0),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Daftar Anak',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listIdAnak.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(listNamaAnak[index]),
                          trailing: IconButton(
                            icon: const Icon(Icons.arrow_circle_right),
                            onPressed: () {
                              // Navigator.pushNamed(context, '/kmsPetugasPage');
                              Navigator.pushNamed(context, '/skriningPage');
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Widget Hasil() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: listIdAnak.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(listNamaAnak[index]),
          trailing: IconButton(
            icon:
            const Icon(Icons.arrow_circle_right),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/kmsPetugasPage');
            },
          ),
        );
      },
    );
  }

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
      _fetchAnak(_searchNikController.text);
    } else {
      throw Exception('Failed to load jobs from API');
      CircularProgressIndicator;
    }
  }

  _fetchAnak(String nik) async {
    String nik1 = _searchNikController.text;
    final response =
        await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showAnakIbu/"+nik1));
    print('nik $nik1');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        // if (jsonResponse[i]['nik_ibu'] == nikIbu) {
          listIdAnak.add(jsonResponse[i]['id_anak'].toString());
          listNamaAnak.add(jsonResponse[i]['nama_lengkap']);
          listTglLahirAnak.add(jsonResponse[i]['tgl_lahir']);
          print(jsonResponse[i]['nama_lengkap']);
          setState(() {});
        // }
      }
    } else {
      throw Exception('Failed to load jobs from API');
      CircularProgressIndicator;
    }
  }
=======
>>>>>>> 2534b7a9d1d202b9c11da9dffcae63635793cf4c
}
