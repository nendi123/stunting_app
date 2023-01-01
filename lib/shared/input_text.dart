import 'package:flutter/material.dart';
import 'constant.dart';

class InputText extends StatelessWidget {

  InputText({required this.nama_control, required this.judul, required this.status});
  final String judul;
  final TextEditingController nama_control;
  final bool status;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0),
      child: TextFormField(
        readOnly: status,
        controller: nama_control,
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            hintText: judul,
            label: Text('$judul'),
            hintStyle: TextStyle(color: Colors.black38, fontSize: 12),
            // contentPadding: EdgeInsets.symmetric(horizontal: Constant().margin),
            contentPadding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
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
      ),
    );
  }
}