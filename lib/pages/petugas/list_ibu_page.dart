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
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/homePetugas');
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: const Text(
          'Daftar ibu anggota Posyandu',
          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/addIbu');
            },
            icon: const Icon(Icons.add),
          ),
          // IconButton(
          //   onPressed: () {
          //     showSearch(context: context, delegate: CustomSearchDelegate());
          //   },
          //   icon: const Icon(Icons.search),
          // )
        ],
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      body: FutureBuilder<List<IbuModel>>(
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.green,
      //   onPressed: () {
      //     Navigator.pushNamed(context, '/addIbu');
      //   },
      //   child: const Icon(Icons.add),
      // ),
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
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (context, index) {
          int i = index + 1;
          return _tile(i, data[index].nik, data[index].namaLengkap);
        });
  }

  Card _tile(int index, String nik, String nama) => Card(
        child: ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                '$index',
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          subtitle: Text(
            nik,
          ),
          title: Text(
            'Ibu $nama',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          // trailing: Column(
          //   children: [
          //     RawMaterialButton(
          //       onPressed: () {
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //             builder: (context) => EditIbuPage(nik: nik),
          //           ),
          //         );
          //       },
          //       elevation: 2.0,
          //       fillColor: Colors.deepPurpleAccent,
          //       child: Icon(
          //         Icons.edit,
          //         size: 18.0,
          //         color: Colors.white,
          //       ),
          //       padding: EdgeInsets.all(5.0),
          //       shape: CircleBorder(),
          //     ),
          //   ],
          // ),
          trailing: IconButton(
            icon: const Icon(
              Icons.edit,
              color: Colors.purple,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditIbuPage(nik: nik),
                ),
              );
            },
          ),
        ),
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
