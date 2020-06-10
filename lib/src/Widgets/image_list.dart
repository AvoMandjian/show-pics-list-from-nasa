import 'package:flutter/material.dart';
import '../models/image_model.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageList extends StatelessWidget {
  final int day;
  final int month;
  final int year;

  final List<ImageModel> images;
  ImageList({this.images, @required this.day, this.month, this.year});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return BuildImage(
          images: images[index],
          day: day,
          year: year,
          month: month,
        );
      },
    );
  }
}

class BuildImage extends StatelessWidget {
  final int day;
  final int month;
  final int year;
  const BuildImage(
      {Key key,
      @required this.images,
      @required this.day,
      this.month,
      this.year})
      : super(key: key);

  final images;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(border: Border.all(color: Colors.black)),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$day/$month/$year'),
          Image.network(
            images.url,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                  child: SpinKitFadingFour(
                color: Colors.redAccent[400],
                size: 100,
              ));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(images.title),
          ),
        ],
      ),
    );
  }
}
