import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginModel {
  late String userid;
  late String password;
  late String namaLengkap;
  late String nik;
  late String category;
  late bool status;
  late String kodePosyandu;

  LoginModel(
      {required this.userid,
      required this.password,
      required this.nik,
      required this.category,
      required this.namaLengkap,
      required this.status,
      required this.kodePosyandu});

  factory LoginModel.login(Map<String, dynamic> object) {
    return LoginModel(
        userid: object['userid'],
        password: object['password'],
        namaLengkap: object['nama_lengkap'],
        nik: object['nik'],
        category: object['category'],
        status: object['status'],
        kodePosyandu: object['kode_posyandu']);
  }

  static Future<LoginModel> loginApp(String userid, String password) async {
    var post = await http.post(
        Uri.parse("https://quantri.lipi.go.id/stunting/loginUser"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'userid': userid,
          'password': password,
          'category': '1'
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      var jsonObject = jsonDecode(post.body);
      LoginModel loginModel = LoginModel(
          userid: jsonObject[0]['userid'],
          password: jsonObject[0]['password'],
          nik: jsonObject[0]['nik'],
          category: jsonObject[0]['category'],
          namaLengkap: jsonObject[0]['nama_lengkap'],
          kodePosyandu: jsonObject[0]['kode_posyandu'],
          status: true);
      return loginModel;
    } else {
      LoginModel loginModel = LoginModel(
          userid: '',
          password: '',
          nik: '',
          category: '',
          namaLengkap: '',
          kodePosyandu: '',
          status: false);
      return loginModel;
    }
  }
}
