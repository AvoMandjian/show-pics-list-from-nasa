import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http show get;
import 'dart:convert';
import './Widgets/image_list.dart';
import './models/image_model.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int day;
  int month;
  int year;
  Random range = Random();
  List<ImageModel> images = [];
  ScrollController scrollController = ScrollController();

  Future<void> fetchImage() async {
    day = Random().nextInt(27) + 1;
    month = Random().nextInt(11) + 1;
    year = Random().nextInt(24) + 1996;
    String url =
        'https://api.nasa.gov/planetary/apod?api_key=EdFoey2wS4yeNEbpn9unZPWIbdBHKGhoa5nnQh85&date=$year-$month-$day';
    var response = await http.get(url);
    var body = json.decode(response.body);
    var imageModel = ImageModel.fromJson(body);
    // fetching json data from NASA

    setState(() {
      images.add(imageModel);
    });
    scrollController.animateTo(scrollController.position.maxScrollExtent * 2,
        duration: Duration(milliseconds: 1000), curve: Curves.bounceOut);
    var image = NetworkImage(body['url']);
    image.resolve(ImageConfiguration()).addListener(
      ImageStreamListener(
        (info, call) {
          scrollController.animateTo(
              scrollController.position.maxScrollExtent * 2,
              duration: Duration(milliseconds: 1000),
              curve: Curves.bounceOut);
        },
      ),
    );
    // adding the image with info to the list and autoscrolling
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(
          scrollController: scrollController,
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
