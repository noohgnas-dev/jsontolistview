import 'package:flutter/material.dart';
import 'package:jsontolistview/photo.dart';

class DetailPage extends StatelessWidget {
  final Photo photo;
  DetailPage(this.photo);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo.title.toString()),
      ),
    );
  }
}
