import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

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
                                  Navigator.pushNamed(
                                      context, '/mpasiPetugasPage');
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
}
