import 'dart:convert';

import 'package:http/http.dart' as http;

class SkriningModel {
  late String status;
  late bool statusInsert;

  SkriningModel({required this.status, required this.statusInsert});

  factory SkriningModel.responseApi(Map<String, dynamic> object) {
    return SkriningModel(
        status: object['Status'], statusInsert: object['status_insert']);
  }

  static Future<SkriningModel> addSkrining(
      String nikIbu,
      String idAnak,
      String tanggal,
      bool asiEksklusif,
      bool mpasi,
      bool pmt,
      bool pmtHabis,
      bool ditimbangPosyandu,
      bool zincDiare,
      bool pernahCacingan,
      bool obatCacingan,
      bool jambanKeluarga,
      bool pakaiJamban,
      bool septicTank,
      bool ibuCuciTangan,
      bool anakCuciTangan,
      bool treatmentHamil) async {
    var post = await http.post(
        Uri.parse("https://quantri.lipi.go.id/stunting/addSkrining"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "nik_ibu": nikIbu,
          "id_anak": idAnak,
          "tanggal": tanggal,
          "asi_eksklusif": asiEksklusif,
          "mpasi": mpasi,
          "pmt": pmt,
          "pmt_habis": pmtHabis,
          "ditimbang_posyandu": ditimbangPosyandu,
          "zinc_diare": zincDiare,
          "pernah_cacingan": pernahCacingan,
          "obat_cacingan": obatCacingan,
          "jamban_keluarga": jambanKeluarga,
          "pakai_jamban": pakaiJamban,
          "septic_tank": septicTank,
          "ibu_cuci_tangan": ibuCuciTangan,
          "anak_cuci_tangan": anakCuciTangan,
          "treatment_hamil": treatmentHamil
        }));

    if (post.statusCode == 201 || post.statusCode == 200) {
      var jsonObject = jsonDecode(post.body);
      SkriningModel loginModel =
          SkriningModel(status: jsonObject[0]['Status'], statusInsert: true);
      return loginModel;
    } else {
      SkriningModel loginModel = SkriningModel(status: '', statusInsert: false);
      return loginModel;
    }
  }
}
