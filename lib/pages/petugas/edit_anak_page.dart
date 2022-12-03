import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class EditAnakPagePetugas extends StatefulWidget {
  const EditAnakPagePetugas({super.key});

  @override
  State<EditAnakPagePetugas> createState() => _EditAnakPageState();
}

class _EditAnakPageState extends State<EditAnakPagePetugas> {
  final _formKey = GlobalKey<FormState>();
  List<String> list = <String>['Ya', 'Tidak'];

  String dropdownValue = '';

  TextEditingController _namaLengkapController = TextEditingController();
  TextEditingController _tanggalLahirController = TextEditingController();
  TextEditingController _jenisKelaminController = TextEditingController();
  TextEditingController _anakLahirPrematurController = TextEditingController();
  TextEditingController _beratBadanController = TextEditingController();
  TextEditingController _tinggiBadanController = TextEditingController();
  TextEditingController _lingkarKepalaController = TextEditingController();
  TextEditingController _golonganDarahController = TextEditingController();
  TextEditingController _alergiController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil Anak - Lulu Faza Kamila")),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.only(bottom: 5),
            child: Column(
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
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: const Text(
                    "Unggah Foto Anda",
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                        side: const BorderSide(color: Colors.black26)),
                    child: Container(
                      margin: const EdgeInsets.all(10),
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
                            children: [
                              const Icon(
                                Icons.laptop,
                                size: 30,
                                color: Color.fromRGBO(87, 81, 203, 1),
                              ),
                              const Text('KMS')
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
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: Constant().margin),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _namaLengkapController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Nama Lengkap',
                      label: const Text('Nama Lengkap'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _tanggalLahirController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Tanggal Lahir',
                      label: const Text('Tanggal Lahir'),
                      suffixIcon: const Icon(Icons.calendar_today),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _jenisKelaminController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Jenis Kelamin',
                      label: const Text('Jenis Kelamin'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _anakLahirPrematurController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Apa Anak Lahir Prematur ?',
                      label: const Text('Apa Anak Lahir Prematur ?'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _beratBadanController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Berat Badan saat lahir (Kg)',
                      label: const Text('Berat Badan saat lahir (Kg)'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _tinggiBadanController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Tinggi Badan saat lahir (Kg)',
                      label: const Text('Tinggi Badan saat lahir (Kg)'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _golonganDarahController,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      hintText: 'Golongan Darah',
                      label: const Text('Golongan Darah'),
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors
                          .grey.shade200, //background color of dropdown button
                      //border of dropdown button
                      borderRadius: BorderRadius.circular(
                          50), //border raiuds of dropdown button
                    ),
                    child: Container(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: DropdownButton<String>(
                        dropdownColor: Colors.grey.shade200,
                        value: list.first,
                        underline: Container(), //remove underline
                        isExpanded: true,
                        elevation: 16,
                        style: const TextStyle(color: Colors.black),
                        onChanged: (String? value) {
                          // This is called when the user selects an item.
                          setState(() {
                            dropdownValue = value!;
                          });
                        },
                        items:
                            list.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      margin: const EdgeInsets.symmetric(horizontal: 22),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(87, 81, 203, 1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Simpan',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/homeIbu');
                        },
                      ),
                    ))
              ]),
            ),
          )
        ],
      )),
    );
  }
}
