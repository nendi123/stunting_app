import 'package:flutter/material.dart';
import 'constant.dart';

class InputEmail extends StatelessWidget {

  InputEmail({required this.nama_control, required this.judul, required this.status});
  final String judul;
  final TextEditingController nama_control;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: status,
      controller: nama_control,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: judul,
          label: Text('$judul'),
          hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Constant().margin),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.black87, width: 0.0),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harus diisi!';
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}