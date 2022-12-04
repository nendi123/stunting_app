import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class Kelurahan {
  // kode_kelurahan, kode_distrik, nama_kelurahan, alamat
  late final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;
  Kelurahan({
    required this.kode_kelurahan,
    required this.kode_distrik,
    required this.nama_kelurahan,
    required this.alamat
  });

  factory Kelurahan.fromJson(Map<String, dynamic> json) {
    return Kelurahan(
        kode_kelurahan: json['kode_kelurahan'],
        kode_distrik : json['kode_distrik'],
        nama_kelurahan: json['nama_kelurahan'],
        alamat: json['alamat']
    );
  }
}

List<Kelurahan> petugasFromJson(jsonData) {
  List<Kelurahan> result =
  List<Kelurahan>.from(jsonData.map((item) => Kelurahan.fromJson(item)));
  return result;
}

Future<List<Kelurahan>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showKelurahan';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
