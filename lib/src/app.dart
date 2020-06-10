import 'dart:math';

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
  int counter;
  int day;
  int month;
  int year;
  Random range = Random();
  List<ImageModel> images = [];

  Future<void> fetchImage() async {
    day = Random().nextInt(27) + 1;
    month = Random().nextInt(11) + 1;
    year = Random().nextInt(24) + 1996;
    String url =
        'https://api.nasa.gov/planetary/apod?api_key=EdFoey2wS4yeNEbpn9unZPWIbdBHKGhoa5nnQh85&date=$year-$month-$day';
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
          day: day,
          month: month,
          year: year,
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
