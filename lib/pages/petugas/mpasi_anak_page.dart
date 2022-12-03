import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class MpasiAnakPagePetugas extends StatefulWidget {
  const MpasiAnakPagePetugas({super.key});

  @override
  State<MpasiAnakPagePetugas> createState() => _MpasiAnakPagePetugasState();
}

class _MpasiAnakPagePetugasState extends State<MpasiAnakPagePetugas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey.shade200,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(
                height: 40,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'MPASI - Lulu Faza Kamila',
                    style: TextStyle(fontSize: 20),
                  )),
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
                          ],
                        ),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 30),
                                child: const Text('06.00')),
                            const Text('ASI')
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
