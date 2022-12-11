class PetugasModel {
  late String nik;
  late String kodePosyandu;
  late String namaLengkap;
  late String email;
  late String hp;
  late String alamat;
  late String kodePuskesmas;

  PetugasModel(
      {required this.alamat,
      required this.email,
      required this.hp,
      required this.kodePosyandu,
      required this.kodePuskesmas,
      required this.namaLengkap,
      required this.nik});

  factory PetugasModel.responseApi(Map<String, dynamic> object) {
    return PetugasModel(
        alamat: object['alamat'],
        email: object['email'],
        hp: object['no_hp'],
        kodePosyandu: object['kode_posyandu'],
        kodePuskesmas: object['kode_puskesmas'],
        namaLengkap: object['nama_lengkap'],
        nik: object['nik']);
  }
}
