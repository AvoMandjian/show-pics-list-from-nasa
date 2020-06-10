class ImageModel {
  String date;
  String url;
  String title;
  ImageModel({this.date, this.url, this.title});

  ImageModel.fromJson(Map parsedJson) {
    date = parsedJson['date'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
