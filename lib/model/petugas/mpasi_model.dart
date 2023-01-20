class MpasiModel {

  late String id;
  late String id_anak;
  late String waktu;
  late String jenis_mpasi;

  MpasiModel({required this.id, required this.id_anak, required this.waktu, required this.jenis_mpasi});

  factory MpasiModel.responseApi(Map<String, dynamic> object) {
    return MpasiModel(
        id: object['id'].toString(),
        id_anak: object['id_anak'].toString(),
        waktu: object['waktu'].toString(),
        jenis_mpasi: object['jenis_mpasi'].toString()
    );
  }
}