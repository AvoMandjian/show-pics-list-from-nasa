import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show get;
import 'dart:convert';
import './Widgets/image_list.dart';

import 'package:show_pics_list/src/models/image_model.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  List<ImageModel> images = [];

  Future<void> fetchImage() async {
    counter++;
    String url = 'https://jsonplaceholder.typicode.com/photos/$counter';
    var response = await http.get(url);
    var body = json.decode(response.body);
    print(body);
    var imageModel = ImageModel.fromJson(body);
    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(
          images: images,
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
