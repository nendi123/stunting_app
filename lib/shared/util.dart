import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/pages/orangtua/login_orangtua_page.dart';
import 'package:stunting_app/pages/petugas/login_petugas_page.dart';
import 'package:stunting_app/shared/session.dart';

dialog(_context, msg, {title}) {
  showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title ?? 'Perhatian'),
          content: Text(msg),
        );
      }
  );
}

void logOut(BuildContext context) {

}

