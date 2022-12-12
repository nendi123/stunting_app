import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/pages/orangtua/detail_anak_page.dart';
import 'package:stunting_app/pages/orangtua/profile_anak_page.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/model/anak.dart';
import 'package:stunting_app/model/item.dart';
import 'package:stunting_app/shared/util.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:async/async.dart';
import 'package:stunting_app/pages/orangtua/test_detail_anak.dart';
import 'package:stunting_app/pages/orangtua//edit_ibu_page.dart';

class HomeOrangtuaPage extends StatefulWidget {
  // const HomeOrangtuaPage({Key ? key, required this.anak});
  // final Anak anak;
  const HomeOrangtuaPage({super.key});


  // final List list;
  // const HomeOrangtuaPage({required this.list});

  @override
  State<HomeOrangtuaPage> createState() => _HomeOrangtuaPageState();
}


class _HomeOrangtuaPageState extends State<HomeOrangtuaPage> {

  @override
  void initState() {
    response = getData();
    super.initState();
    // getNik().then((_) {
    //   response = getData(getNik());
    // });
  }

  // static Future getNik() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   final nik = prefs.getString('nik');
  //   print(nik);
  //   return nik;
  // }

  String user = '';

  Future<List<dynamic>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final nik = prefs.getString('nik');
    final userid = prefs.getString('userid');
    print(nik);
    print(userid);
    user = await userid!;
    final response = await http.get(Uri.parse(AppConfig.API_ENDPOINT+'/showAnakIbu/'+nik!));
    return jsonDecode(response.body);
  }

  Future<String?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userid = prefs.getString('userid');
    return userid;
  }

  late Future<List<dynamic>> response;
  late final List<Anak> anak;

  var _nik = '';

  myApiWidget() {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
      // if(snapshot.connectionState == ConnectionState.waiting) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(25),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                // final List<Anak> ana = snapshot.data;
                return  Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data[index]['nama_lengkap']),
                        trailing: Text(snapshot.data[index]['tgl_lahir']),
                        // leading: CircleAvatar(
                        //   backgroundImage: NetworkImage(snapshot.data[index]['foto']),
                        onTap:() {
                          // final List<Anak> ana = snapshot.data;
                          final responseData = snapshot.data[index];
                          print(responseData);
                          // // print(responseData);
                          // anak = snapshot.data[index];
                          // print(responseData);
                          // Navigator.pushNamed(context, '/profileAnak');
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context)=>ProfileAnakPage(),
                          //     settings: RouteSettings(arguments: responseData)));
                          //
                          // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>(nama: _name.text, email: _email.text, phone: _phone.text)));
                          String _prematur;
                          if(snapshot.data[index]['prematur'] == 'Tidak') {
                            _prematur = 'false';
                          } else {
                            _prematur = 'true';
                          }
                          _nik = snapshot.data[index]['nik_ibu'];

                          Navigator.of(context).push(MaterialPageRoute(builder:
                              (context)=>
                                  TestDetailAnak(id_anak: snapshot.data[index]['id_anak'], nik_ibu: snapshot.data[index]['nik_ibu'], nama_lengkap: snapshot.data[index]['nama_lengkap'], jenis_kelamin: snapshot.data[index]['jenis_kelamin'],
                                    tgl_lahir: snapshot.data[index]['tgl_lahir'], akte_lahir : snapshot.data[index]['akte_lahir'], persalinan_oleh : snapshot.data[index]['persalinan_oleh'],
                                    bb_lahir: snapshot.data[index]['bb_lahir'], panjang_lahir: snapshot.data[index]['panjang_lahir'], prematur: _prematur, usia_kehamilan: snapshot.data[index]['usia_kehamilan'],
                                    alergi: snapshot.data[index]['alergi'], gol_darah: snapshot.data[index]['gol_darah'], lingkar_kepala: snapshot.data[index]['lingkar_kepala'],tb_lahir: snapshot.data[index]['tb_lahir'])));

                          // id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir,
                          // persalinan_oleh, bb_lahir, panjang_lahir, prematur, usia_kehamilan, alergi, gol_darah,
                          // lingkar_kepala,tb_lahir
                          //
                          // Navigator.of(context).push(MaterialPageRoute(
                          //     builder: (context)=>ProfileAnakPage(anak: responseData)));
                        },
                      ),
                    ],
                  ),
                );
              }
          );
        } else {
          return Center(
            // child: CircularProgressIndicator(),
            child: Text('Data anak tidak ditemukan.'),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // String user = getUser().toString();
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
                    child: Image.asset(
                        'assets/image/logo.png',

                    ),
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
                "Selamat Datang Ibu $user",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Card(
                elevation: 0,
                color: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Image.asset('assets/image/iconanak.png'),
                    title: const Text(
                      'Daftar Anak Ibu',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize : 16,

                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: myApiWidget(),
            ),


            // for(var list in futurePost)
            // GestureDetector(
            //   child: Card(
            //     margin: EdgeInsets.symmetric(horizontal: Constant().margin),
            //     elevation: 0,
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         side: const BorderSide(color: Colors.black26)),
            //     child: ListTile(
            //       title: Text(
            //           // "${snapshot}",
            //           'Lulu Faza Kamila \n4 thn 7 bln',
            //           style: TextStyle(fontWeight: FontWeight.w300)
            //       ),
            //     ),
            //   ),
            //   onTap: () {
            //     Navigator.pushNamed(context, '/profileAnak');
            //   },
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
            //   child: Card(
            //     elevation: 0,
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         side: const BorderSide(color: Colors.black26)),
            //     child: ListTile(
            //       title: Text(
            //           'Lulu Faza Kamila \n4 thn 7 bln',
            //         style: TextStyle(fontWeight: FontWeight.w300)
            //       ),
            //       trailing:
            //           IconButton(
            //               icon: Icon(Icons.edit),
            //               onPressed: () {},
            //               color: Colors.deepPurple,
            //               splashRadius: 25,
            //               splashColor: Colors.purple
            //           ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 0,
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
            //   child: Card(
            //     elevation: 0,
            //     color: Colors.white,
            //     shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(10),
            //         side: const BorderSide(color: Colors.black26)),
            //     child: ListTile(
            //       title: Text(
            //           'Laura Shafaa Nadhira \n2 thn 3 bln',
            //           style: TextStyle(fontWeight: FontWeight.w300)
            //       ),
            //       trailing:
            //           IconButton(
            //               icon: Icon(Icons.edit),
            //               onPressed: () {},
            //               color: Colors.deepPurple,
            //               splashRadius: 25,
            //               splashColor: Colors.purple),
            //     ),
            //   ),
            // )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addAnak');
        },
        child: const Icon(Icons.child_care),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black26,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white60
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.qr_code,
                color: Colors.white60,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.child_friendly,
                color: Colors.white60,
              ),
              onPressed: () {

              },
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white60,
              ),
              onPressed: () {
                // Navigator.pushNamed(context, '/profileIbu');
                // Navigator.pushNamed(context, EditIbuPage(nik: _nik,));
                print('nik $_nik');
                if (_nik != '') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => EditIbuPage(nik: _nik)));
                }
                Navigator.push(context, MaterialPageRoute(builder: (context) => EditIbuPage(nik: _nik)));
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white60,
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
                      onPressed: () => logOut(context),
                          // Navigator.pushNamed(context, '/loginPetugas'),
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

}

// class ItemList extends StatelessWidget {
//   final List list;
//   ItemList({required this.list});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return ListView.builder(
//         itemCount: list == null ? 0 : list.length,
//         itemBuilder: (context, i) {
//           return Container(
//             child: GestureDetector(
//               // onTap: () => Navigator.pushNamed(context, '/profileAnak'),
//               onTap: () => Navigator.of(context).push(MaterialPageRoute(
//                   builder: (BuildContext context) => new TestDetailAnak(anak: anak, id_anak: id_anak, nik_ibu: nik_ibu, nama_lengkap: nama_lengkap, jenis_kelamin: jenis_kelamin, tgl_lahir: tgl_lahir, akte_lahir: akte_lahir, persalinan_oleh: persalinan_oleh, bb_lahir: bb_lahir, panjang_lahir: panjang_lahir, prematur: prematur, usia_kehamilan: usia_kehamilan, alergi: alergi, gol_darah: gol_darah, lingkar_kepala: lingkar_kepala, tb_lahir: tb_lahir)AnakPage(anak: i)))),
//             ),
//           );
//         }
//     );
//   }
// }