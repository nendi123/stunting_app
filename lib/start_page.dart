import 'package:flutter/material.dart';

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
                image: AssetImage('assets/background.jpeg'),
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
                  margin:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 100),
                  child: Image.asset('assets/fakfak.png')),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 25),
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
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const Text(
                "di CEGAH STUNTING",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const Text(
                "Aplikasi Pantau Tumbuh Kembang Balita",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: const Text(
                "Apakah Anda ?",
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/loginPetugas');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                child: const Card(
                  child: ListTile(
                    title: Text("PETUGAS POSYANDU"),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/registrasiOrangtua');
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 23),
                child: const Card(
                  child: ListTile(
                    title: Text("ORANGTUA"),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
