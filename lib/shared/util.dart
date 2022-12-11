<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/pages/orangtua/login_orangtua_page.dart';
import 'package:stunting_app/pages/petugas/login_petugas_page.dart';
import 'package:stunting_app/shared/session.dart';
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stunting_app/shared/session.dart';
import 'package:stunting_app/start_page.dart';

void logOut(BuildContext context) {
  clearSession().then((value) => Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
          pageBuilder: (BuildContext context, Animation animation, Animation secondaryAnimnation) {
            return StartPage();
          }, transitionsBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
            return new SlideTransition(position: new Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
              child: child,
            );
          }
      ),
      (route) => false));
}
>>>>>>> 4d5922c8532df708536ff1c9e1431acc11df9d73

dialog(_context, msg, {title}) {
  showDialog(
      context: _context,
      builder: (BuildContext context) {
        return AlertDialog(
<<<<<<< HEAD
          title: Text(title ?? 'Perhatian'),
          content: Text(msg),
        );
      }
  );
}

void logOut(BuildContext context) {

}

=======
          title: Text(title ?? 'Perhatian!'),
          icon: Icon(Icons.error, size: 48,),
          iconColor: Colors.red,
          content: Text(msg),
          elevation: 10.0,
        );
      },
  );
}
>>>>>>> 4d5922c8532df708536ff1c9e1431acc11df9d73
