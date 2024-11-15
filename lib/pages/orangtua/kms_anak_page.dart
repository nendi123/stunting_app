import 'package:flutter/material.dart';
import 'package:stunting_app/pages/orangtua/riwayat_balita.dart';
import 'package:stunting_app/shared/constant.dart';
// import 'package:flutter_charts/flutter_charts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class KmsAnakPage extends StatefulWidget {
  const KmsAnakPage({Key ? key, required this.id_anak});
  final int id_anak;

  @override
  State<KmsAnakPage> createState() => _KmsAnakPagetate();
}

class _KmsAnakPagetate extends State<KmsAnakPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  late TabController _tabController;

  @override
  void initState() {
    _tabController =  TabController(length: 2, vsync: this);
    super.initState();
  }

  // Widget chartToRun() {
  //   LabelLayoutStrategy? xContainerLabelLayoutStrategy;
  //   ChartData chartData;
  //   ChartOptions chartOptions = const ChartOptions();
  //   // Example shows an explicit use of the DefaultIterativeLabelLayoutStrategy.
  //   // The xContainerLabelLayoutStrategy, if set to null or not set at all,
  //   //   defaults to DefaultIterativeLabelLayoutStrategy
  //   // Clients can also create their own LayoutStrategy.
  //   xContainerLabelLayoutStrategy = DefaultIterativeLabelLayoutStrategy(
  //     options: chartOptions,
  //   );
  //   chartData = ChartData(
  //     dataRows: const [
  //       [43.6, 44.7, 45.8, 46.7, 47.5, 48.3, 49.1, 49.8, 50.5, 51.2, 51.8, 52.4, 52.9, 53.5],
  //       [45.4, 46.6, 47.7, 48.6, 49.5, 50.3, 51.1, 51.8, 52.5, 53.2, 53.8, 54.4, 55, 55.6],
  //       [47.3, 48.4, 49.6, 50.5, 51.4, 52.3, 53.1, 53.8, 54.6, 55.2, 55.9, 56.5, 57.1, 57.7],
  //       [49.1, 50.3, 51.5, 52.5, 53.4, 54.2, 55.1, 55.8, 56.6, 57.3, 57.9, 58.6, 59.2, 59.8],
  //       [51, 52.2, 53.4, 54.4, 55.3, 56.2, 57.1, 57.8, 58.6, 59.3, 60, 60.7, 61.3, 61.9],
  //       [52.9, 54.1, 55.3, 56.3, 57.3, 58.2, 59, 59.9, 60.6, 61.4, 62.1, 62.7, 63.4, 64],
  //       [54.7, 56, 57.2, 58.2, 59.2, 60.1, 61, 61.9, 62.6, 63.4, 64.1, 64.8, 65.5, 66.1],
  //
  //     ],
  //     xUserLabels: const ['0','1','2','3','4','5','6','7','8','9','10','11','12','13','4','5','6'],
  //     dataRowsLegends: const [
  //       '3',
  //       '2',
  //       '0',
  //       '-2',
  //       '-3'
  //     ],
  //     chartOptions: chartOptions,
  //   );
  //   // chartData.dataRowsDefaultColors(); // if not set, called in constructor
  //   var lineChartContainer = LineChartTopContainer(
  //     chartData: chartData,
  //     xContainerLabelLayoutStrategy: xContainerLabelLayoutStrategy,
  //   );
  //
  //   var lineChart = LineChart(
  //     painter: LineChartPainter(
  //       lineChartContainer: lineChartContainer,
  //     ),
  //   );
  //   return lineChart;
  // }

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

  List<Data_tbu> datatbu = <Data_tbu>[
    Data_tbu(0, 45.4,	47.3,	49.1,	51,	52.9),
    Data_tbu(1, 46.6,	48.4,	50.3,	52.2,	54.1),
    Data_tbu(2, 47.7,	49.6,	51.5,	53.4,	55.3),
    Data_tbu(3, 48.6,	50.5,	52.5,	54.4,	56.3),
    Data_tbu(4, 49.5,	51.4,	53.4,	55.3,	57.3),
    Data_tbu(5, 50.3,	52.3,	54.2,	56.2,	58.2),
    Data_tbu(6, 51.1,	53.1,	55.1,	57.1,	59),
    Data_tbu(7, 51.8,	53.8,	55.8,	57.8,	59.9),
    Data_tbu(8, 52.5,	54.6,	56.6,	58.6,	60.6),
    Data_tbu(9, 53.2,	55.2,	57.3,	59.3,	61.4),
    Data_tbu(10,53.8,	55.9,	57.9,	60,	62.1),
    Data_tbu(11,54.4,	56.5,	58.6,	60.7,	62.7),
    Data_tbu(12,55,	  57.1,	59.2,	61.3,	63.4),
    Data_tbu(13,55.6,	57.7,	59.8,	61.9,	64),
  ];



  @override
  Widget build(BuildContext context) {
    final ColorScheme colors = Theme.of(context).colorScheme;

    var list = [
      {"tanggal": "20/08/2016","bb" : "30","tb":"50","lk":"50"},
      {"tanggal": "26/09/2016","bb" : "30","tb":"50","lk":"50"},
      {"tanggal": "18/10/2016","bb" : "30","tb":"50","lk":"50"}
    ];

    return Scaffold(
      appBar: AppBar(
        // title: Text('Profile Petugas'),
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            // Navigator.pushNamed(context, '/profileAnak');
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
          'KMS Anak',
          style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),
        ),
        toolbarHeight: 50,
        elevation: 10.0,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height /4,
              // child: Center(child: Text("Profile"),),
              // color: Colors.blue,
              child : Column(
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
              tabs: [
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
                // children: [Text('people'), Text('Person')],
                // children: [
                //   chartToRun(),
                //   chartToRun(),
                // ],
                children: [
                  Container(child: tbu(),),
                  // SizedBox(height: 5.0,),
                  Container(child: bbu(),),
                  Container(child: bbtb(),),
                  Container(child: lingkar_kepala(),),
                  Container(child: body_mass(),),
                  Expanded(
                    child: RiwayatBalitaPage(id_anak: widget.id_anak),
                    // child: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Table(
                    //     border: TableBorder.all(color: Colors.black38),
                    //     children: [
                    //       TableRow(
                    //         decoration: BoxDecoration(color: Colors.indigo, borderRadius: BorderRadius.circular(5)),
                    //         children: [
                    //           Column(
                    //             children: [
                    //               Text('\nTanggal',style: TextStyle(color: Colors.white),)
                    //             ],
                    //           ),
                    //           Column(
                    //             children: [
                    //               Text('Berat \n(kg)\n', style: TextStyle(color: Colors.white))
                    //             ],
                    //           ),
                    //           Column(
                    //             children: [
                    //               Text('Tinggi \n(cm)', style: TextStyle(color: Colors.white))
                    //             ],
                    //           ),
                    //           Column(
                    //             crossAxisAlignment: CrossAxisAlignment.center,
                    //             children: [
                    //               Text('Lingkar\nKepala \n(cm)', style: TextStyle(color: Colors.white))
                    //             ],
                    //           )
                    //         ]
                    //       ),
                    //       for(var item in list)
                    //       TableRow(
                    //         decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10.0)),
                    //         children: [
                    //           Column(children: [Text(item['tanggal']!,style: TextStyle(color: Colors.black54))],),
                    //           Column(children: [Text(item['bb']!, style: TextStyle(color: Colors.black54))],),
                    //           Column(children: [Text(item['tb']!, style: TextStyle(color: Colors.black54))],),
                    //           Column(children: [Text(item['lk']!, style: TextStyle(color: Colors.black54))],),
                    //         ],
                    //       )
                    //     ],
                    //   )
                    //   //Initialize the spark charts widget
                    //   // child: SfSparkLineChart.custom(
                    //   //   //Enable the trackball
                    //   //   trackball: SparkChartTrackball(
                    //   //       activationMode: SparkChartActivationMode.tap),
                    //   //   //Enable marker
                    //   //   marker: SparkChartMarker(
                    //   //       displayMode: SparkChartMarkerDisplayMode.all),
                    //   //   //Enable data label
                    //   //   labelDisplayMode: SparkChartLabelDisplayMode.all,
                    //   //   xValueMapper: (int index) => data[index].year,
                    //   //   yValueMapper: (int index) => data[index].sales,
                    //   //   dataCount: 5,
                    //   // ),
                    // ),
                  )
                ],
                controller: _tabController,
              ),
            ),
          ],
        ),


      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget tbu() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Tinggi Badan Sesuai Usia', textStyle: TextStyle(fontSize: 12)),
        legend: Legend(isVisible: true),
        // legend: Legend(
        //     isVisible: true,
        //     // Templating the legend item
        //     legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
        //       return Container(
        //           child: Container(
        //               child: Text('-3'))
        //       );
        //     }),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          StackedLineSeries<Data_bbu, String>(
            // groupName: 'Group A',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu databb, _) => databb.usia.toString(),
            yValueMapper: (Data_bbu databb, _) => databb.minsd3,
            color: Colors.black
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group B',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.minsd2,
            color: Colors.red
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group C',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd0,
            color: Colors.green
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group D',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd2,
            color: Colors.red
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group E',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd3,
            color: Colors.black
          ),
        ]
    );
  }

  Widget bbu() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Berat Badan sesuai Usia', textStyle: TextStyle(fontSize: 12)),
        legend: Legend(isVisible: true),
        // legend: Legend(
        //     isVisible: true,
        //     // Templating the legend item
        //     legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
        //       return Container(
        //           child: Container(
        //               child: Text('-3'))
        //       );
        //     }),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          StackedLineSeries<Data_bbu, String>(
            // groupName: 'Group A',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu databb, _) => databb.usia.toString(),
            yValueMapper: (Data_bbu databb, _) => databb.minsd3,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group B',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.minsd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group C',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd0,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group D',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group E',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd3,
          ),
        ]
    );
  }

  Widget bbtb() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Berat Badan terhadap Tinggi Badan (BB/TB)', textStyle: TextStyle(fontSize: 12)),
        legend: Legend(isVisible: true),
        // legend: Legend(
        //     isVisible: true,
        //     // Templating the legend item
        //     legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
        //       return Container(
        //           child: Container(
        //               child: Text('-3'))
        //       );
        //     }),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          StackedLineSeries<Data_bbu, String>(
            // groupName: 'Group A',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu databb, _) => databb.usia.toString(),
            yValueMapper: (Data_bbu databb, _) => databb.minsd3,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group B',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.minsd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group C',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd0,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group D',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group E',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd3,
          ),
        ]
    );
  }

  Widget lingkar_kepala() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: 'Lingkar Kepala', textStyle: TextStyle(fontSize: 12)),
        legend: Legend(isVisible: true),
        // legend: Legend(
        //     isVisible: true,
        //     // Templating the legend item
        //     legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
        //       return Container(
        //           child: Container(
        //               child: Text('-3'))
        //       );
        //     }),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          StackedLineSeries<Data_bbu, String>(
            // groupName: 'Group A',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu databb, _) => databb.usia.toString(),
            yValueMapper: (Data_bbu databb, _) => databb.minsd3,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group B',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.minsd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group C',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd0,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group D',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group E',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd3,
          ),
        ]
    );
  }

  Widget body_mass() {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        title: ChartTitle(text: '(Index Masa Tubuh sesuai Usia – IMTU', textStyle: TextStyle(fontSize: 12)),
        legend: Legend(isVisible: true),
        // legend: Legend(
        //     isVisible: true,
        //     // Templating the legend item
        //     legendItemBuilder: (String name, dynamic series, dynamic point, int index) {
        //       return Container(
        //           child: Container(
        //               child: Text('-3'))
        //       );
        //     }),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          StackedLineSeries<Data_bbu, String>(
            // groupName: 'Group A',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu databb, _) => databb.usia.toString(),
            yValueMapper: (Data_bbu databb, _) => databb.minsd3,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group B',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.minsd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            dataSource: databbu,
            // groupName: 'Group C',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd0,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group D',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd2,
          ),
          StackedLineSeries<Data_bbu, String>(
            groupName: 'Group E',
            // dataLabelSettings: DataLabelSettings(
            //     isVisible: true,
            //     useSeriesColor: true
            // ),
            dataSource: databbu,
            xValueMapper: (Data_bbu data, _) => data.usia.toString(),
            yValueMapper: (Data_bbu data, _) => data.sd3,
          ),
        ]
    );
  }
}


class Data_bbu{
  final int usia;
  final double? minsd3;
  final double? minsd2;
  final double? sd0;
  final double? sd2;
  final double? sd3;

  Data_bbu(this.usia, this.minsd3, this.minsd2, this.sd0, this.sd2, this.sd3);
  // Data_bbu(this.usia, this.minsd3, this.minsd2, this.sd0);
}

class Data_tbu{
  final int usia;
  final double? sd2neg;
  final double? sd1neg;
  final double? sd0;
  final double? sd2;
  final double? sd3;

  Data_tbu(this.usia, this.sd2neg, this.sd1neg, this.sd0, this.sd2, this.sd3);
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}