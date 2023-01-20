import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/model/mpasi.dart';
import 'package:stunting_app/shared/config.dart';
import 'dart:async';
import 'package:http/http.dart' as http;

class MpasiPagePetugas extends StatefulWidget {
  const MpasiPagePetugas({super.key, required this.id_anak, required this.nama});

  final String nama;
  final String id_anak;

  @override
  State<MpasiPagePetugas> createState() => _MpasiPagePetugasState();
}

class _MpasiPagePetugasState extends State<MpasiPagePetugas> {
  final _formKey = GlobalKey<FormState>();
  late List data = [];
  var id = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<String> getData() async {
    // final response = await http.get(Uri.parse(AppConfig.API_ENDPOINT+'/showMpasi/'+id_anak!));
    var response = await http.get(
        Uri.parse(AppConfig.API_ENDPOINT+'/showMpasi/'+widget.id_anak),
        headers: {"Accept": "application/json"});

    setState(() {
      var convertDataToJson = jsonDecode(response.body);
      data = convertDataToJson;
    });

    return "Success";
  }

  TextEditingController _jamController = TextEditingController();
  TextEditingController _menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print(data);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MPASI - ' + widget.nama,
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        elevation: 10,
      ),

      body:
          ListView.builder(
            itemCount: data == null ? 0 : data.length,
            shrinkWrap: true,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              int i = index + 1;
              // _tile( data[index].id, i, data[index].waktu,  data[index].jenis_mpasi);
              return Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                    color: Colors.white,
                      border: Border.all(width: 3,color: Colors.black12),
                    ),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Row(
                            children: [
                              Container(
                                  width: 200,
                                  height: 40,
                                  alignment: Alignment.center,
                                  child: Card(
                                      child: Text(data[index]['waktu']+ ' - '+data[index]['jenis_mpasi']),
                                  ),
                                  padding: EdgeInsets.all(4),
                                ),
                              Flexible(
                                child:
                                ElevatedButton(
                                    onPressed: () {
                                      String id_mpasi = data[index]['id'].toString();
                                      String id_anak = data[index]['id_anak'].toString();
                                      _dialogEdit(id_mpasi, id_anak, data[index]['waktu'], data[index]['jenis_mpasi']);
                                    },
                                    child: Icon(Icons.edit, color: Colors.white, size: 14,),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(0),
                                      backgroundColor: Colors.blue, // <-- Button color
                                      foregroundColor: Colors.red, // <-- Splash color
                                    ),
                                  ),
                              ),
                              Flexible(child:
                                  ElevatedButton(
                                    onPressed: () async {
                                      print(data[index]['id']);
                                      eraseMpasi(data[index]['id']).then((value) => {
                                        if(value) {
                                          _showMyDialog("Data MPASI telah dihapus!", true)
                                        } else {
                                          _showMyDialog("Penghapusan data gagal!", true)
                                        }

                                      });

                                      setState(() { getData(); });
                                      // if(eraseMpasi(data[index]['id']) != null) {
                                      //   _showMyDialog("Data MPASI telah dihapus!", true);
                                      //   setState(() {});
                                      // } else {
                                      //   _showMyDialog("Penghapusan data gagal!", true);
                                      // }
                                    },

                                    child: Icon(Icons.delete, color: Colors.white, size: 14,),
                                    style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(0),
                                      backgroundColor: Colors.blue, // <-- Button color
                                      foregroundColor: Colors.red, // <-- Splash color
                                    ),
                                  ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          _jamController.text = '';
          _menuController.text = '';
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
    );
  }

  void addMpasiAnak(String id_anak, String waktu, String jenis_mpasi) async {
    final response = await addMpasi(Mpasi(id: id, id_anak: id_anak, waktu: waktu, jenis_mpasi: jenis_mpasi));

    if(response != null) {
      print(response.body.toString());
      if(response.statusCode == 200) {
        // var jsonResp = jsonDecode(response.body);
        Navigator.pop(context, true);
      } else {
        Navigator.pop(context, "${response.body.toString()}");
      }
    }
    setState(() {
      getData();
    });
  }

  void editMpasiAnak(String id, String id_anak, String waktu, String jenis_mpasi) async {
    final response = await editMpasi(Mpasi(id: id.toString(), id_anak: id_anak, waktu: waktu, jenis_mpasi: jenis_mpasi));

    if(response != null) {
      print(response.body.toString());
      if(response.statusCode == 200) {
        // var jsonResp = jsonDecode(response.body);
        Navigator.pop(context, true);
      } else {
        Navigator.pop(context, "${response.body.toString()}");
      }
    }
    setState(() {
      getData();
    });
  }

  // Card _tile(String id, int index, String waktu, String menu_mpasi) => Card(
  //   child: ListTile(
  //       leading: Column(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisSize: MainAxisSize.max,
  //         children: [
  //           Text(
  //             '$index',
  //             style: const TextStyle(fontSize: 14),
  //           ),
  //         ],
  //       ),
  //       subtitle: Text(
  //         waktu,
  //       ),
  //       title: Text(
  //         menu_mpasi,
  //         style: const TextStyle(fontWeight: FontWeight.w300),
  //       ),
  //       // trailing: Column(
  //       //   children: [
  //       //     RawMaterialButton(
  //       //       onPressed: () {
  //       //         Navigator.push(
  //       //           context,
  //       //           MaterialPageRoute(
  //       //             builder: (context) => EditIbuPage(nik: nik),
  //       //           ),
  //       //         );
  //       //       },
  //       //       elevation: 2.0,
  //       //       fillColor: Colors.deepPurpleAccent,
  //       //       child: Icon(
  //       //         Icons.edit,
  //       //         size: 18.0,
  //       //         color: Colors.white,
  //       //       ),
  //       //       padding: EdgeInsets.all(5.0),
  //       //       shape: CircleBorder(),
  //       //     ),
  //       //   ],
  //       // ),
  //       trailing:
  //       MaterialButton(
  //         onPressed: () {
  //           print(id.toString());
  //           Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //               builder: (context) => _dialogEdit(id, widget.id_anak, waktu, menu_mpasi),
  //             ),
  //           );
  //         },
  //         color: Colors.blue,
  //         textColor: Colors.white,
  //         child: Icon(
  //           Icons.edit,
  //           size: 18,
  //         ),
  //         padding: EdgeInsets.all(10),
  //         shape: CircleBorder(),
  //       )
  //   ),
  // );

  _dialogEdit(String id, String id_anak, String waktu, String menu_mpasi) {
    _jamController.text = waktu;
    _menuController.text = menu_mpasi;

    return showDialog(
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
                const Text('Edit Data MPASI',
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
                      hintText: _jamController.text,
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
                      hintText: _menuController.text,
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
                            ? editMpasiAnak(id, id_anak, _jamController.text, _menuController.text)
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
  }

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
                setState(() { getData();});
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}