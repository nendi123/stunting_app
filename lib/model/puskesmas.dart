import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class Puskesmas {
  // kode_puskesmas, kode_distrik, nama_puskesmas, alamat
  final String kode_puskesmas, kode_distrik, nama_puskesmas, alamat;
  Puskesmas({
    required this.kode_puskesmas,
    required this.kode_distrik,
    required this.nama_puskesmas,
    required this.alamat,
  });

  factory Puskesmas.fromJson(Map<String, dynamic> json) {
    return Puskesmas(
      kode_puskesmas: json['kode_puskesmas'],
      kode_distrik : json['kode_distrik'],
      nama_puskesmas: json['nama_puskesmas'],
      alamat: json['alamat'],
    );
  }
}

List<Puskesmas> petugasFromJson(jsonData) {
  List<Puskesmas> result =
  List<Puskesmas>.from(jsonData.map((item) => Puskesmas.fromJson(item)));
  return result;
}

Future<List<Puskesmas>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showPuskesmas';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
