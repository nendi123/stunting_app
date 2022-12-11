import 'package:shared_preferences/shared_preferences.dart';
import 'package:stunting_app/model/userAuth.dart';
import 'package:stunting_app/model/petugas.dart';
import 'package:stunting_app/model/ibu.dart';

//userid, password, nama_lengkap, nik, category
const IS_LOGIN = 'IS_LOGIN';
const CATEGORY = 'CATEGORY';
const USERID = 'USERID';
const NIK = 'NIK';
const NAMA_LENGKAP = 'NAMA_LENGKAP';

enum jenislogin { PETUGAS, IBU }

Future createLoginSession(UserAuth userAuth) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setBool(IS_LOGIN, true);
  prefs.setString(NAMA_LENGKAP, userAuth.nama_lengkap);
  prefs.setString(CATEGORY, userAuth.category);
  prefs.setString(USERID, userAuth.userid);
  prefs.setString(NIK, userAuth.nik);
  return true;
}

Future clearSession() async {
  final prefs = await SharedPreferences.getInstance();
  prefs.clear();
  return true;
}