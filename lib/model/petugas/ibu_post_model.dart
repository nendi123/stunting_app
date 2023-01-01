import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';

class IbuPostMode {
  late String status;

  IbuPostMode({required this.status});

  factory IbuPostMode.responseApi(Map<String, dynamic> object) {
    return IbuPostMode(status: object['Status']);
  }

  static Future<bool> addIbu(
      String nik,
      String nama,
      String alamat,
      String hp,
      String tglLahir,
      String kelurahan,
      String kecamatan,
      String pendidikan,
      String pekerjaan,
      String status,
      String beratBadan,
      String tinggiBadan,
      String statusKk,
      String kode_posyandu) async {
    var post =
        await http.post(Uri.parse("https://quantri.lipi.go.id/stunting/addIbu"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: jsonEncode(<String, dynamic>{
              "nik": nik,
              "nama_lengkap": nama,
              "tgl_lahir": tglLahir,
              "alamat": alamat,
              "no_hp": hp,
              "kode_kelurahan": kelurahan,
              "kode_distrik": kecamatan,
              "berat_badan": beratBadan,
              "tinggi_badan": tinggiBadan,
              "pendidikan": pendidikan,
              "pekerjaan": pekerjaan,
              "status_nikah": status,
              "jumlah_anak": 0,
              "memiliki_kk": statusKk,
              "kode_posyandu" : kode_posyandu
            }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editIbu(
      String nik,
      String nama,
      String alamat,
      String hp,
      String tglLahir,
      String kelurahan,
      String kecamatan,
      String pendidikan,
      String pekerjaan,
      String status,
      String beratBadan,
      String tinggiBadan,
      String statusKk,
      String kode_posyandu
      ) async {
    var post = await http.post(
        Uri.parse(AppConfig.API_ENDPOINT+"/editIbu"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "nik": nik,
          "nama_lengkap": nama,
          "tgl_lahir": tglLahir,
          "alamat": alamat,
          "no_hp": hp,
          "kode_kelurahan": kelurahan,
          "nama_kelurahan" : kelurahan,
          "kode_distrik": kecamatan,
          "nama_distrik": kecamatan,
          "berat_badan": beratBadan,
          "tinggi_badan": tinggiBadan,
          "pendidikan": pendidikan,
          "pekerjaan": pekerjaan,
          "status_nikah": status,
          "jumlah_anak": 0,
          "memiliki_kk": statusKk,
          "kode_posyandu" : kode_posyandu,
          "nama_posyandu" : kode_posyandu
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      print(post.statusCode);
      return true;
    } else {
      print(post.statusCode);
      return false;
    }
  }
}
