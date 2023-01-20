import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';


class RiwayatBalitaPage extends StatefulWidget {
  const RiwayatBalitaPage({Key ? key, required this.id_anak});
  final int id_anak;

  @override
  State<RiwayatBalitaPage> createState() => _RiwayatBalitaPageState();
}

class _RiwayatBalitaPageState extends State<RiwayatBalitaPage> {

  Future<List<dynamic>> getData(String id_anak) async {
    final response = await http.get(Uri.parse(AppConfig.API_ENDPOINT+'/showRiwayatBalita/'+id_anak!));
    await Future.delayed(Duration(seconds: 1));
    print(response.statusCode);
    statusCode = response.statusCode.toString();
    return jsonDecode(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    response = getData(widget.id_anak.toString());
    super.initState();
  }

  late Future<List> response;
  late String statusCode = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: response,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          return ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(25),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Table(
                        defaultColumnWidth: IntrinsicColumnWidth(),
                        border: TableBorder.all(color: Colors.black38),
                        children: [
                        TableRow(
                          decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(5)),
                          children: [
                            Column(
                              children: [
                                Text('\nTanggal',style: TextStyle(color: Colors.white),)
                              ],
                            ),
                          Column(
                            children: [
                              Text('Berat \n(kg)\n', style: TextStyle(color: Colors.white))
                            ],
                          ),
                          Column(
                            children: [
                              Text('Tinggi \n(cm)', style: TextStyle(color: Colors.white))
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Lingkar\nKepala \n(cm)', style: TextStyle(color: Colors.white))
                            ],
                          )
                        ]
                      ),
                      for(var item in snapshot.data)

                        TableRow(
                          decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10.0)),
                          children: [
                            Column(children: [Text('\n'+item['tgl_riwayat']!,style: TextStyle(color: Colors.black54))],                            ),
                            Column(children: [Text('\n'+item['berat_badan']!+'\n', style: TextStyle(color: Colors.black54))],),
                            Column(children: [Text('\n'+item['tinggi_badan']!,style: TextStyle(color: Colors.black54))],),
                            Column(children: [Text('\n'+item['lingkar_kepala']!, style: TextStyle(color: Colors.black54))],),
                          ],
                        )
                      ],
                    ),
                  )
                );
              }
          );

        } else {
          print(statusCode);
          if(statusCode == '422') {
            return Center(child: Text('Data tidak ditemukan.'));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
      }

    );
  }
}
