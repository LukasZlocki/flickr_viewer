import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ThumbnailScreen extends StatefulWidget {
  const ThumbnailScreen(
      {super.key, required this.tag, required this.linksToPics});

  final String tag;
  final List<dynamic> linksToPics;

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
              itemCount: widget.linksToPics.length,
              itemBuilder: (context, index) {
                final link = widget.linksToPics[index];
                final link2 = link['link'];
                return ListTile(
                  title: Text(link2),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
