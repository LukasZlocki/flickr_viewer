import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          const TagForm(),
        ],
      )
      );
  }

}

// search pictures
void Search() {
// ToDO: code searching flickr resources here
}

class TagForm extends StatelessWidget {
  const TagForm({super.key});

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
      SizedBox(height: 20),
      ElevatedButton(
          onPressed: Search,
          child: Text('search'))
      ],
    );
  }

}