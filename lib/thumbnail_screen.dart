
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThumbnailScreen extends StatelessWidget {
    // add parameter with tag as a string
    const ThumbnailScreen({super.key, required this.tag});

    final String tag;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(title: Text("Thumbnails"),),
        body: Center(
          child: ElevatedButton(
            child: Text("Back main page"),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ),
      ),
    );
  }
}
