import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class Posyandu {
  //kode_posyandu, kode_distrik, kode_kelurahan, nama_posyandu, alamat, ketua, kode_puskesmas
  late final String kode_posyandu, kode_distrik, kode_kelurahan, nama_posyandu, alamat, ketua, kode_puskesmas;
  Posyandu({
    required this.kode_posyandu,
    required this.kode_distrik,
    required this.kode_kelurahan,
    required this.nama_posyandu,
    required this.alamat,
    required this.ketua,
    required this.kode_puskesmas,
  });

  factory Posyandu.fromJson(Map<String, dynamic> json) {
    return Posyandu(
        kode_posyandu: json['kode_posyandu'],
        kode_distrik : json['kode_distrik'],
        kode_kelurahan: json['kode_kelurahan'],
        nama_posyandu: json['nama_posyandu'],
        alamat: json['alamat'],
        ketua: json['ketua'],
        kode_puskesmas: json['kode_puskesmas'],
    );
  }
}

List<Posyandu> petugasFromJson(jsonData) {
  List<Posyandu> result =
  List<Posyandu>.from(jsonData.map((item) => Posyandu.fromJson(item)));
  return result;
}

Future<List<Posyandu>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showPosyandu';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
