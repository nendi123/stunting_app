import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class UserAuth {
  //userid, password, nama_lengkap, nik, category
  final String userid, password, nama_lengkap, nik, category;
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

List<UserAuth> userFromJson(jsonData) {
  List<UserAuth> result = List<UserAuth>.from((jsonData.map((item) => UserAuth.fromJson(item))));
  return result;
}

Future userCreate(UserAuth userAuth) async {
  String route = AppConfig.API_ENDPOINT + '/registerUser';
  try {
    final response = await http.post(
      Uri.parse(route),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode({'userid': userAuth.userid, 'password' : userAuth.password, 'nama_lengkap' : userAuth.nama_lengkap, 'nik' : userAuth.nik, 'category' : '2'})
    );
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future login(UserAuth userAuth) async {
  String route = AppConfig.API_ENDPOINT + '/loginUser';
  try {
    final response = await http.post(
        Uri.parse(route),
        headers: {"Content-Type" : "application/json", "accept" : "application/json",},
        body: jsonEncode({'userid': userAuth.userid, 'password' : userAuth.password,'category' : userAuth.category})
    );
    print(response.body.toString());
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}

Future ubahPassword(String userid, String password) async {
  String route = AppConfig.API_ENDPOINT + '/ubahPassword';
  try {
    final response = await http.post(
        Uri.parse(route),
        headers: {"Content-Type" : "application/json"},
        body: jsonEncode({'userid': userid, 'password' : password})
    );
    print(response.body.toString());
    return response;
  } catch (e) {
    print('Error : ${e.toString()}');
    return null;
  }
}
