import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key, required this.urlImg});

  final String urlImg;

  final String title = "image screen";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test screen",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Image.network(urlImg),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
    },
              child: Text("Back to thumbnails page"),
    ),
          ],
      ),)
    );
  }
}
