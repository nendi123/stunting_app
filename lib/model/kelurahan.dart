import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';


class Kelurahan {
  // kode_kelurahan, kode_distrik, nama_kelurahan, alamat

  // final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;
  // Kelurahan({
  //   required this.kode_kelurahan,
  //   required this.kode_distrik,
  //   required this.nama_kelurahan,
  //   required this.alamat
  // });

  // late final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;
  final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;

  Kelurahan(
      {required this.kode_kelurahan,
      required this.kode_distrik,
      required this.nama_kelurahan,
      required this.alamat});

  factory Kelurahan.fromJson(Map<String, dynamic> json) {
    return Kelurahan(
        kode_kelurahan: json['kode_kelurahan'],
        kode_distrik: json['kode_distrik'],
        nama_kelurahan: json['nama_kelurahan'],
        alamat: json['alamat']);
  }

  Map<String, dynamic> toJson() => {
    "kode_kelurahan": kode_kelurahan,
    "kode_distrik": kode_distrik,
    "nama_kelurahan": nama_kelurahan,
    "alamat": alamat,
  };
}

List<Kelurahan> kelurahanFromJson(jsonData) {
  List<Kelurahan> result =
      List<Kelurahan>.from(jsonData.map((item) => Kelurahan.fromJson(item)));
  return result;
}

Future<List<Kelurahan>> fetchKelurahan() async {
  String route = '${AppConfig.API_ENDPOINT}/showKelurahanAll';

  try {
    final response = await http.get(Uri.parse(route)).timeout(
        Duration(seconds: 1));

    if (response.statusCode == 200) {
      var jsonResp = json.decode(response.body);
      return kelurahanFromJson(jsonResp);
    } else {
      throw Exception('Failed load $route, status : ${response.statusCode}');
    }
  } catch(err) {
    return Future.error(err);
  }
}
