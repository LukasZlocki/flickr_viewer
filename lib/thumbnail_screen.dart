
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThumbnailScreen extends StatefulWidget {
  const ThumbnailScreen({super.key, required this.tag});

  final String tag;

  @override
  State<ThumbnailScreen> createState() => _ThumbnailScreenState();
}

  class _ThumbnailScreenState extends State<ThumbnailScreen> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "route",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Thumbnails"),
        ),
        body: Center(
          child: ElevatedButton(
              child: Text("Back main page"),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
      ),
    );
  }

  // list with links to pics from uri
    List<dynamic> linksToPics = [];

    void Search(String tag) async {
      print('fetching data from flickr '+ tag);
      const URL = 'https://api.flickr.com/services/feeds/photos_public.gne?tags=face&format=json&nojsoncallback=1';
      final uri = Uri.parse(URL);
      // ToDO: code searching flickr resources here
      final response = await http.get(uri);
      final body = response.body;
      final json = jsonDecode(body);
      setState(() {
        linksToPics = json['items'];
      });
      print('fetching completed');
    }

  }


