import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'dart:async';

class UserAuth {
  //userid, password, nama_lengkap, nik, category
  late final String userid, password, nama_lengkap, nik, category;
  UserAuth({
    required this.userid,
    required this.password,
    required this.nama_lengkap,
    required this.nik,
    required this.category,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) {
    return UserAuth(
      userid: json['userid'],
      password: json['password'],
      nama_lengkap: json['nama_lengkap'],
      nik: json['nik'],
      category : json['category'],
    );
  }
}

List<UserAuth> petugasFromJson(jsonData) {
  List<UserAuth> result =
  List<UserAuth>.from(jsonData.map((item) => UserAuth.fromJson(item)));
  return result;
}

Future<List<UserAuth>> fetchIbu() async {
  String route = AppConfig.API_ENDPOINT + '/showUser';
  final response = await http.get(Uri.parse(route));

  if (response.statusCode == 200) {
    var jsonResp = json.decode(response.body);
    return petugasFromJson(jsonResp);
  } else {
    throw Exception('Failed load $route, status : ${response.statusCode}');
  }
}
