import 'package:flutter/material.dart';

import 'constant.dart';

class InputDropDown extends StatelessWidget {

  InputDropDown({required this.nama_value, required this.data});
  final String nama_value, data;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: Colors.white,
      child: Center(
        child: DropdownButtonFormField(
          value: nama_value,
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(6.0))),
            label: Text("Distrik : $nama_value"),
          ),
          icon: const Icon(Icons.arrow_downward, size: 20,),
          elevation: 16,
          hint: Text("Distrik/Kecamatan ", style: TextStyle(color: Colors.black38),),
          style: const TextStyle(color: Colors.black54),
          items: Wilayah().namaDistrik.map((String val) {
            return DropdownMenuItem(
                value: val,
                child: Container(
                  child: Text(val),
                ));
          }).toList(),
          onChanged: (newValue2) {
            // setState(() {
            //   nama_value = newValue2.toString();
            // });
          },
        ),
      ),
    );
  }
}