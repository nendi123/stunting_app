import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class HomeOrangtuaPage extends StatefulWidget {
  const HomeOrangtuaPage({super.key});

  @override
  State<HomeOrangtuaPage> createState() => _HomeOrangtuaPageState();
}

class _HomeOrangtuaPageState extends State<HomeOrangtuaPage> {
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
                    child: Image.asset(
                        'assets/logo.png',

                    ),
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
                "Selamat Datang Ibu",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Card(
                elevation: 0,
                color: Colors.white.withOpacity(0.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ListTile(
                    leading: Image.asset('assets/iconanak.png'),
                    title: const Text(
                      'Profile Anak',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                          fontSize : 16,

                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black26)),
                child: ListTile(
                  title: Text(
                      'Lulu Faza Kamila \n4 thn 7 bln',
                    style: TextStyle(fontWeight: FontWeight.w300)
                  ),
                  trailing:
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                          color: Colors.deepPurple,
                          splashRadius: 25,
                          splashColor: Colors.purple
                      ),
                ),
              ),
            ),
            const SizedBox(
              height: 0,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: Constant().margin),
              child: Card(
                elevation: 0,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(color: Colors.black26)),
                child: ListTile(
                  title: Text(
                      'Laura Shafaa Nadhira \n2 thn 3 bln',
                      style: TextStyle(fontWeight: FontWeight.w300)
                  ),
                  trailing:
                      IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {},
                          color: Colors.deepPurple,
                          splashRadius: 25,
                          splashColor: Colors.purple),
                ),
              ),
            )
          ],
        ),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.child_care),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.black26,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.home,
                color: Colors.white60
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.qr_code,
                color: Colors.white60,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.child_friendly,
                color: Colors.white60,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.person,
                color: Colors.white60,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(
                Icons.exit_to_app,
                color: Colors.white60,
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
