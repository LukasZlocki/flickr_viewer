import 'dart:convert';

import 'package:flickr_viewer/thumbnail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // controller to retrive data from txt field
  final txtController = TextEditingController();
  // tag with user value
  //String tag = "face";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Flickr viewer'),
          elevation: 3,
        ),
        body: Column(
          children: [
            TextField(
                controller: txtController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter tag')),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Search(txtController.text);
              },
                child: Text('Search')),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => ThumbnailScreen(
                                tag: txtController.text,
                                urlImgList: urlImgList,
                              ))));
                },
                child: Text("Switch Page")),
          ],
        ));
  }

  // list with json data with links to pics from uri
  List<dynamic> linksToPics = [];
  // list with uri links to pics
  List<String> urlImgList = [];

// https://api.flickr.com/services/feeds/photos_public.gne?tags=${this.tags}&format=json&nojsoncallback=1
 // String URL = "https://api.flickr.com/services/feeds/photos_public.gne?tags=face&format=json&nojsoncallback=1";
// search pictures
  void Search(String tag) async {
    String Url_part1 = 'https://api.flickr.com/services/feeds/photos_public.gne?tags=';
    String Url_part2 = '&format=json&nojsoncallback=1';
    String UrlFinal = Url_part1 + tag + Url_part2;

    print('fetching data from flickr');

    final uri = Uri.parse(UrlFinal);
    // code searching flickr resources
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      linksToPics = json['items'];
    });
    print('fetching completed');

    extract(linksToPics);
  }

  // extracting links to images from list of jsons to List of links
  void extract(List<dynamic> listToExtract) {
    for (var i = 0; i < listToExtract.length; i++){
      final data = linksToPics[i];
      final link_with_whiteNoise = data['media'];
      final link = link_with_whiteNoise['m'];
      urlImgList.add(link.toString());
    }
    print('rewriting list to new list with string url, completed.');
  }
}
