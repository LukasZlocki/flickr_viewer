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
        body: ImagePresenter(imgs: urlImgList),
      ),
    );
  }
}

class ImagePresenter extends StatelessWidget {
  const ImagePresenter({super.key, required this.imgs});

  final List<String> imgs;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(
          imgs.length,
          (index) => Center(
                  child: GridTile(
                child: Image.network(imgs[index]),
              ))),
    );
  }
}
