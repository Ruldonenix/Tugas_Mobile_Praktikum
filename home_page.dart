import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'MY BINI'
        ),
        backgroundColor: Colors.blueGrey,
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              'Hu tao',
              style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              'Yor Forger',
              style: TextStyle(color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Icon(Icons.star, size: 50, color: Colors.blue),
            Text(
              'Youtsuba!',
              style: TextStyle(color: Colors.orange, fontSize: 100, fontWeight: FontWeight.normal),
            ),
            Icon(Icons.music_note, size: 50, color: Colors.deepPurple),
            Icon(Icons.favorite, size: 50, color: Colors.cyan),
          ],
        )
      )
      );
  }
}