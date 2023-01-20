import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class Mpasi {
  //id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir, persalinan_oleh, bb_lahir, panjang_lahir, prematur, usia_kehamilan
  final String id, id_anak, waktu, jenis_mpasi;
  // final String id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir;

  Mpasi({
    required this.id,
    required this.id_anak,
    required this.waktu,
    required this.jenis_mpasi,
  });

  factory Mpasi.fromJson(Map<String, dynamic> json) {
    return Mpasi(
      id : json['id'],
      id_anak: json['id_anak'],
      waktu: json['waktu'],
      jenis_mpasi: json['jenis_mpasi'],
    );
  }

  factory Mpasi.fromMap(Map<String, dynamic> json) => Mpasi(
    id : json['id'],
    id_anak: json['id_anak'],
    waktu: json['waktu'],
    jenis_mpasi: json['jenis_mpasi'],
  );

}

List<Mpasi> mpasiFromJson(jsonData) {
  List<Mpasi> result =
  List<Mpasi>.from(jsonData.map((item) => Mpasi.fromJson(item)));
  return result;
}

Future<List<Mpasi>> fetchMpasi(String id_anak) async {
  String route = AppConfig.API_ENDPOINT + '/showMpasi/'+id_anak;
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return mpasiFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}

Future addMpasi(Mpasi mpasi) async {
  String route = AppConfig.API_ENDPOINT + '/addMpasi';
  // id_anak nik_ibu  nama_lengkap  jenis_kelamin  tgl_lahir  akte_lahir  persalinan_oleh bb_lahir panjang_lahir prematur usia_kehamilan
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'id' : mpasi.id, 'id_anak': mpasi.id_anak, 'waktu': mpasi.waktu, 'jenis_mpasi' : mpasi.jenis_mpasi}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future editMpasi(Mpasi mpasi) async {
  String route = AppConfig.API_ENDPOINT + '/editMpasi';
  // id_anak nik_ibu  nama_lengkap  jenis_kelamin  tgl_lahir  akte_lahir  persalinan_oleh bb_lahir panjang_lahir prematur usia_kehamilan
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'id': mpasi.id, 'id_anak': mpasi.id_anak, 'waktu': mpasi.waktu, 'jenis_mpasi' : mpasi.jenis_mpasi}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future eraseMpasi(int id) async {
  String route = AppConfig.API_ENDPOINT + '/delMpasi';
  // id_anak
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'id': id}),
    );
    return true;
  } catch (e) {
    print('Error : ${e.toString()}');
    return false;
  }
}