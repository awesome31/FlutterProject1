import 'dart:convert';

/**
 * Import flutter helper library.
 * Create a class that will be our Custom Widget.
 * This class must extend the StatelessWidget Base class.
 * Must define a build method, that defines the Widgets that this Widget will show.
 */
import 'package:flutter/material.dart';
import 'package:http/http.dart' show get;
import './models/image_model.dart';
import './widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 1;
  List<ImageModel> images = [];

  void fetchImage() async {
    try {
      final res =
          await get('https://jsonplaceholder.typicode.com/photos/$counter');
      final imageModel = ImageModel.fromJson(json.decode(res.body));
      setState(() {
        images.add(imageModel);
      });
    } catch (e) {}

    counter++;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('Pictures application'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchImage,
          child: Icon(
            Icons.add,
          ),
        ),
      ),
    );
  }
}
