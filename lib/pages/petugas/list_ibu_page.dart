import 'package:flutter/material.dart';
import 'package:stunting_app/shared/constant.dart';

class ListIbuPage extends StatefulWidget {
  const ListIbuPage({super.key});

  @override
  State<ListIbuPage> createState() => _ListIbuPageState();
}

class _ListIbuPageState extends State<ListIbuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton( //menu icon button at start left of appbar
          onPressed: (){
            //code to execute when this button is pressed
            Navigator.pushNamed(context, '/homePetugas');
          },
          icon: Icon(Icons.arrow_back, size: 20,),
        ),
        title: Text(
            'Ibu di Posyandu',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16
          ),
        ),
        toolbarHeight: 50,
        elevation: 30.0,
        actions: [ //actions widget in appbar
          IconButton(
              icon: Icon(Icons.search, size: 20,),
              onPressed: (){
                //code to execute when this button is pressed
              }
          ),
          //more widgets to place here
        ],

      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/background.jpeg'),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Constant().margin, vertical: 10),
              child: Card(
                  child: Column(
                children: [
                  ListTile(
                    // leading: Text('3217070508940008'),
                    title: Text(
                        '3217070508940008 \nIbu Siti',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () {},
                    ),
                  ),
                Divider(
                  color: Colors.black,
                  height: 5,
                ),
                  ListTile(
                    // leading: Text('3217070508940008'),
                    title: Text(
                      '3217070508940008 \nIbu Fulan binti Fulanah',
                      style: TextStyle(fontWeight: FontWeight.w300),
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, '/addIbu');
        },
      ),
    );
  }
}
