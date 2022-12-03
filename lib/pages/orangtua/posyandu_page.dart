import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:flutter_map/flutter_map.dart'; // Suitable for most situations
import 'package:flutter_map/plugin_api.dart'; // Only import if required functionality is not exposed by default
import 'package:latlong2/latlong.dart';

class PosyanduPage extends StatefulWidget {
  const PosyanduPage({super.key});

  @override
  State<PosyanduPage> createState() => _PosyanduPageState();
}

class _PosyanduPageState extends State<PosyanduPage> {

  final markers = <Marker>[
    Marker(
      width: 80,
      height: 80,
      point: LatLng(51.5, -0.09),
      builder: (ctx) => const FlutterLogo(
        textColor: Colors.blue,
        key: ObjectKey(Colors.blue),
      ),
    ),
    Marker(
      width: 80,
      height: 80,
      point: LatLng(53.3498, -6.2603),
      builder: (ctx) => const FlutterLogo(
        textColor: Colors.green,
        key: ObjectKey(Colors.green),
      ),
    ),
    Marker(
      width: 80,
      height: 80,
      point: LatLng(48.8566, 2.3522),
      builder: (ctx) => const FlutterLogo(
        textColor: Colors.purple,
        key: ObjectKey(Colors.purple),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
        // title: Text('Profile Petugas'),
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/profileAnak');
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
        'Lokasi Posyandu',
        style: TextStyle(
        fontWeight: FontWeight.w300,
        fontSize: 16
        ),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
        ),
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Text('This is a map that is showing (51.5, -0.9).'),
              ),
              Flexible(
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(51.5, -0.09),
                    zoom: 5,
                  ),
                  nonRotatedChildren: [
                    AttributionWidget.defaultWidget(
                      source: 'OpenStreetMap contributors',
                      onSourceTapped: () {},
                    ),
                  ],
                  children: [
                    TileLayer(
                      urlTemplate:
                      'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'dev.fleaflet.flutter_map.example',
                    ),
                    MarkerLayer(markers: markers),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}