import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class Kelurahan {
  // kode_kelurahan, kode_distrik, nama_kelurahan, alamat
<<<<<<< HEAD
  // final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;
  // Kelurahan({
  //   required this.kode_kelurahan,
  //   required this.kode_distrik,
  //   required this.nama_kelurahan,
  //   required this.alamat
  // });

  late final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;
=======
  final String kode_kelurahan, kode_distrik, nama_kelurahan, alamat;
>>>>>>> 8adec7f858b40a80bb88bc6ad11769efa5228c13
  Kelurahan(
      {required this.kode_kelurahan,
      required this.kode_distrik,
      required this.nama_kelurahan,
      required this.alamat});
<<<<<<< HEAD

=======
>>>>>>> 8adec7f858b40a80bb88bc6ad11769efa5228c13

  factory Kelurahan.fromJson(Map<String, dynamic> json) {
    return Kelurahan(
        kode_kelurahan: json['kode_kelurahan'],
        kode_distrik: json['kode_distrik'],
        nama_kelurahan: json['nama_kelurahan'],
        alamat: json['alamat']);
  }
}

List<Kelurahan> petugasFromJson(jsonData) {
  List<Kelurahan> result =
      List<Kelurahan>.from(jsonData.map((item) => Kelurahan.fromJson(item)));
  return result;
}

Future<List<Kelurahan>> fetchIbu() async {
  String route = '${AppConfig.API_ENDPOINT}/showKelurahan';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
