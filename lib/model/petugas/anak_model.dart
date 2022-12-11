class AnakModel {
  late String idAdnak;
  late String nikIbu;
  late String namaLengkap;
  late String jenisKelamin;
  late String tglLahir;
  late String akteLahir;
  late String persalinanOleh;
  late String beratBadanLahir;
  late String panjangBadanLahir;
  late String prematur;
  late String usiaKehamilan;
  late String tinggiBadan;
  late String lingkarKepala;
  late String golDarah;
  late String alergi;

  AnakModel(
      {required this.akteLahir,
      required this.alergi,
      required this.beratBadanLahir,
      required this.golDarah,
      required this.idAdnak,
      required this.jenisKelamin,
      required this.lingkarKepala,
      required this.namaLengkap,
      required this.nikIbu,
      required this.panjangBadanLahir,
      required this.persalinanOleh,
      required this.prematur,
      required this.tglLahir,
      required this.tinggiBadan,
      required this.usiaKehamilan});

  factory AnakModel.responseApi(Map<String, dynamic> object) {
    return AnakModel(
        akteLahir: object['akte_lahir'].toString(),
        namaLengkap: object['nama_lengkap'].toString(),
        tglLahir: object['tgl_lahir'].toString(),
        nikIbu: object['nik_ibu'].toString(),
        idAdnak: object['id_anak'].toString(),
        jenisKelamin: object['jenis_kelamin'].toString(),
        beratBadanLahir: object['bb_lahir'].toString(),
        tinggiBadan: object['tinggi_badan'].toString(),
        panjangBadanLahir: object['panjang_lahir'].toString(),
        persalinanOleh: object['persalinan_oleh'].toString(),
        prematur: object['prematur'].toString(),
        usiaKehamilan: object['usia_kehamilan'].toString(),
        lingkarKepala: object['lingkar_kepala'].toString(),
        golDarah: object['golDarah'].toString(),
        alergi: object['alergi'].toString());
  }
}
