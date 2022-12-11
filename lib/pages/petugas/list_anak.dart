import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class List_anakWidget extends StatefulWidget {
  const List_anakWidget({super.key});

  @override
  _List_anakWidgetState createState() => _List_anakWidgetState();
}

class _List_anakWidgetState extends State<List_anakWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/backgroundtiga.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 60,
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
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                    )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // Figma Flutter Generator Rectangle38Widget - RECTANGLE
            // Figma Flutter Generator Frame16Widget - FRAME
            // Figma Flutter Generator Frame16Widget - FRAME
            // Figma Flutter Generator Frame16Widget - FRAME
            // Figma Flutter Generator Frame16Widget - FRAME
            Container(
                width: 360,
                height: 449,
                decoration: const BoxDecoration(),
                child: Stack(children: <Widget>[
                  Positioned(
                      top: 0,
                      left: 25,
                      child: Container(
                          width: 310,
                          height: 409,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            color: Color.fromRGBO(255, 255, 255, 1),
                            border: Border.all(
                              color: Color.fromRGBO(163, 163, 163, 1),
                              width: 1,
                            ),
                          ))),
                  const Positioned(
                      top: 23,
                      left: 42,
                      child: Text(
                        'Hasil pencarian :',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(58, 57, 57, 1),
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  const Positioned(
                      top: 57,
                      left: 43,
                      child: Text(
                        'Nama Ibu : Emilia',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            letterSpacing:
                                0 /*percentages not used in flutter. defaulting to zero*/,
                            fontWeight: FontWeight.normal,
                            height: 1),
                      )),
                  const Positioned(
                      top: 80.2435302734375,
                      left: 41.9910888671875,
                      child: Divider(
                          color: Color.fromRGBO(163, 163, 163, 1),
                          thickness: 2)),
                  Positioned(
                      top: 88,
                      left: 42,
                      child: Container(
                          width: 276,
                          height: 111,
                          child: Stack(children: <Widget>[
                            Positioned(
                                top: 0,
                                left: 0,
                                child: Container(
                                    width: 276,
                                    height: 111,
                                    decoration: BoxDecoration(
                                      color: Color.fromRGBO(240, 240, 240, 1),
                                    ))),
                            Positioned(
                                top: 8.000020027160645,
                                left: 11,
                                child: Container(
                                    width: 251,
                                    height: 43,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                              width: 201,
                                              height: 43,
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 0,
                                                    left: 0,
                                                    child: Text(
                                                      'Lulu Faza Kamilah',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              58, 57, 57, 1),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height: 1),
                                                    )),
                                                Positioned(
                                                    top: 22,
                                                    left: 0,
                                                    child: Text(
                                                      '4 thn 8 bln',
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              58, 57, 57, 1),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height: 1),
                                                    )),
                                              ]))),
                                      Positioned(
                                          top: 7.696969985961914,
                                          left: 231,
                                          child: Container(
                                              width: 20,
                                              height: 25.271764755249023,
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/image/Edit.png'),
                                                    fit: BoxFit.fitWidth),
                                              ))),
                                    ]))),
                            Positioned(
                                top: 58.30303955078125,
                                left: 0,
                                child: Container(
                                    width: 276,
                                    height: 50.45454406738281,
                                    child: Stack(children: <Widget>[
                                      Positioned(
                                          top: 0,
                                          left: 0,
                                          child: Container(
                                              width: 276,
                                              height: 50.45454406738281,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(5),
                                                  topRight: Radius.circular(5),
                                                  bottomLeft:
                                                      Radius.circular(5),
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                                color: Color.fromRGBO(
                                                    63, 61, 86, 1),
                                              ))),
                                      Positioned(
                                          top: 3.69696044921875,
                                          left: 34,
                                          child: Container(
                                              width: 39,
                                              height: 42.18181610107422,
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 0,
                                                    left: 10,
                                                    child: Container(
                                                        width: 20,
                                                        height:
                                                            22.42424201965332,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/image/Tableware.png'),
                                                              fit: BoxFit
                                                                  .fitWidth),
                                                        ))),
                                                Positioned(
                                                    top: 22,
                                                    left: 0,
                                                    child: Text(
                                                      'MPASI',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height: 1),
                                                    )),
                                              ]))),
                                      Positioned(
                                          top: 3.69696044921875,
                                          left: 123,
                                          child: Container(
                                              width: 29,
                                              height: 42.18181610107422,
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 0,
                                                    left: 6,
                                                    child: Container(
                                                        width: 20,
                                                        height:
                                                            22.42424201965332,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/image/Babyapp.png'),
                                                              fit: BoxFit
                                                                  .fitWidth),
                                                        ))),
                                                Positioned(
                                                    top: 22,
                                                    left: 0,
                                                    child: Text(
                                                      'KMS',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height: 1),
                                                    )),
                                              ]))),
                                      Positioned(
                                          top: 3.69696044921875,
                                          left: 192,
                                          child: Container(
                                              width: 60,
                                              height: 42.18181610107422,
                                              child: Stack(children: <Widget>[
                                                Positioned(
                                                    top: 0,
                                                    left: 20,
                                                    child: Container(
                                                        width: 20,
                                                        height:
                                                            22.42424201965332,
                                                        decoration:
                                                            BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/image/Motherroom.png'),
                                                              fit: BoxFit
                                                                  .fitWidth),
                                                        ))),
                                                Positioned(
                                                    top: 22,
                                                    left: 0,
                                                    child: Text(
                                                      'Posyandu',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Color.fromRGBO(
                                                              255, 255, 255, 1),
                                                          fontFamily: 'Poppins',
                                                          fontSize: 12,
                                                          letterSpacing:
                                                              0 /*percentages not used in flutter. defaulting to zero*/,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          height: 1),
                                                    )),
                                              ]))),
                                    ]))),
                          ]))),
                ]))
          ],
        ),
      )),
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
