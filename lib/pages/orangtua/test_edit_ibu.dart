import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stunting_app/model/petugas/ibu_post_model.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/constant.dart';

class TestEditIbu extends StatefulWidget {
  const TestEditIbu({super.key, required this.nik});

  final String nik;

  @override
  State<TestEditIbu> createState() => _TestEditIbuState();
}

class _TestEditIbuState extends State<TestEditIbu> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: const Text('Edit Data Ibu',
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      body: SingleChildScrollView(

      ),
    );
  }

}