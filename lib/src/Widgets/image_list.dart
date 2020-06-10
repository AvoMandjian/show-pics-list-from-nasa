import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;
  ImageList({this.images});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return BuildImage(images: images[index]);
      },
    );
  }
}

class BuildImage extends StatelessWidget {
  const BuildImage({
    Key key,
    @required this.images,
  }) : super(key: key);

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
          Image.network(images.url),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(images.title),
          ),
        ],
      ),
    );
  }
}
