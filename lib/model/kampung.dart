import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class Kampung {
  // kode_kampung, kode_kelurahan, kode_distrik, nama_kampung, kepala_kampung
  final String kode_kampung, kode_kelurahan, kode_distrik, nama_kampung, kepala_kampung;
  Kampung({
    required this.kode_kampung,
    required this.kode_kelurahan,
    required this.kode_distrik,
    required this.nama_kampung,
    required this.kepala_kampung
  });

  factory Kampung.fromJson(Map<String, dynamic> json) {
    return Kampung(
      kode_kampung: json['kode_kampung'],
      kode_kelurahan: json['kode_kelurahan'],
      kode_distrik : json['kode_distrik'],
      nama_kampung: json['nama_kampung'],
      kepala_kampung: json['kepala_kampung']
    );
  }
}

List<Kampung> petugasFromJson(jsonData) {
  List<Kampung> result =
  List<Kampung>.from(jsonData.map((item) => Kampung.fromJson(item)));
  return result;
}

Future<List<Kampung>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showKampung';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
