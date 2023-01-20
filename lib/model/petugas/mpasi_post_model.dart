import 'dart:convert';
import 'package:stunting_app/shared/config.dart';
import 'package:http/http.dart' as http;

class MpasiPostMpdel {
  late String status;

  MpasiPostMpdel({required this.status});

  factory MpasiPostMpdel.login(Map<String, dynamic> object) {
    return MpasiPostMpdel(status: object['Status']);
  }

  static Future<bool> addMpasi(String id_anak, String waktu, String jenis_mpasi) async {

    var post = await http.post(Uri.parse(AppConfig.API_ENDPOINT + "/addMpasi"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "id_anak": id_anak,
          "waktu": waktu,
          "jenis_mpasi": jenis_mpasi
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      print(post.statusCode);
      return true;
    } else {
      print(post.statusCode);
      return false;
    }
  }

  static Future<bool> editMpasi(String id, String id_anak, String waktu, String jenis_mpasi) async {
    var post = await http.post(
        Uri.parse(AppConfig.API_ENDPOINT+'/editMpasi'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "id" : id,
          "id_anak": id_anak,
          "waktu": waktu,
          "jenis_mpasi": jenis_mpasi
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}