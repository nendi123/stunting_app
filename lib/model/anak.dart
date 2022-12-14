import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class Anak {
  //id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir, persalinan_oleh, bb_lahir, panjang_lahir, prematur, usia_kehamilan
  final String id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir,
      persalinan_oleh, bb_lahir, panjang_lahir, prematur, usia_kehamilan, alergi, gol_darah,
      lingkar_kepala,tb_lahir;
  // final String id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir;

  Anak({
    required this.id_anak,
    required this.nik_ibu,
    required this.nama_lengkap,
    required this.jenis_kelamin,
    required this.tgl_lahir,
    required this.akte_lahir,
    required this.persalinan_oleh,
    required this.bb_lahir,
    required this.panjang_lahir,
    required this.prematur,
    required this.usia_kehamilan,
    required this.alergi,
    required this.gol_darah,
    required this.lingkar_kepala,
    required this.tb_lahir,
  });

  factory Anak.fromJson(Map<String, dynamic> json) {
    return Anak(
      id_anak: json['id_anak'],
      nik_ibu: json['nik_ibu'],
      nama_lengkap: json['nama_lengkap'],
      jenis_kelamin: json['jenis_kelamin'],
      tgl_lahir : json['tgl_lahir'],
      akte_lahir: json['akte_lahir'],
      persalinan_oleh: json['persalinan_oleh'],
      bb_lahir: json['bb_lahir'],
      panjang_lahir: json['panjang_lahir'],
      prematur: json['prematur'],
      usia_kehamilan: json['usia_kehamilan'],
      alergi: json['alergi'],
      gol_darah : json['gol_darah'],
      lingkar_kepala : json['lingkar_kepala'],
      tb_lahir : json['tb_lahir'],
    );
  }

  factory Anak.fromMap(Map<String, dynamic> json) => Anak(
    id_anak: json['id_anak'],
    nik_ibu: json['nik_ibu'],
    nama_lengkap: json['nama_lengkap'],
    jenis_kelamin: json['jenis_kelamin'],
    tgl_lahir : json['tgl_lahir'],
    akte_lahir: json['akte_lahir'],
    persalinan_oleh: json['persalinan_oleh'],
    bb_lahir: json['bb_lahir'],
    panjang_lahir: json['panjang_lahir'],
    prematur: json['prematur'],
    usia_kehamilan: json['usia_kehamilan'],
    alergi: json['alergi'],
    gol_darah : json['gol_darah'],
    lingkar_kepala : json['lingkar_kepala'],
    tb_lahir : json['tb_lahir'],
  );

}

List<Anak> petugasFromJson(jsonData) {
  List<Anak> result =
  List<Anak>.from(jsonData.map((item) => Anak.fromJson(item)));
  return result;
}

Future<List<Anak>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showAnak';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}

Future addAnak(Anak anak) async {
  String route = AppConfig.API_ENDPOINT + '/addAnak';
  // id_anak nik_ibu  nama_lengkap  jenis_kelamin  tgl_lahir  akte_lahir  persalinan_oleh bb_lahir panjang_lahir prematur usia_kehamilan
  try {
    final response = await http.post(
        Uri.parse(route),
        headers: {"Content-Type" : "application/json"},
        body: jsonEncode({'id_anak': anak.id_anak, 'nik_ibu': anak.nik_ibu, 'nama_lengkap' : anak.nama_lengkap, 'jenis_kelamin' : anak.jenis_kelamin, 'tgl_lahir' : anak.tgl_lahir,
          'akte_lahir' : anak.akte_lahir, 'persalinan_oleh' : anak.persalinan_oleh, 'bb_lahir' : anak.bb_lahir, 'panjang_lahir' : anak.panjang_lahir,
          'prematur' : anak.prematur, 'usia_kehamilan' : anak.usia_kehamilan, 'alergi' : anak.alergi, 'gol_darah' : anak.gol_darah,
          'tb_lahir' : anak.tb_lahir, 'lingkar_kepala' : anak.lingkar_kepala}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future editAnak(Anak anak) async {
  String route = AppConfig.API_ENDPOINT + '/editAnak';
  // id_anak nik_ibu  nama_lengkap  jenis_kelamin  tgl_lahir  akte_lahir  persalinan_oleh bb_lahir panjang_lahir prematur usia_kehamilan
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'id_anak': anak.id_anak, 'nik_ibu': anak.nik_ibu, 'nama_lengkap' : anak.nama_lengkap, 'jenis_kelamin' : anak.jenis_kelamin, 'tgl_lahir' : anak.tgl_lahir,
        'akte_lahir' : anak.akte_lahir, 'persalinan_oleh' : anak.persalinan_oleh, 'bb_lahir' : anak.bb_lahir, 'panjang_lahir' : anak.panjang_lahir,
        'prematur' : anak.prematur, 'usia_kehamilan' : anak.usia_kehamilan, 'alergi' : anak.alergi, 'gol_darah' : anak.gol_darah,
        'tb_lahir' : anak.tb_lahir, 'lingkar_kepala' : anak.lingkar_kepala}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future eraseAnak(int id_anak) async {
  String route = AppConfig.API_ENDPOINT + '/delAnak';
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