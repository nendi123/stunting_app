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
        title: Text('List Ibu Posyandu'),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/background.jpeg'),
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
                    leading: Text('3217070508940008'),
                    title: Text('Ibu Siti'),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.edit,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  ListTile(
                    leading: Text('3217070508940008'),
                    title: Text('Ibu Fulan'),
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
    );
  }
}
