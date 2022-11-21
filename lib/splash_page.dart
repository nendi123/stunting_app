import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 100),
                      child: Image.asset('assets/fakfak.png')),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 25),
                    child: Image.asset('assets/splash.png')),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    "CEGAH STUNTING",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  child: const Text(
                    "Lörem ipsum dataskade könat preren. Plade etnostik. Der euse om fåliga teledade. Debelt. Telenera kavis, samt skynka, som blandkostare, eller sabäliga. ",
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 58,
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(87, 81, 203, 1),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30))),
                        child: const Text(
                          'Ayo Mulai',
                          style: TextStyle(fontSize: 18),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/start');
                        },
                      ),
                    ))
              ]),
        ),
      ),
    );
  }
}
