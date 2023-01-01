import 'package:flutter/material.dart';
import 'constant.dart';

class WidgetBaru {

  Widget _inputText(TextEditingController nama_control, String judul) {
    return new TextFormField(
      controller: nama_control,
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: judul,
          label: Text('$judul'),
          // labelText: datavalue,
          hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
          contentPadding: EdgeInsets.symmetric(
              horizontal: Constant().margin),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.white, width: 0.0),
          )
      ),

      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _inputNumeric(TextEditingController nama_control, String judul) {
    return new TextFormField(
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
                color: Colors.white, width: 0.0),
          )),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Harus diisi!';
        }
        return null;
      },
      keyboardType: TextInputType.number,
    );
  }
}
