import 'package:flickr_viewer/image_screen.dart';
import 'package:flutter/material.dart';

class ThumbnailScreen extends StatelessWidget {
  const ThumbnailScreen(
      {super.key, required this.tag, required this.urlImgList});

  final String tag;
  final List<String> urlImgList;

  final String title = "Thumbnails: ";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Test screen",
      home: Scaffold(
        appBar: AppBar(
          title: Text(title + tag),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ImageButton(imgs: urlImgList),
            ),
            ElevatedButton(
                child: const Text("Back main page"),
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
                    String urlBigImg = ConvertLinkToBigImgUrl(imgs[index]);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) =>
                                ImageScreen(urlImg: urlBigImg))));
                  },
                  child: Image.network(imgs[index]),
                ),
              ))),
    );
  }

  // Converting url string with small img "_m" to url with big img "_b"
  String ConvertLinkToBigImgUrl(String url) {
    String _urlBigImg;
    _urlBigImg = url.replaceAll("_m", "_b");
    return _urlBigImg;
  }
}
