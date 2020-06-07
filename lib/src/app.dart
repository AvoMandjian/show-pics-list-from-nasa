import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 1;

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
          onPressed: () {
            setState(() {
              counter++;
            });
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
