import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class ListAnakPage extends StatefulWidget {
  const ListAnakPage({super.key});

  @override
  State<ListAnakPage> createState() => _ListAnakPageState();
}

class _ListAnakPageState extends State<ListAnakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.grey.shade200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                child: Card(
                  child: Column(
                    children: [Text("Hasil Pencarian :"), Text("Nama Ibu")],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
