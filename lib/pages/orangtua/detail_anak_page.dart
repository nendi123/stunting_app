import 'package:flutter/material.dart';
import 'package:stunting_app/model/anak.dart';

// class DetailAnakPage extends StatelessWidget {
//   final Anak anak;
//   const DetailAnakPage({Key? key, required this.anak}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child:
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             Text(
//               'ID : ${anak.id_anak}',
//             ),
//             Text('Nama Lengkap : ${anak.nama_lengkap}'),
//             const SizedBox(
//               height: 20,
//             ),
//             const Text('Tanggal lahir: '),
//             Text(anak.tgl_lahir)
//           ])),
//     );
//   }
// }

class DetailAnakPage extends StatefulWidget {
  List list;
  String id_anak;
  int index;

  DetailAnakPage({required this.list, required this.id_anak, required this.index});

  @override
  _DetailAnakPageState createState() => _DetailAnakPageState();
}

class _DetailAnakPageState extends State<DetailAnakPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['posisi']}"),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(10.0),
            height: 500.0,
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    child: Column(
                      children: [
                        Padding(padding: const EdgeInsets.only(top: 30.0)),
                        Text(
                          widget.list[widget.index]['nama_lengkap'],
                        ),
                      ],
                    ),
                  )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}