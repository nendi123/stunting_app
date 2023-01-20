import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class Ibu {
  //nik, nama_lengkap, tgl_lahir, alamat, no_hp, kode_kelurahan, kode_distrik, berat_badan,
  // tinggi_badan, Pendidikan, pekerjaan, status_nikah, jumlah_anak, memiliki_kk
  final String nik, nama_lengkap, tgl_lahir, alamat, no_hp, kode_kelurahan, kode_distrik, berat_badan;
  final String tinggi_badan, pendidikan, pekerjaan, status_nikah, jumlah_anak, memiliki_kk;
  Ibu({
    required this.nik,
    required this.nama_lengkap,
    required this.tgl_lahir,
    required this.alamat,
    required this.no_hp,
    required this.kode_kelurahan,
    required this.kode_distrik,
    required this.berat_badan,
    required this.tinggi_badan,
    required this.pendidikan,
    required this.pekerjaan,
    required this.status_nikah,
    required this.jumlah_anak,
    required this.memiliki_kk,
  });

  factory Ibu.fromJson(Map<String, dynamic> json) {
    return Ibu(
      nik: json['nik'],
      nama_lengkap: json['nama_lengkap'],
      tgl_lahir : json['tgl_lahir'],
      alamat: json['alamat'],
      no_hp: json['no_hp'],
      kode_kelurahan: json['kode_kelurahan'],
      kode_distrik: json['kode_distrik'],
      berat_badan: json['berat_badan'],
      tinggi_badan: json['tinggi_badan'],
      pendidikan: json['pendidikan'],
      pekerjaan: json['pekerjaan'],
      status_nikah: json['status_nikah'],
      jumlah_anak: json['jumlah_anak'],
      memiliki_kk: json['memiliki_kk'],
    );
  }
}

List<Ibu> petugasFromJson(jsonData) {
  List<Ibu> result =
  List<Ibu>.from(jsonData.map((item) => Ibu.fromJson(item)));
  return result;
}

Future<List<Ibu>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showIbu';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}

Future editIbu(Ibu ibu) async {
  String route = AppConfig.API_ENDPOINT + '/editIbu';
  // nik, nama_lengkap, tgl_lahir, alamat, no_hp, kode_kelurahan, kode_distrik, berat_badan;
  // tinggi_badan, Pendidikan, pekerjaan, status_nikah, jumlah_anak, memiliki_kk

  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'nik': ibu.nik, 'nama_lengkap': ibu.nama_lengkap, 'tgl_lahir' : ibu.tgl_lahir, 'alamat' : ibu.alamat, 'no_hp' : ibu.no_hp,
        'kode_kelurahan' : ibu.kode_kelurahan, 'kode_distrik' : ibu.kode_distrik, 'berat_badan' : ibu.berat_badan, 'tinggi_badan' : ibu.tinggi_badan,
        'pendidikan' : ibu.pendidikan, 'pekerjaan' : ibu.pekerjaan, 'status_nikah' : ibu.status_nikah, 'jumlah_anak' : ibu.jumlah_anak,
        'memiliki_kk' : ibu.memiliki_kk}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future eraseIbu(String nik) async {
  String route = AppConfig.API_ENDPOINT + '/delIbu';
  // id_anak
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'nik': nik}),
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}
