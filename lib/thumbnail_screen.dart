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
    return Scaffold(
      appBar: AppBar(
        title: Text("Thumbnails result for: ${widget.tag}"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
            child: GridView.builder(
                itemCount: widget.urlImgList.length, //widget.urlImgList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    crossAxisSpacing: 10,
                    childAspectRatio: (1.0),
                    mainAxisExtent: 10
                ), itemBuilder: (BuildContext contex, int index) {
                  return Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                            image: NetworkImage(widget.urlImgList[index]),
                            )),
                  );
                })
      ),
    );
  }
}

// ************************************************

            /*
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
            */

//// pozostalosci
/*
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
            /*
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
            */
            //Image.network(widget.urlImgList[5]),
            GridView.builder(
 */