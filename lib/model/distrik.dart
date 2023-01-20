import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class Distrik {
  // kode_distrik, nama_distrik, alamat
  final String kode_distrik, nama_distrik, alamat;
  Distrik({
    required this.kode_distrik,
    required this.nama_distrik,
    required this.alamat
  });

  factory Distrik.fromJson(Map<String, dynamic> json) {
    return Distrik (
        kode_distrik : json['kode_distrik'],
        nama_distrik: json['nama_distrik'],
        alamat: json['alamat']
    );
  }
}

List<Distrik> petugasFromJson(jsonData) {
  List<Distrik> result =
  List<Distrik>.from(jsonData.map((item) => Distrik.fromJson(item)));
  return result;
}

Future<List<Distrik>> fetchDistrik() async {
  String route = AppConfig.API_ENDPOINT + '/showDistrikAll';
  final response = await http.get(Uri.parse(route)).timeout(Duration(seconds: 1));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
