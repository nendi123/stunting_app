import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class MpasiAnakPagePetugas extends StatefulWidget {
  const MpasiAnakPagePetugas({super.key, required this.nama});

  final String nama;

  @override
  State<MpasiAnakPagePetugas> createState() => _MpasiAnakPagePetugasState();
}

class _MpasiAnakPagePetugasState extends State<MpasiAnakPagePetugas> {
  final _formKeyRes = GlobalKey<FormState>();
  TextEditingController _jamController = TextEditingController();
  TextEditingController _menuController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MPASI - ' + widget.nama,
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
                height: 10,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0), //or 15.0
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    color: Colors.white,
                    child: Image.asset('assets/image/logo.png'),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: const Text('06.00')),
                              const Text('ASI'),
                            ]),
                            Row(
                              children: [
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(Icons.edit)),
                                Align(
                                    alignment: Alignment.centerRight,
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ))
                              ],
                            )
                          ],
                        ),
                        Divider(),
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
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    margin: EdgeInsets.all(Constant().margin),
                    child: Form(
                      key: _formKeyRes,
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
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
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
}
