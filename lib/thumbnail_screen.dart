
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThumbnailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(title: Text("Thumbnails"),),
        body: Center(
          child: ElevatedButton(
            child: Text("Go to tag search"),
            onPressed: () {
              Navigator.pop(context);
            }
          ),
        ),
      ),
    );
  }
}
