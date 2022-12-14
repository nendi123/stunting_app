import 'package:flutter/material.dart';
import 'package:stunting_app/model/anak.dart';
import 'package:stunting_app/shared/constant.dart';
import 'package:stunting_app/shared/config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class DashOrtuPage extends StatefulWidget {
  @override
  _DashOrtuPageState createState() => _DashOrtuPageState();
}

class _DashOrtuPageState extends State<DashOrtuPage> {
  // ScaffoldKey object. This is required
  // to show snackbar
  // This is optional. This is not required always
  late GlobalKey<ScaffoldState> _scaffoldKey;

  // Local State to display items in listview
  // late List<String> _demoData;

  // This method will run once widget is loaded
  // i.e when widget is mounting
  @override
  void initState() {
    // initializing states
    // _demoData = [
    //   "Flutter",
    //   "React Native",
    //   "Cordova/ PhoneGap",
    //   "Native Script"
    // ];

    setState(() {
      // _demoData = getData();
    });
    _scaffoldKey = GlobalKey();
    super.initState();
  }

  String user = '';
  String _nik = '';
  List<String>? _demoData;
  late final List<Anak> anak;


  Future<List<dynamic>> getData() async {
    final prefs = await SharedPreferences.getInstance();
    final nik = prefs.getString('nik');
    final userid = prefs.getString('userid');
    print(nik);
    print(userid);
    user = await userid!;
    _nik = await nik!;
    final response = await http.get(Uri.parse(AppConfig.API_ENDPOINT+'/showAnakIbu/'+nik!));
    return jsonDecode(response.body);
  }

  // This method will run when widget is unmounting
  @override
  void dispose() {
    // disposing states
    _scaffoldKey?.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title:  Text('Daftar Anak',
              style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16
          ),),
          toolbarHeight: 50,
          elevation: 10.0,

        ),
        // Widget to show RefreshIndicator
        body: RefreshIndicator(
          child: ListView.builder(
            // itemCount: _demodata.,
            itemBuilder: (ctx, idx) {
              // List Item
              return Card(
                child: ListTile(
                  // title: Text(_demoData),
                ),
              );
            },

            // Length of the list
            // itemCount: _demoData,

            // To make listView scrollable
            // even if there is only a single item.
            physics: const AlwaysScrollableScrollPhysics(),
          ),
          // Function that will be called when
          // user pulls the ListView downward
          onRefresh: () {
            return Future.delayed(
              Duration(seconds: 1),
                  () {
                /// adding elements in list after [1 seconds] delay
                /// to mimic network call
                ///
                /// Remember: [setState] is necessary so that
                /// build method will run again otherwise
                /// list will not show all elements
                setState(() {
                  // _demoData.addAll(["Ionic", "Xamarin"]);
                  // _demoData = getData();
                });

                // showing snackbar
                // _scaffoldKey.currentState?.showSnackBar(
                //   SnackBar(
                //     content: const Text('Page Refreshed'),
                //   ),
                // );
                  ScaffoldMessenger.of(context).showSnackBar( SnackBar( content: Text("Incremented"), duration: Duration(milliseconds: 300), ), );
                  },
            );
          },
        ),
      ),
    );
  }
}