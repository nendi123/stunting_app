import 'dart:convert';
import 'package:stunting_app/shared/config.dart';
import 'package:http/http.dart' as http;

class AnakPostModel {
  late String status;

  AnakPostModel({required this.status});

  factory AnakPostModel.login(Map<String, dynamic> object) {
    return AnakPostModel(status: object['Status']);
  }

  static Future<bool> addAnak(
      String idAnak,
      String nikIbu,
      String namaLengkap,
      String jenisKelamin,
      String tglLahir,
      String akteLahir,
      String persalinanOleh,
      String bbLahir,
      String panjangLahir,
      String prematur,
      String usiaKehamilan) async {
    var _body = jsonEncode(<String, dynamic>{
      "id_anak": idAnak,
      "nik_ibu": nikIbu,
      "nama_lengkap": namaLengkap,
      "jenis_kelamin": jenisKelamin,
      "tgl_lahir": tglLahir,
      "akte_lahir": akteLahir,
      "persalinan_oleh": persalinanOleh,
      "bb_lahir": bbLahir,
      "panjang_lahir": panjangLahir,
      "prematur": prematur,
      "usia_kehamilan": usiaKehamilan
    });
    print(_body);
    var post = await http.post(
        // Uri.parse("https://quantri.lipi.go.id/stunting/addAnak"),
        Uri.parse(AppConfig.API_ENDPOINT+'/addAnak'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "id_anak": idAnak,
          "nik_ibu": nikIbu,
          "nama_lengkap": namaLengkap,
          "jenis_kelamin": jenisKelamin,
          "tgl_lahir": tglLahir,
          "akte_lahir": akteLahir,
          "persalinan_oleh": persalinanOleh,
          "bb_lahir": bbLahir,
          "panjang_lahir": panjangLahir,
          "prematur": prematur,
          "usia_kehamilan": usiaKehamilan
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editAnak(
      String idAnak,
      String nikIbu,
      String namaLengkap,
      String jenisKelamin,
      String tglLahir,
      String akteLahir,
      String persalinanOleh,
      String bbLahir,
      String panjangLahir,
      String prematur,
      String usiaKehamilan) async {
    var post = await http.post(
        Uri.parse(AppConfig.API_ENDPOINT+'/editAnak'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "id_anak": "",
          "nik_ibu": "",
          "nama_lengkap": "",
          "jenis_kelamin": "",
          "tgl_lahir": "",
          "akte_lahir": "",
          "persalinan_oleh": "",
          "bb_lahir": "",
          "panjang_lahir": "",
          "prematur": "",
          "usia_kehamilan": ""
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
