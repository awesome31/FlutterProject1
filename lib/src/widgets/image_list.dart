import 'package:flutter/material.dart';
import '../models/image_model.dart';

class ImageList extends StatelessWidget {
  final List<ImageModel> images;

  ImageList(this.images);

  Widget buildImage(ImageModel image) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Image.network(
            image.url,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Text(image.title)
        ],
      ),
      padding: EdgeInsets.all(20.0),
      decoration:
          BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) =>
          buildImage(images.elementAt(index)),
      itemCount: images.length,
    );
  }
}
