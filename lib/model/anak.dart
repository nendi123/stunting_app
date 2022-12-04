import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class Anak {
  //id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir, persalinan_oleh, bb_lahir, panjang_lahir, prematur, usia_kehamilan
  late final String id_anak, nik_ibu, nama_lengkap, jenis_kelamin, tgl_lahir, akte_lahir, persalinan_oleh, bb_lahir, panjang_lahir, prematur, usia_kehamilan;
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
    );
  }
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
