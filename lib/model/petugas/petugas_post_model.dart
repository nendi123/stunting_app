import 'dart:convert';
import 'package:http/http.dart' as http;

class PetugasPostMode {
  late String status;

  PetugasPostMode({required this.status});

  factory PetugasPostMode.responseApi(Map<String, dynamic> object) {
    return PetugasPostMode(status: object['Status']);
  }

  static Future<bool> editPetugas(
      String nik,
      String nama,
      String alamat,
      String email,
      String hp,
      String kodePuskesmas,
      String kodePosyandu) async {
    var post = await http.post(
        Uri.parse("https://quantri.lipi.go.id/stunting/editPetugasPosyandu"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "nik": nik,
          "kode_posyandu": kodePosyandu,
          "nama_lengkap": nama,
          "email": email,
          "no_hp": alamat,
          "alamat": hp,
          "kode_puskesmas": kodePuskesmas
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> editPasswordPetugas(
      String nik,
      String nama,
      String alamat,
      String email,
      String hp,
      String kodePuskesmas,
      String kodePosyandu) async {
    var post = await http.post(
        Uri.parse("https://quantri.lipi.go.id/stunting/editPetugasPosyandu"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "nik": nik,
          "kode_posyandu": kodePosyandu,
          "nama_lengkap": nama,
          "email": email,
          "no_hp": alamat,
          "alamat": hp,
          "kode_puskesmas": kodePuskesmas
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
