import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stunting_app/model/petugas/anak_model.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:http/http.dart' as http;

class ListAnakPage extends StatefulWidget {
  const ListAnakPage({super.key});

  @override
  State<ListAnakPage> createState() => _ListAnakPageState();
}

class _ListAnakPageState extends State<ListAnakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
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
                  decoration: InputDecoration(
                      suffixIcon: const Icon(Icons.search),
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
                        const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Nama Ibu : Emilia",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )),
                        const Divider(),
                        FutureBuilder<List<AnakModel>>(
                          future: _fetchAnak(),
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<AnakModel>? data = snapshot.data;
                              return _jobsListView(data);
                            } else if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            }
                            return const CircularProgressIndicator();
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
          Navigator.pushNamed(context, '/addAnakPage');
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<List<AnakModel>> _fetchAnak() async {
    final response =
        await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbuAll"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      return jsonResponse.map((job) => AnakModel.responseApi(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  ListView _jobsListView(data) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].nik, data[index].namaLengkap);
        });
  }

  Column _tile(String nama, String umur) => Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            child: const ListTile(
                title: Text(
                  'Lulu Faza Kamila',
                  style: TextStyle(fontWeight: FontWeight.w200),
                ),
                subtitle: Text('4 thn 8 bln'),
                trailing: Icon(Icons.edit)),
          ),
          Container(
            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/mpasiPetugasPage');
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/image/Tableware.png',
                        width: 30,
                      ),
                      const Text('MPASI')
                    ],
                  ),
                ),
                Column(
                  children: const [
                    Icon(
                      Icons.laptop,
                      size: 30,
                      color: Color.fromRGBO(87, 81, 203, 1),
                    ),
                    Text('KMS')
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/image/Motherroom.png',
                      width: 30,
                    ),
                    const Text('Posyandu')
                  ],
                )
              ],
            ),
          ),
        ],
      );
}
