import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class Skrining {
  // nik_ibu, id_anak, tanggal, asi_eksklusif, mpasi, pmt, pmt_habis, ditimbang_posyandu,
  // zinc_diare, pernah_cacingan, obat_cacingan, jamban_keluarga, pakai_jamban, septic_tank,
  // ibu_cuci_tangan, anak_cuci_tangan, treatment_hamil
  final String nik_ibu, id_anak, tanggal, asi_eksklusif, mpasi, pmt, pmt_habis, ditimbang_posyandu;
  final String zinc_diare, pernah_cacingan, obat_cacingan, jamban_keluarga, pakai_jamban, septic_tank;
  final String ibu_cuci_tangan, anak_cuci_tangan, treatment_hamil;
  Skrining({
    required this.nik_ibu,
    required this.id_anak,
    required this.tanggal,
    required this.asi_eksklusif,
    required this.mpasi,
    required this.pmt,
    required this.pmt_habis,
    required this.ditimbang_posyandu,
    required this.zinc_diare,
    required this.pernah_cacingan,
    required this.obat_cacingan,
    required this.jamban_keluarga,
    required this.pakai_jamban,
    required this.septic_tank,
    required this.ibu_cuci_tangan,
    required this.anak_cuci_tangan,
    required this.treatment_hamil,
  });

  // nik_ibu, id_anak, tanggal, asi_eksklusif, mpasi, pmt, pmt_habis, ditimbang_posyandu,
  // zinc_diare, pernah_cacingan, obat_cacingan, jamban_keluarga, pakai_jamban, septic_tank,
  // ibu_cuci_tangan, anak_cuci_tangan, treatment_hamil
  factory Skrining.fromJson(Map<String, dynamic> json) {
    return Skrining(
      nik_ibu: json['nik_ibu'],
      id_anak: json['id_anak'],
      tanggal: json['tanggal'],
      asi_eksklusif: json['asi_eksklusif'],
      mpasi: json['mpasi'],
      pmt : json['pmt'],
      pmt_habis: json['pmt_habis'],
      ditimbang_posyandu: json['ditimbang_posyandu'],
      zinc_diare: json['zinc_diare'],
      pernah_cacingan: json['pernah_cacingan'],
      obat_cacingan: json['obat_cacingan'],
      jamban_keluarga : json['jamban_keluarga'],
      pakai_jamban: json['pakai_jamban'],
      septic_tank: json['septic_tank'],
      ibu_cuci_tangan: json['ibu_cuci_tangan'],
      anak_cuci_tangan: json['anak_cuci_tangan'],
      treatment_hamil: json['treatment_hamil'],
    );
  }
}

List<Skrining> petugasFromJson(jsonData) {
  List<Skrining> result =
  List<Skrining>.from(jsonData.map((item) => Skrining.fromJson(item)));
  return result;
}

Future<List<Skrining>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showSkrining';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
