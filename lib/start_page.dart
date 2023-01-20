import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/shared/constant.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/background.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                  height: 70,
                  margin: EdgeInsets.symmetric(
                      horizontal: Constant().margin, vertical: 80),
                  child: Image.asset('assets/image/fakfak.png')),
            ),
            const SizedBox(
              height: 0,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: const Text(
                "Selamat Datang",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: const Text(
                "di CEGAH STUNTING",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: const Text(
                "Aplikasi Pantau Tumbuh Kembang Balita",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: const Text(
                "Apakah Anda ?",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/loginPetugas');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 0,
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black26)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Image.asset('assets/image/petugas.png'),
                        ),
                        const Text(
                          'PETUGAS POSYANDU',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: ()  {
                if(getRemeber() == true) {
                  Navigator.pushNamed(context, '/homeOrangtua');
                } else {
                  Navigator.pushNamed(context, '/loginIbu');
                }
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Card(
                  elevation: 0,
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: const BorderSide(color: Colors.black26)),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 80,
                          child: Image.asset('assets/image/orangtua.png'),
                        ),
                        const Text(
                          'ORANGTUA',
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }

  Future<bool> getRemeber() async {
    final prefs = await SharedPreferences.getInstance();
    bool ingat =  prefs.getBool('rembember_me') ?? false;
    return ingat;
  }
}
