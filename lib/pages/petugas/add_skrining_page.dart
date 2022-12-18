import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class AddSkriningPage extends StatefulWidget {
  const AddSkriningPage({super.key});

  @override
  State<AddSkriningPage> createState() => _AddSkriningPageState();
}

enum Q1 { ya, tidak }

enum Q2 { ya, tidak }

enum Q3 { ya, tidak }

enum Q4 { ya, tidak }

enum Q5 { ya, tidak }

enum Q6 { ya, tidak }

enum Q7 { ya, tidak }

enum Q8 { ya, tidak }

enum Q9 { ya, tidak }

enum Q10 { ya, tidak }

enum Q11 { ya, tidak }

enum Q12 { ya, tidak }

enum Q13 { ya, tidak }

enum Q14 { ya, tidak }

enum Q15 { ya, tidak }

class _AddSkriningPageState extends State<AddSkriningPage> {
  Q1? _q1 = Q1.ya;
  Q2? _q2 = Q2.ya;
  Q3? _q3 = Q3.ya;
  Q4? _q4 = Q4.ya;
  Q5? _q5 = Q5.ya;
  Q6? _q6 = Q6.ya;
  Q7? _q7 = Q7.ya;
  Q8? _q8 = Q8.ya;

  Q9? _q9 = Q9.ya;
  Q10? _q10 = Q10.ya;
  Q11? _q11 = Q11.ya;
  Q12? _q12 = Q12.ya;
  Q13? _q13 = Q13.ya;
  Q14? _q14 = Q14.ya;
  Q15? _q15 = Q15.ya;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(40.0), //or 15.0
                      child: Container(
                        height: 150.0,
                        width: 150.0,
                        color: Colors.transparent,
                        child: Image.asset('assets/image/foto_anak.png'),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                    child: const Text(
                      "Data Tumbuh Kembang \n LULU FAZA KAMILA",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              DefaultTabController(
                  length: 4, // length of tabs
                  initialIndex: 0,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const TabBar(
                          labelColor: Colors.black,
                          unselectedLabelColor: Colors.black,
                          tabs: [
                            Tab(text: 'Faktor Spesifik'),
                            Tab(text: 'Faktor Sensitif'),
                          ],
                        ),
                        Container(
                            height: MediaQuery.of(context)
                                .size
                                .height, //height of TabBarView
                            decoration: const BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.grey, width: 0.5))),
                            child: TabBarView(children: <Widget>[
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak mendapat ASI Eksklusif ?"),
                                              subtitle: Row(children: [
                                                Radio<Q1>(
                                                  value: Q1.ya,
                                                  groupValue: _q1,
                                                  onChanged: (Q1? value) {
                                                    setState(() {
                                                      _q1 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q1>(
                                                  value: Q1.tidak,
                                                  groupValue: _q1,
                                                  onChanged: (Q1? value) {
                                                    setState(() {
                                                      _q1 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak anda mendapat MPASI yang sesuai ?"),
                                              subtitle: Row(children: [
                                                Radio<Q2>(
                                                  value: Q2.ya,
                                                  groupValue: _q2,
                                                  onChanged: (Q2? value) {
                                                    setState(() {
                                                      _q2 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q2>(
                                                  value: Q2.tidak,
                                                  groupValue: _q2,
                                                  onChanged: (Q2? value) {
                                                    setState(() {
                                                      _q2 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak anda mendapat PMT ?"),
                                              subtitle: Row(children: [
                                                Radio<Q3>(
                                                  value: Q3.ya,
                                                  groupValue: _q3,
                                                  onChanged: (Q3? value) {
                                                    setState(() {
                                                      _q3 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q3>(
                                                  value: Q3.tidak,
                                                  groupValue: _q3,
                                                  onChanged: (Q3? value) {
                                                    setState(() {
                                                      _q3 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak anda PMT dihabiskan ?"),
                                              subtitle: Row(children: [
                                                Radio<Q4>(
                                                  value: Q4.ya,
                                                  groupValue: _q4,
                                                  onChanged: (Q4? value) {
                                                    setState(() {
                                                      _q4 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q4>(
                                                  value: Q4.tidak,
                                                  groupValue: _q4,
                                                  onChanged: (Q4? value) {
                                                    setState(() {
                                                      _q4 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak ditimbang di POSYANDU minilam 8x setahun ?"),
                                              subtitle: Row(children: [
                                                Radio<Q5>(
                                                  value: Q5.ya,
                                                  groupValue: _q5,
                                                  onChanged: (Q5? value) {
                                                    setState(() {
                                                      _q5 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q5>(
                                                  value: Q5.tidak,
                                                  groupValue: _q5,
                                                  onChanged: (Q5? value) {
                                                    setState(() {
                                                      _q5 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak anda mendapat tablet ZINC jika Diare ?"),
                                              subtitle: Row(children: [
                                                Radio<Q6>(
                                                  value: Q6.ya,
                                                  groupValue: _q6,
                                                  onChanged: (Q6? value) {
                                                    setState(() {
                                                      _q6 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q6>(
                                                  value: Q6.tidak,
                                                  groupValue: _q6,
                                                  onChanged: (Q6? value) {
                                                    setState(() {
                                                      _q6 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak anda pernah Cacingan ?"),
                                              subtitle: Row(children: [
                                                Radio<Q7>(
                                                  value: Q7.ya,
                                                  groupValue: _q7,
                                                  onChanged: (Q7? value) {
                                                    setState(() {
                                                      _q7 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q7>(
                                                  value: Q7.tidak,
                                                  groupValue: _q7,
                                                  onChanged: (Q7? value) {
                                                    setState(() {
                                                      _q7 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah anak anda pernah minum obat cacing ?"),
                                              subtitle: Row(children: [
                                                Radio<Q8>(
                                                  value: Q8.ya,
                                                  groupValue: _q8,
                                                  onChanged: (Q8? value) {
                                                    setState(() {
                                                      _q8 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q8>(
                                                  value: Q8.tidak,
                                                  groupValue: _q8,
                                                  onChanged: (Q8? value) {
                                                    setState(() {
                                                      _q8 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  )),

                              //page2
                              Container(
                                  margin: const EdgeInsets.all(5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Card(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            ListTile(
                                              title: Text(
                                                  "Apakah ibu punya saluran air bersih ?"),
                                              subtitle: Row(children: [
                                                Radio<Q9>(
                                                  value: Q9.ya,
                                                  groupValue: _q9,
                                                  onChanged: (Q9? value) {
                                                    setState(() {
                                                      _q9 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q9>(
                                                  value: Q9.tidak,
                                                  groupValue: _q9,
                                                  onChanged: (Q9? value) {
                                                    setState(() {
                                                      _q9 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah ibu memiliki jamban dirumah ?"),
                                              subtitle: Row(children: [
                                                Radio<Q10>(
                                                  value: Q10.ya,
                                                  groupValue: _q10,
                                                  onChanged: (Q10? value) {
                                                    setState(() {
                                                      _q10 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q10>(
                                                  value: Q10.tidak,
                                                  groupValue: _q10,
                                                  onChanged: (Q10? value) {
                                                    setState(() {
                                                      _q10 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah seluruh anggota keluarga memakai jamban dirumah ?"),
                                              subtitle: Row(children: [
                                                Radio<Q11>(
                                                  value: Q11.ya,
                                                  groupValue: _q11,
                                                  onChanged: (Q11? value) {
                                                    setState(() {
                                                      _q11 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q11>(
                                                  value: Q11.tidak,
                                                  groupValue: _q11,
                                                  onChanged: (Q11? value) {
                                                    setState(() {
                                                      _q11 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah dirumah ibu memiliki septic tank ?"),
                                              subtitle: Row(children: [
                                                Radio<Q12>(
                                                  value: Q12.ya,
                                                  groupValue: _q12,
                                                  onChanged: (Q12? value) {
                                                    setState(() {
                                                      _q12 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q12>(
                                                  value: Q12.tidak,
                                                  groupValue: _q12,
                                                  onChanged: (Q12? value) {
                                                    setState(() {
                                                      _q12 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah ibu selalu mencuci tangan sebelum makan ?"),
                                              subtitle: Row(children: [
                                                Radio<Q13>(
                                                  value: Q13.ya,
                                                  groupValue: _q13,
                                                  onChanged: (Q13? value) {
                                                    setState(() {
                                                      _q13 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Ya"),
                                                Radio<Q13>(
                                                  value: Q13.tidak,
                                                  groupValue: _q13,
                                                  onChanged: (Q13? value) {
                                                    setState(() {
                                                      _q13 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: Text(
                                                  "Apakah ibu selalu mencuci tangan setelah buang air besar ?"),
                                              subtitle: Row(children: [
                                                Radio<Q14>(
                                                  value: Q14.ya,
                                                  groupValue: _q14,
                                                  onChanged: (Q14? value) {
                                                    setState(() {
                                                      _q14 = value;
                                                    });
                                                  },
                                                ),
                                                const Text("Ya"),
                                                Radio<Q14>(
                                                  value: Q14.tidak,
                                                  groupValue: _q14,
                                                  onChanged: (Q14? value) {
                                                    setState(() {
                                                      _q14 = value;
                                                    });
                                                  },
                                                ),
                                                Text("Tidak"),
                                              ]),
                                            ),
                                            ListTile(
                                              title: const Text(
                                                  "Apakah anak anda selalu mencuci tangan dengan sabun sebelum makan ?"),
                                              subtitle: Row(children: [
                                                Radio<Q15>(
                                                  value: Q15.ya,
                                                  groupValue: _q15,
                                                  onChanged: (Q15? value) {
                                                    setState(() {
                                                      _q15 = value;
                                                    });
                                                  },
                                                ),
                                                const Text("Ya"),
                                                Radio<Q15>(
                                                  value: Q15.tidak,
                                                  groupValue: _q15,
                                                  onChanged: (Q15? value) {
                                                    setState(() {
                                                      _q15 = value;
                                                    });
                                                  },
                                                ),
                                                const Text("Tidak"),
                                              ]),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )),
                            ]))
                      ])),
            ]),
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
            'Simpan',
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
