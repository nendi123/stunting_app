class IbuModel {
  late String nik;
  late String namaLengkap;
  late String tglLahir;
  late String alamat;
  late String noHp;
  late String kodeKelurahan;
  late String beratBadan;
  late String tinggiBadan;
  late String pendidikan;
  late String pekerjaan;
  late String statusNikah;
  late String jumlahAnak;
  late String memilikiKk;
  late String kodeDistrik;
  late String beratBadanAyah;
  late String tinggiBadanAyah;

  IbuModel(
      {required this.alamat,
      required this.beratBadan,
      required this.beratBadanAyah,
      required this.jumlahAnak,
      required this.kodeDistrik,
      required this.kodeKelurahan,
      required this.memilikiKk,
      required this.namaLengkap,
      required this.nik,
      required this.noHp,
      required this.pekerjaan,
      required this.pendidikan,
      required this.statusNikah,
      required this.tglLahir,
      required this.tinggiBadan,
      required this.tinggiBadanAyah});

  factory IbuModel.responseApi(Map<String, dynamic> object) {
    return IbuModel(
        nik: object['nik'],
        namaLengkap: object['nama_lengkap'],
        tglLahir: object['tgl_lahir'],
        alamat: object['alamat'],
        noHp: object['no_hp'],
        kodeKelurahan: object['kode_kelurahan'],
        beratBadan: object['berat_badan'],
        tinggiBadan: object['tinggi_badan'],
        pendidikan: object['pendidikan'],
        pekerjaan: object['pekerjaan'],
        statusNikah: object['status_nikah'],
        jumlahAnak: object['jumlah_anak'].toString(),
        memilikiKk: object['memiliki_kk'].toString(),
        kodeDistrik: object['kode_distrik'],
        beratBadanAyah: object['bb_ayah'].toString(),
        tinggiBadanAyah: object['tb_ayah'].toString());
  }
}
