import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
          TagForm(),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: Search,
              child: Text('Search')),
        ],
      )
      );
  }

  // list with links to pics from uri
  List<dynamic> linksToPics = [];

// https://api.flickr.com/services/feeds/photos_public.gne?tags=${this.tags}&format=json&nojsoncallback=1
  String URL = "https://api.flickr.com/services/feeds/photos_public.gne?tags=face&format=json&nojsoncallback=1";
// search pictures
  void Search() async {
    print('fetching data from flickr');
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



class TagForm extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Enter tag'
              )
            ),
          ),
     // ElevatedButton(
     //     onPressed: Search,
     //     child: Text('search')),
         // ListView.builder(
             // itemCount: linksToPics.length,
              //itemBuilder: (context, index) {
               // final item = linksToPics[index];
                //final link = item['link']
           // return ListTile();
          //}),
      ],
    );
  }
}