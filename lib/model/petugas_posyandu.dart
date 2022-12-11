import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class PetugasPosyandu {
  // nik, kode_posyandu, nama_lengkap, email, no_hp, alamat, kode_puskesmas
  final String nik, kode_posyandu, nama_lengkap, email, no_hp, alamat, kode_puskesmas;
  PetugasPosyandu({
    required this.nik,
    required this.kode_posyandu,
    required this.nama_lengkap,
    required this.email,
    required this.no_hp,
    required this.alamat,
    required this.kode_puskesmas
  });

  factory PetugasPosyandu.fromJson(Map<String, dynamic> json) {
    return PetugasPosyandu(
      nik: json['nik'],
      kode_posyandu: json['kode_posyandu'],
      nama_lengkap: json['nama_lengkap'],
      email: json['email'],
      no_hp : json['no_hp'],
      alamat: json['alamat'],
      kode_puskesmas: json['kode_puskesmas']
    );
  }
}

List<PetugasPosyandu> petugasFromJson(jsonData) {
  List<PetugasPosyandu> result =
  List<PetugasPosyandu>.from(jsonData.map((item) => PetugasPosyandu.fromJson(item)));
  return result;
}

Future<List<PetugasPosyandu>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showPetugasPosyandu';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
