import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class ListIbuPage extends StatefulWidget {
  const ListIbuPage({super.key});

  @override
  State<ListIbuPage> createState() => _ListIbuPageState();
}

class _ListIbuPageState extends State<ListIbuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.grey.shade200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Card(
                  color: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(10),
                    child: const Text(
                      "Daftar Ibu Posyandu",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Constant().margin, vertical: 10),
              child: Card(
                  child: Column(
                children: [
                  ListTile(
                    // leading: Text('3217070508940008'),
                    title: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/homeIbu');
                      },
                      child: const Text(
                        '3217070508940008 \nIbu Siti',
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/editIbu');
                      },
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                    height: 5,
                  ),
                  ListTile(
                    // leading: Text('3217070508940008'),
                    title: const Text(
                      '3217070508940008 \nIbu Fulan binti Fulanah',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
            )
          ],
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
}
