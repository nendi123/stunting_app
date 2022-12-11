import 'package:flutter/material.dart';
import 'package:stunting_app/model/anak.dart';
import 'package:stunting_app/pages/orangtua/detail_anak_page.dart';

class PostCard extends StatelessWidget {

  const PostCard({Key? key, required this.anak}) : super(key: key);
  final Anak anak;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   // context,
        //   // // MaterialPageRoute(
        //   // //   builder: ((context) {
        //   // //     // return DetailAnakPage(anak: anak);
        //   // //   }),
        //   // // ),
        // );
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(posts.id.toString()),
            Text(
              anak.nama_lengkap,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(anak.tgl_lahir),
          ],
        ),
      ),
    );
  }
}