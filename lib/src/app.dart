import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 1;
  String url = 'https://jsonplaceholder.typicode.com/photos/1';

  Future<void> fetchImage() async {
    var response = await http.get(url);
    var body = response.body;
    print(body);
    var decodedBody = jsonDecode(body);
    print(decodedBody['url']);
    print(decodedBody['title']);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.only(bottom: 10.0),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Text('$counter'),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text('NASA Astronomy Picture of the Day'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
