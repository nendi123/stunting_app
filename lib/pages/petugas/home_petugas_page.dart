import 'package:flutter/material.dart';
import 'package:stunting_app/pages/petugas/login_petugas_page.dart';
import 'package:stunting_app/shared/constant.dart';

class HomePetugasPage extends StatefulWidget {
  const HomePetugasPage({super.key});

  @override
  State<HomePetugasPage> createState() => _HomePetugasPageState();
}

class _HomePetugasPageState extends State<HomePetugasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/backgroundtiga.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: Constant().margin + 55),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(80.0), //or 15.0
                  child: Container(
                    height: 100.0,
                    width: 100.0,
                    color: Colors.white,
                    child: Image.asset('assets/logo.png'),
                  ),
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
                "Selamat Datang Petugas",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: TextField(
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
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
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  GestureDetector(
                    onTap: (() {
                      Navigator.pushNamed(context, '/listIbu');
                    }),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Card(
                          color: Color.fromRGBO(0, 191, 166, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset('assets/ibu.png'),
                                ),
                                Text('Ibu')
                              ],
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      // Navigator.pushNamed(context, '/listPelatih');
                    }),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Card(
                          color: Color.fromRGBO(0, 191, 166, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset('assets/anak.png'),
                                ),
                                Text('Anak')
                              ],
                            ),
                          )),
                    ),
                  ),
                  GestureDetector(
                    onTap: (() {
                      // Navigator.pushNamed(context, '/listPelatih');
                    }),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3.5,
                      child: Card(
                          color: Color.fromRGBO(0, 191, 166, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset('assets/skrining.png'),
                                ),
                                Text('Skrining')
                              ],
                            ),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.child_care),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.qr_code,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.child_care,
                color: Colors.grey,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/profilePetugas');
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
              ),
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Logout'),
                  content: const Text('Yakin Akan Logout'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Tidak'),
                      child: const Text('Tidak'),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, '/loginPetugas'),
                      child: const Text('Ya'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
