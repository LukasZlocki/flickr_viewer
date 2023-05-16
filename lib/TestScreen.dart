import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key, required this.tag, required this.urlImgList});

  final String tag;
  final List<String> urlImgList;

  final String title = "testing screen";


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test screen",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body:ImagePresenter(),
      ),);

  }
}

class ImagePresenter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Hello'
      ),
    );
  }

}
