// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stunting_app/model/petugas/ibu_model.dart';
import 'package:stunting_app/pages/petugas/edit_ibu_page.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:http/http.dart' as http;

class ListIbuPage extends StatefulWidget {
  const ListIbuPage({super.key});

  @override
  State<ListIbuPage> createState() => _ListIbuPageState();
}

class _ListIbuPageState extends State<ListIbuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/homePetugas');
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
          'Daftar ibu anggota Posyandu',
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              // method to show the search bar
              showSearch(
                  context: context,
                  // delegate to customize the search bar
                  delegate: CustomSearchDelegate()
              );
            },
            icon: const Icon(Icons.search),
          )
        ],
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      resizeToAvoidBottomInset: false,
      // body: Container(
      //   width: MediaQuery.of(context).size.width,
      //   // height: MediaQuery.of(context).size.height,
      //   color: Colors.grey.shade200,
      //   child: SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     mainAxisSize: MainAxisSize.max,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       const SizedBox(
      //         height: 10,
      //       ),
      //       // Container(
      //       //   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
      //       //   child: Align(
      //       //     alignment: Alignment.topCenter,
      //       //     child: Card(
      //       //       color: Colors.greenAccent,
      //       //       shape: RoundedRectangleBorder(
      //       //         borderRadius: BorderRadius.circular(15.0),
      //       //       ),
      //       //       child: Container(
      //       //         width: MediaQuery.of(context).size.width,
      //       //         padding: EdgeInsets.all(10),
      //       //         child: const Text(
      //       //           "Daftar Ibu Posyandu",
      //       //           style: TextStyle(fontSize: 20),
      //       //         ),
      //       //       ),
      //       //     ),
      //       //   ),
      //       // ),
      //       Container(
      //         margin: EdgeInsets.symmetric(
      //             horizontal: Constant().margin, vertical: 10),
      //         child: Card(
      //             child: Column(
      //           children: [
      //             FutureBuilder<List<IbuModel>>(
      //               future: _fetchIbu(),
      //               builder: (context, snapshot) {
      //                 if (snapshot.hasData) {
      //                   List<IbuModel>? data = snapshot.data;
      //                   return _jobsListView(data);
      //                 } else if (snapshot.hasError) {
      //                   return Text("${snapshot.error}");
      //                 }
      //                 return const CircularProgressIndicator();
      //               },
      //             ),
      //             ListTile(
      //               // leading: Text('3217070508940008'),
      //               title: GestureDetector(
      //                 onTap: () {
      //                   Navigator.pushNamed(context, '/homeIbu');
      //                 },
      //                 child: const Text(
      //                   '3217070508940008 \nIbu Siti',
      //                   style: TextStyle(fontWeight: FontWeight.w300),
      //                 ),
      //               ),
      //               trailing: IconButton(
      //                 icon: const Icon(
      //                   Icons.edit,
      //                 ),
      //                 onPressed: () {
      //                   Navigator.pushNamed(context, '/editIbu');
      //                 },
      //               ),
      //             ),
      //             const Divider(
      //               color: Colors.black,
      //               height: 5,
      //             ),
      //             ListTile(
      //               // leading: Text('3217070508940008'),
      //               title: const Text(
      //                 '3217070508940008 \nIbu Fulan binti Fulanah',
      //                 style: TextStyle(fontWeight: FontWeight.w300),
      //               ),
      //               trailing: IconButton(
      //                 icon: const Icon(
      //                   Icons.edit,
      //                 ),
      //                 onPressed: () {},
      //               ),
      //             ),
      //           ],
      //         )),
      //       )
      //     ],
      //   ),
      // ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(2.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox( height: 10,),
              // Container(
              //   margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              //   child: Align(
              //     alignment: Alignment.topCenter,
              //     child: Card(
              //       color: Colors.greenAccent,
              //       shape: RoundedRectangleBorder(
              //         borderRadius: BorderRadius.circular(15.0),
              //       ),
              //       child: Container(
              //         width: MediaQuery.of(context).size.width,
              //         padding: const EdgeInsets.all(10),
              //         child: const Text(
              //           "Daftar Ibu Posyandu",
              //           style: TextStyle(fontSize: 20),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 5.0, vertical: 2.0),
                child: Card(
                  child: Column(
                  children: [
                    FutureBuilder<List<IbuModel>>(
                      future: _fetchIbu(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<IbuModel>? data = snapshot.data;
                          return _jobsListView(data);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        return const CircularProgressIndicator();
                      },
                    )
                  ],
                )),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pushNamed(context, '/addIbu');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
          child: Container(
        color: Colors.grey.shade200,
        width: MediaQuery.of(context).size.width,
        height: 58,
        padding: EdgeInsets.symmetric(horizontal: Constant().margin),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(87, 81, 203, 1),
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: const Text(
            'Kembali',
            style: TextStyle(fontSize: 18),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/homePetugas');
          },
        ),
      )),
    );
  }

  Future<List<IbuModel>> _fetchIbu() async {
    final response =
        await http.get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbuAll"));

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
        itemCount: data.length,
        itemBuilder: (context, index) {
          int i = index+1;
          return _tile(i, data[index].nik, data[index].namaLengkap);
        });
  }

  ListTile _tile(int index, String nik, String nama) => ListTile(
        title: Text(
          '${index}. ${nik} \n     Ibu ${nama}',
          style: const TextStyle(fontWeight: FontWeight.w300),
        ),
        trailing:
            Column(
              children: [
                RawMaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditIbuPage(nik: nik),
                      ),
                    );
                  },
                  elevation: 2.0,
                  fillColor: Colors.deepPurpleAccent,
                  child: Icon(
                    Icons.edit,
                    size: 18.0,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(5.0),
                  shape: CircleBorder(),
                ),
              ],
            ),



        // IconButton(
        //   icon: const Icon(
        //     Icons.edit,
        //   ),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => EditIbuPage(nik: nik),
        //       ),
        //     );
        //   },
        // ),
      );
}

class CustomSearchDelegate extends SearchDelegate {
  // Demo list to show querying
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  // first overwrite to
  // clear the search text
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  // second overwrite to pop out of search menu
  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  // third overwrite to show query result
  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }

  // last overwrite to show the
  // querying process at the runtime
  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var fruit in searchTerms) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}