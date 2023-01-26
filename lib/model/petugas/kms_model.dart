class KmsModel {
  late String idAnak;
  late String tglRiwayat;
  late String tinggiBadan;
  late String beratBadan;
  late String bbUsia;
  late String tbUsia;
  late String lingkarKepala;
  late String riwayatDiare;
  late String riwayatIspa;
  late String bodyMas;

  KmsModel(
      {required this.idAnak,
      required this.tglRiwayat,
      required this.tinggiBadan,
      required this.beratBadan,
      required this.bbUsia,
      required this.tbUsia,
      required this.lingkarKepala,
      required this.riwayatDiare,
      required this.riwayatIspa,
      required this.bodyMas});
  factory KmsModel.responseApi(Map<String, dynamic> object) {
    return KmsModel(
        idAnak: object['id_anak'],
        tglRiwayat: object['tgl_riwayat'],
        tinggiBadan: object['tinggi_badan'],
        beratBadan: object['berat_badan'],
        bbUsia: object['bb_usia'],
        tbUsia: object['tb_usia'],
        lingkarKepala: object['lingkar_kepala'],
        riwayatDiare: object['riwayat_diare'],
        riwayatIspa: object['riwayat_ispa'],
        bodyMas: object['body_mass']);
  }
}
