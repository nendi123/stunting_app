import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class SettingData {
  // id, std_bb, std_tb, std_lingkar_kepala, std_lengan_atas, std_tbu, std_bbu, usia, jenis_kelamin
  final String id, std_bb, std_tb, std_lingkar_kepala, std_lengan_atas, std_tbu, std_bbu, usia, jenis_kelamin;
  SettingData({
    required this.id,
    required this.std_bb,
    required this.std_tb,
    required this.std_lingkar_kepala,
    required this.std_lengan_atas,
    required this.std_tbu,
    required this.std_bbu,
    required this.usia,
    required this.jenis_kelamin,
  });

  factory SettingData.fromJson(Map<String, dynamic> json) {
    return SettingData(
      id: json['id'],
      std_bb: json['std_bb'],
      std_tb : json['std_tb'],
      std_lingkar_kepala: json['std_lingkar_kepala'],
      std_lengan_atas: json['std_lengan_atas'],
      std_tbu: json['std_tbu'],
      std_bbu: json['std_bbu'],
      usia: json['usia'],
      jenis_kelamin: json['jenis_kelamin'],
    );
  }
}

List<SettingData> petugasFromJson(jsonData) {
  List<SettingData> result =
  List<SettingData>.from(jsonData.map((item) => SettingData.fromJson(item)));
  return result;
}

Future<List<SettingData>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showData';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
