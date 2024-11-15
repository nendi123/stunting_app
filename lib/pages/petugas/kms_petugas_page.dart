import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stunting_app/model/riwayat_balita.dart';
import 'package:stunting_app/shared/constant.dart';
// import 'package:flutter_charts/flutter_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stunting_app/shared/config.dart';
import 'package:stunting_app/shared/input_number.dart';

class KmsPetugasPage extends StatefulWidget {
  const KmsPetugasPage({super.key, required this.idanak});

  final String idanak;
  @override
  State<KmsPetugasPage> createState() => _KmsPetugasPageState();
}

class _KmsPetugasPageState extends State<KmsPetugasPage>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  late TabController _tabController;

  var list = [];

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _fetchAnak();
    _fetchRiwayat();
    super.initState();
  }

  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  List<Data_bbu> databbu = <Data_bbu>[
    Data_bbu(0, 2, 2.4, 3.2, 4.2, 4.8),
    Data_bbu(1, 2.1, 2.5, 3.3, 4.4, 5.1),
    Data_bbu(2, 2.3, 2.7, 3.6, 4.7, 5.4),
    Data_bbu(3, 2.5, 2.9, 3.8, 5, 5.7),
    Data_bbu(4, 2.7, 3.1, 4.1, 5.4, 6.1),
    Data_bbu(5, 2.9, 3.3, 4.3, 5.7, 6.5),
    Data_bbu(6, 3, 3.5, 4.6, 6, 6.8),
    Data_bbu(7, 3.2, 3.7, 4.8, 6.2, 7.1),
    Data_bbu(8, 3.3, 3.8, 5, 6.5, 7.3),
    Data_bbu(9, 3.5, 4, 5.2, 6.7, 7.6),
    Data_bbu(10, 3.6, 4.1, 5.4, 6.9, 7.8),
    Data_bbu(11, 3.8, 4.3, 5.5, 7.1, 8.1),
    Data_bbu(12, 3.9, 4.4, 5.7, 7.3, 8.3),
    Data_bbu(13, 4, 4.5, 5.8, 7.5, 8.5),
  ];

  var namaAnak = '';
  var idAnak = '';
  void _fetchAnak() async {
    // final response = await http
    //     .get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbu?nik=" + widget.nik));
    final response = await http
        .get(Uri.parse("${AppConfig.API_ENDPOINT}/showAnak/${widget.idanak}"));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      namaAnak = jsonResponse[0]['nama_lengkap'];
      idAnak = jsonResponse[0]['id_anak'].toString();
      setState(() {});
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }

  void _fetchRiwayat() async {
    // final response = await http
    //     .get(Uri.parse("${AppConfig.API_ENDPOINT}/showIbu?nik=" + widget.nik));
    final response = await http.get(Uri.parse(
        "${AppConfig.API_ENDPOINT}/showRiwayatBalita/" + widget.idanak));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      if (jsonResponse.isEmpty) {
        setState(() {});
      }
      for (var i = 0; i < jsonResponse.length; i++) {
        list.add({
          'tanggal': jsonResponse[i]['tgl_riwayat'],
          'bb': jsonResponse[i]['berat_badan'],
          'tb': jsonResponse[i]['tinggi_badan'],
          'lk': jsonResponse[i]['lingkar_kepala']
        });
      }
      setState(() {});
    } else {
      throw Exception('Failed to load jobs from API');
    }
    print(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('Profile Petugas'),
        leading: IconButton(
          //menu icon button at start left of appbar
          onPressed: () {
            //code to execute when this button is pressed
            // Navigator.pushNamed(context, '/profileAnak');
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
          ),
        ),
        title: Text(
          'KMS - $namaAnak',
          style: const TextStyle(fontWeight: FontWeight.w300, fontSize: 16),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              // child: Center(child: Text("Profile"),),
              // color: Colors.blue,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(
                          left: Constant().margin,
                          right: Constant().margin,
                          top: 30,
                          bottom: 10),
                    ),
                    const SizedBox(
                      height: 0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(40.0), //or 15.0
                            child: Container(
                              height: 120.0,
                              width: 120.0,
                              color: Colors.transparent,
                              child: Image.asset('assets/image/foto_anak.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
            TabBar(
              unselectedLabelColor: Colors.black,
              labelColor: Colors.red,
              tabs: const [
                Tab(
                  text: 'Grafik Pertumbuhan',
                  icon: Icon(Icons.add_chart),
                ),
                Tab(
                  icon: Icon(Icons.history),
                  text: 'Riwayat',
                )
              ],
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.tab,
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      title: ChartTitle(
                          text: 'BBU 13 minggu',
                          textStyle: const TextStyle(fontSize: 12)),
                      legend: Legend(isVisible: true),
                      tooltipBehavior: TooltipBehavior(enable: true),
                      series: <ChartSeries>[
                        StackedLineSeries<Data_bbu, String>(
                          // groupName: 'Group A',
                          // dataLabelSettings: DataLabelSettings(
                          //     isVisible: true,
                          //     useSeriesColor: true
                          // ),
                          dataSource: databbu,
                          xValueMapper: (Data_bbu databb, _) =>
                              databb.usia.toString(),
                          yValueMapper: (Data_bbu databb, _) => databb.minsd3,
                        ),
                        StackedLineSeries<Data_bbu, String>(
                          dataSource: databbu,
                          // groupName: 'Group B',
                          // dataLabelSettings: DataLabelSettings(
                          //     isVisible: true,
                          //     useSeriesColor: true
                          // ),
                          xValueMapper: (Data_bbu data, _) =>
                              data.usia.toString(),
                          yValueMapper: (Data_bbu data, _) => data.minsd2,
                        ),
                        StackedLineSeries<Data_bbu, String>(
                          dataSource: databbu,
                          // groupName: 'Group C',
                          // dataLabelSettings: DataLabelSettings(
                          //     isVisible: true,
                          //     useSeriesColor: true
                          // ),
                          xValueMapper: (Data_bbu data, _) =>
                              data.usia.toString(),
                          yValueMapper: (Data_bbu data, _) => data.sd0,
                        ),
                        StackedLineSeries<Data_bbu, String>(
                          groupName: 'Group D',
                          // dataLabelSettings: DataLabelSettings(
                          //     isVisible: true,
                          //     useSeriesColor: true
                          // ),
                          dataSource: databbu,
                          xValueMapper: (Data_bbu data, _) =>
                              data.usia.toString(),
                          yValueMapper: (Data_bbu data, _) => data.sd2,
                        ),
                        StackedLineSeries<Data_bbu, String>(
                          groupName: 'Group E',
                          // dataLabelSettings: DataLabelSettings(
                          //     isVisible: true,
                          //     useSeriesColor: true
                          // ),
                          dataSource: databbu,
                          xValueMapper: (Data_bbu data, _) =>
                              data.usia.toString(),
                          yValueMapper: (Data_bbu data, _) => data.sd3,
                        ),
                      ]),
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Table(
                          border: TableBorder.all(color: Colors.black38),
                          children: [
                            TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(5)),
                                children: [
                                  Column(
                                    children: const [
                                      Text(
                                        '\nTanggal',
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text('Berat \n(kg)\n',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text('Tinggi \n(cm)',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: const [
                                      Text('Lingkar\nKepala \n(cm)',
                                          style: TextStyle(color: Colors.white))
                                    ],
                                  )
                                ]),
                            for (var item in list)
                              TableRow(
                                decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(10.0)),
                                children: [
                                  Column(
                                    children: [
                                      Text(item['tanggal']!,
                                          style: const TextStyle(
                                              color: Colors.black54))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(item['bb']!,
                                          style: const TextStyle(
                                              color: Colors.black54))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(item['tb']!,
                                          style: const TextStyle(
                                              color: Colors.black54))
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(item['lk']!,
                                          style: const TextStyle(
                                              color: Colors.black54))
                                    ],
                                  ),
                                ],
                              )
                          ],
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Data Tumbuh Kembang',
        backgroundColor: Colors.green,
        onPressed: () {
          // Navigator.pushNamed(context, '/addIbu');
          _dialogKMS();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  TextEditingController tb = TextEditingController();
  TextEditingController bb = TextEditingController();
  TextEditingController tb_usia = TextEditingController();
  TextEditingController bb_usia = TextEditingController();
  TextEditingController lingkar_kepala = TextEditingController();
  TextEditingController body_mass = TextEditingController();

  void _dialogKMS() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0)),
            child: SingleChildScrollView(
              child: Container(
                height: 450,
                color: Colors.grey.shade200,
                child: Form(
                  key: _formKey,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: Constant().margin),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InputNumber(
                            nama_control: tb,
                            judul: 'Tinggi Badan',
                            status: false),
                        const SizedBox(
                          height: 10,
                        ),
                        InputNumber(
                            nama_control: bb,
                            judul: 'Berat Badan',
                            status: false),
                        const SizedBox(
                          height: 10,
                        ),
                        InputNumber(
                            nama_control: tb_usia,
                            judul: 'Tinggi Badan sesuai Usia',
                            status: false),
                        const SizedBox(
                          height: 10,
                        ),
                        InputNumber(
                            nama_control: bb_usia,
                            judul: 'Berat Badan sesuai Usia',
                            status: false),
                        const SizedBox(
                          height: 10,
                        ),
                        InputNumber(
                            nama_control: lingkar_kepala,
                            judul: 'Lingkar Kepala',
                            status: false),
                        const SizedBox(
                          height: 10,
                        ),
                        InputNumber(
                            nama_control: body_mass,
                            judul: 'Index Body mass (IBM)',
                            status: false),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              simpanKMS();
                              // Navigator.of(context).pop();
                            },
                            child: const Text("Simpan"))
                      ],
                    ),
                  ),
                ),
              ),
            ));
      },
    );
  }

  void simpanKMS() async {
    String tgl_skrg = DateFormat("dd/M/yyyy").format(DateTime.now());

    print(tgl_skrg);
    var riwayat_ispa = '2023-1-12';
    var riwayat_diare = '2023-1-12';

    final response = await addRiwayatBalita(RiwayatBalita(
        id_anak: widget.idanak,
        tgl_riwayat: tgl_skrg,
        tinggi_badan: tb.text,
        berat_badan: bb.text,
        bb_usia: bb_usia.text,
        tb_usia: tb_usia.text,
        lingkar_kepala: lingkar_kepala.text,
        riwayat_diare: riwayat_diare,
        riwayat_ispa: riwayat_ispa));

    if (response != null) {
      print(response.body.toString());
      if (response.statusCode == 200) {
        var jsonResp = jsonDecode(response.body);
        Navigator.pop(context, true);
      } else {
        Navigator.pop(context, "${response.body.toString()}");
      }
    }
  }
}

// ignore: camel_case_types
class Data_bbu {
  final int usia;
  final double? minsd3;
  final double? minsd2;
  final double? sd0;
  final double? sd2;
  final double? sd3;

  Data_bbu(this.usia, this.minsd3, this.minsd2, this.sd0, this.sd2, this.sd3);
  // Data_bbu(this.usia, this.minsd3, this.minsd2, this.sd0);
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
