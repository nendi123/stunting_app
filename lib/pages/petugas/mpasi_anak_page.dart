import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/model/mpasi.dart';
import 'package:stunting_app/shared/config.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MpasiAnakPagePetugas extends StatefulWidget {
  const MpasiAnakPagePetugas({super.key, required this.id_anak, required this.nama});

  final String nama;
  final String id_anak;

  @override
  State<MpasiAnakPagePetugas> createState() => _MpasiAnakPagePetugasState();
}

class _MpasiAnakPagePetugasState extends State<MpasiAnakPagePetugas> {
  // final _formKeyRes = GlobalKey<FormState>();
  final _formKey = GlobalKey<FormState>();

  List<String> waktu = [];
  List<String> menu_mpasi = [];
  var id = '';

  // late Future<List> response;
  late String statusCode = '';
  late Future response;

  TextEditingController _jamController = TextEditingController();
  TextEditingController _menuController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    response = getData(widget.id_anak.toString());
  }

  Future<List<dynamic>> getData(String id_anak) async {
    final response = await http.get(Uri.parse(AppConfig.API_ENDPOINT+'/showMpasi/'+id_anak!));
    // await Future.delayed(Duration(seconds: 3));
    print(response.statusCode);
    statusCode = response.statusCode.toString();
    print(response.body);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      for (var i = 0; i < jsonResponse.length; i++) {
        waktu.add(jsonResponse[i]["waktu"]);
        menu_mpasi.add(jsonResponse[i]['menu_mpasi']);
        print(waktu[i] + ' ' + menu_mpasi[i]);
      }
    }
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MPASI - ' + widget.nama,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0), //or 15.0
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.white,
                    child: Image.asset('assets/image/foto_anak.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              daftarMpasi(),
              // Container(
              //   // margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              //   child:
              //     daftarMpasi(),
              //   // Card(
              //   //   child: Container(
              //   //     padding: EdgeInsets.all(10),
              //   //     child: Column(
              //   //       children: [
              //   //         Row(
              //   //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //           children: [
              //   //             daftarMpasi(),
              //   //             // Row(children: [
              //   //             //   Container(
              //   //             //       padding: const EdgeInsets.symmetric(
              //   //             //           horizontal: 30),
              //   //             //       child: const Text('06.00')),
              //   //             //   const Text('ASI'),
              //   //             // ]),
              //   //             // Row(
              //   //             //   children: [
              //   //             //     Align(
              //   //             //         alignment: Alignment.centerRight,
              //   //             //         child: Icon(Icons.edit)),
              //   //             //     Align(
              //   //             //         alignment: Alignment.centerRight,
              //   //             //         child: MaterialButton(
              //   //             //           onPressed: () {
              //   //             //             // print(nik);
              //   //             //             // Navigator.push(
              //   //             //             //   context,
              //   //             //             //   MaterialPageRoute(
              //   //             //             //     builder: (context) => EditIbuPage(nik: nik),
              //   //             //             //   ),
              //   //             //             // );
              //   //             //           },
              //   //             //           color: Colors.blue,
              //   //             //           textColor: Colors.white,
              //   //             //           child: Icon(
              //   //             //             Icons.edit,
              //   //             //             size: 18,
              //   //             //           ),
              //   //             //           padding: EdgeInsets.all(10),
              //   //             //           shape: CircleBorder(),
              //   //             //         )
              //   //             //     ),
              //   //             //   ],
              //   //             // )
              //   //           ],
              //   //         ),
              //   //         // Divider(),
              //   //         // Row(
              //   //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //         //   children: [
              //   //         //     Row(children: [
              //   //         //       Container(
              //   //         //           padding: const EdgeInsets.symmetric(
              //   //         //               horizontal: 30),
              //   //         //           child: const Text('06.00')),
              //   //         //       const Text('ASI'),
              //   //         //     ]),
              //   //         //     Row(
              //   //         //       children: [
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(Icons.edit)),
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(
              //   //         //               Icons.delete,
              //   //         //               color: Colors.red,
              //   //         //             ))
              //   //         //       ],
              //   //         //     )
              //   //         //   ],
              //   //         // ),
              //   //         // Divider(),
              //   //         // Row(
              //   //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //         //   children: [
              //   //         //     Row(children: [
              //   //         //       Container(
              //   //         //           padding: const EdgeInsets.symmetric(
              //   //         //               horizontal: 30),
              //   //         //           child: const Text('06.00')),
              //   //         //       const Text('ASI'),
              //   //         //     ]),
              //   //         //     Row(
              //   //         //       children: [
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(Icons.edit)),
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(
              //   //         //               Icons.delete,
              //   //         //               color: Colors.red,
              //   //         //             ))
              //   //         //       ],
              //   //         //     )
              //   //         //   ],
              //   //         // ),
              //   //         // Divider(),
              //   //         // Row(
              //   //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //         //   children: [
              //   //         //     Row(children: [
              //   //         //       Container(
              //   //         //           padding: const EdgeInsets.symmetric(
              //   //         //               horizontal: 30),
              //   //         //           child: const Text('06.00')),
              //   //         //       const Text('ASI'),
              //   //         //     ]),
              //   //         //     Row(
              //   //         //       children: [
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(Icons.edit)),
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(
              //   //         //               Icons.delete,
              //   //         //               color: Colors.red,
              //   //         //             ))
              //   //         //       ],
              //   //         //     )
              //   //         //   ],
              //   //         // ),
              //   //         // Divider(),
              //   //         // Row(
              //   //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //         //   children: [
              //   //         //     Row(children: [
              //   //         //       Container(
              //   //         //           padding: const EdgeInsets.symmetric(
              //   //         //               horizontal: 30),
              //   //         //           child: const Text('06.00')),
              //   //         //       const Text('ASI'),
              //   //         //     ]),
              //   //         //     Row(
              //   //         //       children: [
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(Icons.edit)),
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(
              //   //         //               Icons.delete,
              //   //         //               color: Colors.red,
              //   //         //             ))
              //   //         //       ],
              //   //         //     )
              //   //         //   ],
              //   //         // ),
              //   //         // Divider(),
              //   //         // Row(
              //   //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //         //   children: [
              //   //         //     Row(children: [
              //   //         //       Container(
              //   //         //           padding: const EdgeInsets.symmetric(
              //   //         //               horizontal: 30),
              //   //         //           child: const Text('06.00')),
              //   //         //       const Text('ASI'),
              //   //         //     ]),
              //   //         //     Row(
              //   //         //       children: [
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(Icons.edit)),
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(
              //   //         //               Icons.delete,
              //   //         //               color: Colors.red,
              //   //         //             ))
              //   //         //       ],
              //   //         //     )
              //   //         //   ],
              //   //         // ),
              //   //         // Divider(),
              //   //         // Row(
              //   //         //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   //         //   children: [
              //   //         //     Row(children: [
              //   //         //       Container(
              //   //         //           padding: const EdgeInsets.symmetric(
              //   //         //               horizontal: 30),
              //   //         //           child: const Text('06.00')),
              //   //         //       const Text('ASI'),
              //   //         //     ]),
              //   //         //     Row(
              //   //         //       children: [
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(Icons.edit)),
              //   //         //         Align(
              //   //         //             alignment: Alignment.centerRight,
              //   //         //             child: Icon(
              //   //         //               Icons.delete,
              //   //         //               color: Colors.red,
              //   //         //             ))
              //   //         //       ],
              //   //         //     )
              //   //         //   ],
              //   //         // ),
              //   //         // Divider(),
              //   //       ],
              //   //     ),
              //   //   ),
              //   // ),
              // )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    margin: EdgeInsets.all(Constant().margin),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('Tambah Data MPASI',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: _jamController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                hintText: 'Jam',
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
                          TextFormField(
                            controller: _menuController,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                hintText: 'Menu MPASI',
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
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 58,
                                margin: EdgeInsets.symmetric(
                                    horizontal: Constant().margin),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          const Color.fromRGBO(87, 81, 203, 1),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 10),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30))),
                                  child: const Text(
                                    'Simpan',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  onPressed: ()
                                    async => (_formKey.currentState!.validate())
                                        ? addMpasiAnak(widget.id_anak, _jamController.text, _menuController.text)
                                        : null,
                                    // Navigator.pop(context);
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        child: const Icon(Icons.add),
      ),
      // bottomNavigationBar: BottomAppBar(
      //     child: Container(
      //   color: Colors.grey.shade200,
      //   width: MediaQuery.of(context).size.width,
      //   height: 58,
      //   padding: EdgeInsets.symmetric(horizontal: Constant().margin),
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(
      //         backgroundColor: const Color.fromRGBO(87, 81, 203, 1),
      //         padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      //         shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(30))),
      //     child: const Text(
      //       'Kembali',
      //       style: TextStyle(fontSize: 18),
      //     ),
      //     onPressed: () {
      //       Navigator.pushNamed(context, '/editAnakPage');
      //     },
      //   ),
      // )),
    );
  }


  Widget daftarMpasi() {
    print(response);
    return FutureBuilder(
        future: response,
        builder: (context, snapshot) {
          if(snapshot.hasData) {
            return Container(
              child: Center(
                // child: Text(snapshot.data.toString()),
                child: Container(
                width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: waktu.length,
                  itemBuilder: (context, index) {
                    return _tileMpasi(
                      waktu[index],
                      menu_mpasi[index]);
                    },
                  ),
              ),
            ));
            // return ListView.builder(
            //     shrinkWrap: true,
            //     physics: const AlwaysScrollableScrollPhysics(),
            //     padding: EdgeInsets.all(25),
            //     itemCount: snapshot.data.length,
            //     itemBuilder: (context, int index) {
            //       return Card(
            //           child: Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: Table(
            //               defaultColumnWidth: IntrinsicColumnWidth(),
            //               // border: TableBorder.all(color: Colors.black38),
            //               children: [
            //                 TableRow(
            //                     decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(0)),
            //                     children: [
            //                       Column(
            //                         children: [
            //                           Text('\nWAKTU\n',style: TextStyle(color: Colors.white),)
            //                         ],
            //                       ),
            //                       Column(
            //                         children: [
            //                           Text('\nMENU MPASI \n', style: TextStyle(color: Colors.white))
            //                         ],
            //                       ),
            //                     ]
            //                 ),
            //                 for(var item in snapshot.data)
            //                   TableRow(
            //                     decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(0)),
            //                     children: [
            //                       Column(children: [Text(item['waktu']!,style: TextStyle(color: Colors.black54))],                            ),
            //                       Column(children: [Text(item['jenis_mpasi']!+'\n', style: TextStyle(color: Colors.black54))],),
            //                     ],
            //                   )
            //               ],
            //             ),
            //           )
            //       );
            //     }
            // );

          } else {
            print(statusCode);
            if(statusCode == '422') {
              return Center(child: Text('Data tidak ditemukan.'));
            } else {
              return Align(child: Center(child: CircularProgressIndicator()));
            }
          }
        }

    );
  }

  Card _tileMpasi(String waktu, String menu_mpasi) => Card(
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
        waktu,
      ),
      title: Text(
        menu_mpasi,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        icon: const Icon(
          Icons.smart_display_outlined,
          color: Colors.purple,
        ),
        onPressed: () {
          // id = nik;
          // _fetchIbu();
        },
      ),
    ),
  );

  void addMpasiAnak(String id_anak, String waktu, String jenis_mpasi) async {

    final response = await addMpasi(Mpasi(id: id, id_anak: id_anak, waktu: waktu, jenis_mpasi: jenis_mpasi));

    if(response != null) {
      print(response.body.toString());
      if(response.statusCode == 200) {
        var jsonResp = jsonDecode(response.body);
        // Navigator.pop(context, jsonResp['message']);
        setState(() {});
        Navigator.pop(context, true);
        // Navigator.pushNamed(context, '/homeOrangtua');
      } else {
        // dialog(context, "${response.body.toString()}");
        Navigator.pop(context, "${response.body.toString()}");
      }
    }

  }
}
