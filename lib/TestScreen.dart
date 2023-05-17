import 'package:flickr_viewer/image_screen.dart';
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
        body: Column(
          children: <Widget>[
            Expanded(
                child:
                ImageButton(imgs: urlImgList),
            ),
            ElevatedButton(
                child: Text("<- Back main page"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            //ImageButton(imgs: urlImgList),
          ],
        ),
      ),
    );
  }
}

class ImageButton extends StatelessWidget {
  const ImageButton({super.key, required this.imgs});

  final List<String> imgs;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 1,
      children: List.generate(
          imgs.length,
              (index) => Center(
              child: GridTile(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ImageScreen(urlImg: imgs[index])
                    )));
                  },
                  child: Image.network(imgs[index]),
                ),
              ))),
    );
  }
}

