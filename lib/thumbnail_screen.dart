import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ThumbnailScreen extends StatefulWidget {
  const ThumbnailScreen(
      {super.key, required this.tag, required this.urlImgList});

  final String tag;
  //final List<dynamic> linksToPics;
  final List<String> urlImgList;

  @override
  State<ThumbnailScreen> createState() => _ThumbnailScreenState();
}

class _ThumbnailScreenState extends State<ThumbnailScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "thumbnails",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Thumbnails result for: ${widget.tag}"),
        ),
        body: Column(
          children: [
            ElevatedButton(
                child: Text("<- Back main page"),
                onPressed: () {
                  Navigator.pop(context);
                }),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: widget.urlImgList.length,
              itemBuilder: (context, index) {
                final link = widget.urlImgList[index];
                //final link2 = link['link'];
                return ListTile(
                  title: Text(link),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
