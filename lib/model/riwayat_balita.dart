import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:ui';

class RiwayatBalita {
  //id_anak, tgl_riwayat, tinggi_badan, berat_badan, bb_usia, tb_usia, lingkar_kepala, riwayat_diare, riwayat_ispa
  final String id_anak, tgl_riwayat, tinggi_badan, berat_badan, bb_usia, tb_usia, lingkar_kepala, riwayat_diare, riwayat_ispa;
  RiwayatBalita({
    required this.id_anak,
    required this.tgl_riwayat,
    required this.tinggi_badan,
    required this.berat_badan,
    required this.bb_usia,
    required this.tb_usia,
    required this.lingkar_kepala,
    required this.riwayat_diare,
    required this.riwayat_ispa,
  });

  factory RiwayatBalita.fromJson(Map<String, dynamic> json) {
    return RiwayatBalita(
      id_anak: json['id_anak'],
      tgl_riwayat: json['tgl_riwayat'],
      tinggi_badan: json['tinggi_badan'],
      berat_badan: json['berat_badan'],
      bb_usia : json['bb_usia'],
      tb_usia: json['tb_usia'],
      lingkar_kepala: json['lingkar_kepala'],
      riwayat_diare: json['riwayat_diare'],
      riwayat_ispa: json['riwayat_ispa'],
    );
  }
}

List<RiwayatBalita> petugasFromJson(jsonData) {
  List<RiwayatBalita> result =
  List<RiwayatBalita>.from(jsonData.map((item) => RiwayatBalita.fromJson(item)));
  return result;
}

Future<List<RiwayatBalita>> showRiwayat(String id_anak) async {
  String route = AppConfig.API_ENDPOINT + '/showRiwayatBalita/'+id_anak;
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}

Future eraseRiwayat(String id_anak) async {
  String route = AppConfig.API_ENDPOINT + '/delRiwayatBalita';
  // id_anak
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'id_anak': id_anak}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future addRiwayatBalita(RiwayatBalita rb) async {
  String route = AppConfig.API_ENDPOINT + '/addRiwayatBalita';
  // id_anak, tgl_riwayat, tinggi_badan, berat_badan, bb_usia, tb_usia, lingkar_kepala, riwayat_diare, riwayat_ispa
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'id_anak': rb.id_anak, 'tgl_riwayat': rb.tgl_riwayat, 'tinggi_badan' : rb.tinggi_badan,
        'berat_badan': rb.berat_badan, 'bb_usia' : rb.bb_usia, 'tb_usia' : rb.tb_usia, 'lingkar_kepala' : rb.lingkar_kepala,
        'riwayat_diare': rb.riwayat_diare, 'riwayat_ispa': rb.riwayat_ispa}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}


