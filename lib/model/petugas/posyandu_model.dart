class Posyandu {
  late String kodePosyandu;
  late String kodeKelurahan;
  late String kodeDistrik;
  late String namaPosyandu;
  late String alamat;
  late String ketua;
  late String kodePuskesmas;

  Posyandu(
      {required this.alamat,
      required this.ketua,
      required this.kodeDistrik,
      required this.kodeKelurahan,
      required this.kodePosyandu,
      required this.kodePuskesmas,
      required this.namaPosyandu});
  Posyandu.fromJson(Map<String, dynamic> json) {
    kodePosyandu = json['kode_posyandu'];
    kodeKelurahan = json['kode_kelurahan'];
    kodeDistrik = json['kode_distrik'];
    namaPosyandu = json['nama_posyandu'];
    alamat = json['alamat'];
    ketua = json['ketua'];
    kodePuskesmas = json['kode_puskesmas'];
  }

  factory Posyandu.responseApi(Map<String, dynamic> object) {
    return Posyandu(
        alamat: object['alamat'],
        ketua: object['ketua'],
        kodeDistrik: object['kode_distrik'],
        kodeKelurahan: object['kode_kelurahan'],
        kodePosyandu: object['kode_posyandu'],
        kodePuskesmas: object['kode_puskesmas'],
        namaPosyandu: object['nama_posyandu']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['kode_posyandu'] = kodePosyandu;
    data['kode_kelurahan'] = kodeKelurahan;
    data['kode_distrik'] = kodeDistrik;
    data['nama_posyandu'] = namaPosyandu;
    data['alamat'] = alamat;
    data['ketua'] = ketua;
    data['kode_puskesmas'] = kodePuskesmas;
    return data;
  }
}
